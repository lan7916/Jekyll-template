---
layout: page
permalink: /guestbook.html
title: 留言本
tags: [留言]
---

<div class="comment-tips">
  各位看官请畅所欲言，但禁止违法，谢谢合作。
</div>
<div id="vcomments"></div>
<script src='//unpkg.com/valine/dist/Valine.min.js'></script>
<script>
  new Valine({
    el: '#vcomments',
    appId: "{{site.valine_appid}}",
    appKey: "{{site.valine_appkey}}"
  })
</script>

{% if site.disqus_on %}
  <!-- disqus 评论框 start -->
  <div class="comment">
      <div id="disqus_thread" class="disqus-thread"></div>
  </div>
  <!-- disqus 评论框 end -->

  <!-- disqus 公共JS代码 start (一个网页只需插入一次) -->
  <script type="text/javascript">
      /* * * CONFIGURATION VARIABLES * * */
      var disqus_shortname = "{{site.disqus_username}}";
      var disqus_identifier = "{{page.id}}";
      var disqus_url = "{{site.url}}{{page.url}}";

      (function() {
          var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
          dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
          (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      })();
  </script>
  <!-- disqus 公共JS代码 end -->
{% else %}
  <!-- <div class="comment-tips">评论留言功能已关闭</div> -->
{% endif %}