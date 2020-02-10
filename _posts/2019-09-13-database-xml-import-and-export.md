---
layout: post 
title: "数据库与xml文件导入导出"
thumb: /img/in-post/thumbs/java.png
category: tech
tags:  "java xml database"
---
# 前言
由于最近项目需要用到文件的导入导出，最常用的导入导出方式便是excel文件的导入导出，但是由于excel的单元格对字符有限制，最大只能容纳32767个字符，所以对于太长的字符就会被截断，而xml是文本文件，不会存在字符截断的问题，同时为了与阿里的easyexcel兼容，采用注解的方式对xml文件进行读写。
# 依赖文件
对于xml文件的读写，本文采用domn4j的读写方式，具体的使用可以上网查询关于dom4j的博客或者官网，本文在此不做过多赘述。
# xml文件格式
以下是常规的xml文件格式
```
<tables>
  <table name="user">
    <row>
      <userId>znfang</userId>
      <pwd>123</pwd>
    </row>
  </table>
</tables>
```
这种格式的xml文件，列名是根据类的属性名完全一致，且类中的所有的属性都会被写入，无法灵活的使用某些属性导入或导出，因此将xml文件格式改成如下形式
```
<tables>
  <table name="user">
    <row>
      <col name="userId">znfang</col>
      <col name="pwd">123</col>
    </row>
  <table>
<tables>
```
设计成上述格式后，可以对类中的属性灵活使用注解来区分哪些属性需要导入导出，同时可以将多张表导入导出到同一个xml文件
# 技术原理
## 注解类
注解是java的一个特性，可以定义注解来对代码进行更好的解释，使得代码更加简洁。xml的注解类定义如下：
```
/**
 * xml属性注解类
 * @author znfang
 * @Date 2019/8/27
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface XmlProperty{
  String value() default "";
}
```
## 实体类
```
import lombok.Getter;
import lombok.Setter;

/**
 * user实体类
 * @author znfang
 * @Date 2019/8/27
@Getter
@Setter
public class User{
    @XmlProperty(value="userId")
    private String userId;
    @XmlProperty(value="pwd")
    private String pwd;

    private String description;
}
```
实体类是与数据库表对应的，一般一个属性对应一个数据库表的字段，同时需要实现get和set方法，本文采用的Setter和Getter注解可以为类中所有的属性自动生成set和get方法，但是需要安装lombok插件，如果没有安装此插件，则需要自己书写这两个方法。XmlProperty是xml的注解，如果需要导入导出，则在属性上添加这个注解即可
## xml文件操作类
xml文件操作主要是读写两个操作，为了便于操作，本文将xml的读写操作都用map来进行，主要实现代码如下
```
/**
 * 写入xml文件操作
 * @param tables xml文件的数据，map类型
 * @return 是否写入成功
 */
public static boolean writeXml(Map<String,List<? extends XmlBaseModel>> tables){
  Document document = createXml(tables);
  try{
    FileWriter fileWriter = new FileWriter("./user.xml");
    OutputFormat outputFormat = new OutputFormat();
    outputFormat.setIndent(true);
    outputFormat.setNewLines(true);
    XMLWriter xmlWriter = new XmlWriter(fileWriter,outputFormat);
    xmlWriter.write(document);
    fileWriter.close();
    xmlWriter.close();
  }catch(IOException e){
    System.out.println("将xml文件写入文件流失败");
    return false;
  }
  return true;
}
/**
 * 创建xml文件
 * @param tables 创建xml文件所需要的数据
 * @return xml文件
 */
private static Document createXml(Map<String,List<? extends XmlBaseModel>> tables){
  Document document = DocumentHelper.createDocument();
  Element root = document.addElement("tables");
  for(Map.Entry<String,List<? extends XmlBaseModel>> table:tables.entrySet()){
    Class<? extends XmlBaseModel> clazz = table.getValue.get(0).getClass();
    String name = clazz.getSimpleName();
    Field[] fields = clazz.getDeclaredFields();
    Element eTable = root.addElement("table").addAttribute("name",name);
    for(int i = 0; i < table.getValue().size(); i++){
      Element row = eTable.addElement("row");
      for(int k = 0; k < fields.length; k++){
        XmlProperty p = fields[k].getAnnotation(XmlProperty.class);
        if(p != null){
          String str = null;
          try{
            str = BeanUtils.getProperty(table.getValue().get(i),fields[k].getName());
          }catch(Exception e){
            System.out.println("根据实体类:"+name+":"+fields[k].getName()+"创建xml文件失败");
          }
          str = str == null ? "" : str.trim();
          row.addElement("col").addAttribute("name",p.value().addText(str));
        }
      }
    }
  }
  return document;
}
/**
 * 读取xml文件
 * @param xml xml文件，如果是前后台交互，是MultipartFile类型
 * @return 各个table的链表
 */
public static Map<String,List<? extends XmlBaseModel>> readXml(String xml){
  InputStream inputStream = null;
  String baseClass = "znfang.imexport.entity";
  Map<String,List<? extends XmlBaseModel>> map = new HashMap<>();
  try{
    inputStream = XmlUtilTest.class.getClassLoader.getResourceAsStream(xml);
    SAXReader reader = new SAXReader();
    Document document = reader.read(inputStream);
    Element root = document.getRootElement();
    List<Element> tables = root.elements();
    for(Element table:tables){
      String name = table.attributeValue("name");
      List<XmlBaseMode> models = new ArrayList<>();
      List<Element> rows = table.elements();
      for(Element row:rows){
        Class clazz = Class.forName(baseClass+name);
        Field[] fields = clazz.getDeclaredFields();
        Map<String,String> fieldMap = getProperty(fields);
        XmlBaseModel model = (XmlBaseModel)clazz.newInstance();
        List<Element> cols = row.elements();
        for(Element col:cols){
          String attr = col.attributeValue("name");
          BeanUtils.setProperty(model,fieldMap.get(attr),col.getText().trim());
        }
        models.add(model);
      }
      map.put(name,models);
    }
  }catch(Exception e){
    System.out.println("解析xml文件失败"+e);
    map = null;
  }
  return map;
}

/**
 * 获取实体类中注解的属性
 * @param fields 实体类所有的属性
 * @return 用xmlProperty注解过的属性map
 */
private static Map<String,String> getProperty(field[] fields){
  Map<String,String> map = new HashMap<>();
  for(int i = 0; i < fields.length; i++){
    XmlProperty p = fields[i].getAnnotation(XmlPropety.class);
    if(p!=null){
      map.put(p.value(),fields[i].getName());
    }
  }
  return map;
}
```
## 测试类
```
@Test
public void writeXmlTest(){
  List<User> users = new ArrayList<>();
  for(int i = 0; i < 2; i++){
    User user = new User();
    User.setUserId("123");
    User.setPwd("znfang");
    users.add(user);
  }
  Map<String,List<? extends XmlBaseModel>> map = new HashMap<>();
  map.put(User.class.getSimpleName(),users);
  XmlUtil.writeXml(map);
}
@Test
public void readXmlTest(){
  Map<String,List<? extends XmlBaseModel>> map = XmlUtil.readXml("user.xml");
  for(Map.Entry<String,List<? extends XmlBaseModel>> table:map.entrySet()){
    System.out.println(table.getValue().get(i));
  }
}
```
输出结果如下：
```
<tables>
  <table name="user">
    <row>
      <col name="userId">123</col>
      <col name="pwd">znfang23</col>
    </row>
    <row>
      <col name="userId">123</col>
      <col name="pwd">znfang</col>
    </row>
  <table>
<tables>
```
# 总结
数据导入导出是在数据交互中较为频繁的操作，之前使用阿里的easyexcel来操作excel的读写，实在是很方便，但是这个组件不是特别稳定，博主在使用的时候，对于07以上版本的excel解析时会出错，另外经过试验对比，对于07版本以下的excel文件导入导出，其输出文件会比本文采用的xml文件导入导出大那么一点，所以相对来说，这个xml的读写操作还是相对比较简单易行的。