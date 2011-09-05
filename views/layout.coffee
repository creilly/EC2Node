doctype 5
html ->
  head ->
    title #{@title}
    (link rel: 'stylesheet', href: ref) for ref in [
      'http://twitter.github.com/bootstrap/assets/css/bootstrap-1.2.0.min.css',
      '/impromptu/default.css',
      '/stylesheets/style.css'
      ]
    (script type: 'text/javascript', src: src) for src in [
      'http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js',
      '/impromptu/jquery-impromptu.js',
      '/nowjs/now.js',
      '/javascripts/' + @pagescript
      ]
  body ->
    div '.topbar', ->
      div '.fill', ->
        div '.container', ->
          h3 ->
            a href: '#', ->
              'Cat Mat'
    div '.container', ->
      @body
    footer ->
      'Djet Filipe Productiones'
    div '#buttons', ->
     text  '''
<!-- Floating social media buttons by ehowportal.blogspot.com--><style>
#floatingbuttons{background:#F9F9F9;background:-webkit-gradient(linear, left top, left bottom, color-stop(0, #fff), color-stop(1, #F9F9F9));background:-moz-linear-gradient(top, #fff, #F9F9F9);border:1px solid #ccc;float:left;padding:0 0 3px 0;position:fixed;bottom:15%;left:0;z-index:10;border-radius:0 5px 5px 0;box-shadow:2px 2px 5px rgba(0,0,0,0.3);} #floatingbuttons .floatbutton{float:left;clear:both;margin:5px 4px 0 4px;} .addbuttons{clear:both;text-align:center;padding-top:5px;} .addbuttons a span.getfloat, .addbuttons a span.sharebuttons{color:#000;background:none;font-family:arial, sans-serif;display:block;font-size:9px;font-weight:bold;text-decoration:none;line-height:11px;} .addbuttons a:hover span{color:#fff;background:none;text-decoration:underline;}</style>
<div id='floatingbuttons' title="Share this post!"><script type="text/javascript"> (function() { var s = document.createElement('SCRIPT'), s1 = document.getElementsByTagName('SCRIPT')[0]; s.type = 'text/javascript'; s.async = true; s.src = 'http://widgets.digg.com/buttons.js'; s1.parentNode.insertBefore(s, s1); })(); </script><!-- Medium Button --><script src='http://platform.twitter.com/widgets.js' type="text/javascript"></script>
<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><div class='floatbutton' id='facebook'><fb:like layout="box_count" show_faces="false" font=""></fb:like></div><div class='floatbutton' id='stumbleupon'><script src="http://www.stumbleupon.com/hostedbadge.php?s=5"></script></div><div class='floatbutton' id='digg'><a class="DiggThisButton DiggMedium"></a></div><div class='floatbutton' id='twitter'><a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" >Tweet</a></div><div class='floatbutton' id='linkedin'><script type="text/javascript" src="http://platform.linkedin.com/in.js"></script><script type="in/share" data-counter="top"></script></div><div class='sbutton' id='gplusone'>
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone size="tall"></g:plusone>
</div>
		<div class="addbuttons"><a href="http://ehowportal.blogspot.com/2011/07/floating-social-media-share-buttons-on.html" title="Add floating social media share buttons to your blog!"><span class="getfloat">Get floating</span><div style="clear:both"></div><span class="sharebuttons">share buttons</span></a> </div> </div><!-- end Floating social media buttons by ehowportal.blogspot.com -->
      '''
