---
layout: page
permalink: /about.html
title: 关于
tags: [关于, 博客, znfang, blog]
---

<!-- Language Selector -->
<select onchange= "onLanChange(this.options[this.options.selectedIndex].value)" style="height:32px">
    <option value="0" selected> 中文 Chinese </option>
    <option value="1"> 英语 English </option>
</select>

<!-- Chinese Version -->
<div class="zh post-container">
    <!-- 增加了自动统计博客数量的功能，原理参照总字数的统计 -->
    <blockquote>
        刺刀能杀人，文字也是
    </blockquote>
    <br>
    <h3>Why blog?</h3>
    <hr>
    <p>生命总是由不同的细节构成的，学会记录生活细节，丰满人生。
    本博客自2019年5月1日起开始运行至今，共
    {% assign papers = 0 %}
    {% for post in site.posts %}
    {% assign papers = papers | plus: 1 %}
    {% endfor %}
    {{ papers }}
    篇文章，总字数
    {% assign count = 0 %}
    {% for post in site.posts %}
    {% assign single_count = post.content | strip_html | strip_newlines | size %}
    {% assign count = count | plus: single_count %}
    {% endfor %}
    {% if count > 10000 %}
    {{ count | divided_by: 10000 }} 万 {{ count | modulo: 10000 }}
    {% else %}
    {{ count }}
    {% endif %}
    .</p>
    <br>
    <h3>Me</h3>
    <p>曾经热衷于机械，然后转行做后端，现在天天写Python</p>
    <p>书法、乐器、游泳、摄影，缺一而不能活</p>
    <p>年少时，游览过祖国的大好河山，毕业后，将计划走出国门</p>
    <p>浪费了太多的时间在选择上，该静下心来做点事情了</p>
    <br>
    <h3>赞赏奖励</h3>
        若您觉得鄙人所创造的内容对您有所帮助，可考虑略表心意，支持本博。
        以下是微信赞赏码：
    <img src="/img/wechat-reward.png" style="width:150px" />
    <br>
    <h3>Thanks</h3>
    <hr>
    <p>本博客的主题来自<a href="https://blog.fooleap.org/" target="_blank">fooleap</a>，很喜欢这种简单明快的风格。感谢jekyll、github pages。</p>

</div>

<!-- English Version -->
<div class="en post-container">
    <blockquote>
        Knives kill, so do words
    </blockquote>
    <br>      
    <h3>Why blog?</h3>
    <hr>
    <p>Life is always made up of different details. Learn to record the details of life and enrich life. 
    This blog has been running since May 1, 2019, with a total of 
    {% assign count = 0 %}
    {% for post in site.posts %}
    {% assign single_count = post.content | strip_html | strip_newlines | size %}
    {% assign count = count | plus: single_count %}
    {% endfor %} 
    {% if count > 1000 %}
    {{ count | divided_by: 1000 }}.{{ count | modulo: 1000 }}k
    {% else %}
    {{ count }}
    {% endif %}words and 
    {% assign papers = 0 %}
    {% for post in site.posts %}
    {% assign papers = papers | plus: 1 %}
    {% endfor %} 
    {{ papers }}
    articles.
    </p>
    <br>
    <h3>Me</h3>
     <p>Once used to be enthusiastic about machinery, and then turned to back-end, but now write Python every day</p>
    <p>Calligraphy, musical instruments, swimming, photography, cannot live without any of them</p>
    <p>When I was young, I visited the great rivers and mountains of my motherland. After graduation, I plan to go abroad.</p>
    <p>Wasting too much time on choices, it's time to settle down and do something.</p> 
    <br>     
    <h3>Thanks</h3>
    <hr>
    <p>The theme of this blog is from <a href="https://blog.fooleap.org/" target="_blank">fooleap</a>. I like this simple and lively style very much. Thanks to Jekyll and Github pages.</p>   
</div>

<!-- Handle Language Change -->
<script type="text/javascript">
    var $zh = document.querySelector(".zh");
    var $en = document.querySelector(".en");
    function onLanChange(index){
        if(index == 0){
            $zh.style.display = "block";
            $en.style.display = "none";
        }else{
            $en.style.display = "block";
            $zh.style.display = "none";
        }
    }
    onLanChange(0);
</script>


