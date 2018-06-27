<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" href="souico.ico" type="image/x-icon" />
	<meta name="viewport" content="width=device-width,inital-scale=1.0,minimum-scale=0.5,maximum-scale=2.0,user-scalable=no">
    <title>player</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="js/jqueryhtml5music/css/stylesheets/style.css">
	<script type="text/javascript" src="js/jqueryhtml5music/js/jquery-1.7.2.min.js"></script>
  </head>
  
  <body>
	 <%-- <h5>${songname}</h5>
     <audio id="audio" autoplay loop controls style="display:block;margin-top:0px;position:relative;z-index: 1;width:100%;"><source src="${url}" type="audio/mp4"></audio>
  	 <br/>
  	 <a href="${url }" download="${songname }">下载</a>  --%>
  	 
<div id="background">
<div id="player">
	<div class="cover"></div>
	<div class="ctrl">
		<div class="tag">
			<strong>Title</strong>
			<span class="artist">Artist</span>
			<span class="album">Album</span>
		</div>
		<div class="control">
			<div class="left">
				<div class="rewind icon"></div>
				<div class="playback icon"></div>
				<div class="fastforward icon"></div>
			</div>
			<div class="volume right">
				<div class="mute icon left"></div>
				<div class="slider left">
					<div class="pace"></div>
				</div>
			</div>
		</div>
		<div class="progress">
			<div class="slider">
				<div class="loaded"></div>
				<div class="pace"></div>
			</div>
			<div class="timer left">0:00</div>
			<div class="right">
				<div class="repeat icon"></div>
				<div class="shuffle icon"></div>
			</div>
		</div>
	</div>
</div>
<ul id="playlist"></ul>
</div>
<script type="text/javascript">
var title = "${songname}";
var album = "${songname}";
var url = "${url}";
</script>
<script src="js/jqueryhtml5music/js/jquery-ui-1.8.17.custom.min.js"></script>
<script src="js/jqueryhtml5music/js/script.js"></script>
<div style="display:none;">
<script src="http://s20.cnzz.com/stat.php?id=3992412&web_id=3992412&show=pic" type="text/JavaScript"></script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?9d2f00b533f9cca146f784443e5bfc96";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</div>
  </body>
</html>