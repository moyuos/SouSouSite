<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>嗖嗖网-你懂得</title> 
    <link rel="shortcut icon" href="souico.ico" type="image/x-icon" />
	<meta name="viewport" content="width=device-width,inital-scale=1.0,minimum-scale=0.5,maximum-scale=2.0,user-scalable=no">
    <meta charset="utf-8"></meta>
    <script type="text/javascript" src="js/sousoude.js"></script>
    <script type="text/javascript">
    
    function souyixia(p){
    	document.getElementById("page").value=p;
    	document.getElementById("myform").submit();
    } 
    
    //判断是电脑访问，还是手机访问 
    var system ={};  
    var p = navigator.platform;       
    system.win = p.indexOf("Win") == 0;  
    system.mac = p.indexOf("Mac") == 0;  
    system.x11 = (p == "X11") || (p.indexOf("Linux") == 0); 
    if(system.win||system.mac||system.xll){//如果是电脑        
        //window.location.href="";
    }else{//如果是手机 
    	alert("温馨提示： 电脑端 访问效果更佳... ");
        //window.location.href="";
		document.getElementById("gonggao").style.display="none";
    } 
    
    
    </script>
    <style type="text/css">
    body{
    	margin:0;
    	padding:0;
    }
    
    .commondiv{
    	width:80%;
    	margin:auto;
    }
    
    #top{
    	position:fixed;
    	width:100%;height:80px;
    	border-bottom:1px solid blue;
    	z-index: 10;
    	background-color:white;
    	
    }
    
    .buclick{
    	margin-left:10px;
    	margin-top:10px;
    }
    
	a{
		text-decoration:none;
	}

    </style>
  </head>
  <body>
  
  	<div id="top" >
  	
  		<div class="conmondiv" style="height:80%;">
  			<img width="" height="25px" src="image/soubei.png" />
  			<div id="gonggao" style="display:block;width:20%;height:100%;float:right;margin:auto;font-family:微软雅黑">
  			<img style="width:30px;height:30px;float:left;" src="image/tongzhi.png" />&nbsp;&nbsp;
  			<marquee style="width:120px;height:60px;" scrollamount="2" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
  			<a href="http://www.mm131.com/xinggan/2296.html" target="_blank"><span style="color:red;">1</span>.大鱼出品,要啥精P..(福利)</a><br><br>
  			<a href="javascript:void(0)" onclick="document.getElementById('iq').src='image/gongzhonghao.jpg'">2.关注我？</a><br><br>
  			<a href="http://www.81.cn/sydbt/2017-12/31/content_7890541.htm" target='_blank'>3.让世界更加美好.</a><br><br>
  			</marquee>
  			<img style="cursor:pointer;" title="关注我" id="iq" width="70px" height="70px" src="image/yan.gif" onclick="wx(this)"/>
  			</div>
			<script type="text/javascript">
			if(system.win||system.mac||system.xll){//如果是电脑
			}else{
				document.getElementById("gonggao").style.display="none";
				document.getElementById("top").style.border="0px";
			}
			</script>
  		</div>
  		<div style="width:80%;height:50px;margin:auto;border:0px solid red;">
  		<div style="width:200px;height:50px;float:left;"><a href="image/sousoude.jsp">
  			<img height="80px;" style="margin-top:-30px;" src="image/souyixia.png"/></a>
  		</div>
  		
  		<div id="souyixia" style="width:75%;height:50px;float:right;border:0px solid red">
  			<div id="souyixia2" style="width:80%;height:35px;border:0px solid blue;background-color:rgb(51,136,255)">
  			<form id="myform" name="myform" action="SouSouMusic" method="post">
  			<input id="searchname" value="${w}" type="text" style="width:74%;height:30px;" name="searchname" placeholder="请输入歌曲名或歌手名...beyond、灰色头像.."/>
  			<div id="clicksouyixia" onclick="souyixia(1)" style="cursor:pointer;letter-spacing:8px;line-height:30px;color:white;align:center;height:35px;width:19%;font-size:20px;float:right;background-color:rgb(51,136,255)">
  			嗖一下
  			</div>
  			<input id="page" name="page" type="hidden" value="1"/>
  			</form>
  			</div>
  		</div>
  		</div>
  	</div>
  	<div id="liubai" style="width:80%;height:130px;border:0px solid red;margin:auto"></div>
  	<div style="width:80%;padding:10px;margin-top:90px;margin:auto;border:0px solid red;" align="center">
    <table style="margin:auto;width:100%" >
    <tr height="30px;" style="color:rgb(153,153,153);font-size:15px;"><td width="40%" align="center">歌曲</td><td width="30%">歌手</td><td width="30%">&nbsp;&nbsp;专辑</td></tr>
    <c:forEach var="music" items="${listMusic }" >
    <tr>
    	<td align="center" width="40%">
    		<!-- <img width="20px;" height="20px;" src="image/music.png" style="margin-right:5px;"/> -->
    		<c:url value="PlayerServlet" var="musicurl">
            	<c:param name="url" value="${music.musicUrl}"></c:param>
				<c:param name="songname" value="${music.musicName}"></c:param>
        	</c:url>
        	<a href="${musicurl}" target="_blank">${music.musicName }</a>&nbsp;&nbsp;
        	<a href="music/1.m4a" download="music"><img alt="下载" title="下载" style="width:13px;height:13px" src="image/download.png"></a>
    	</td>
    	<td width="30%">${music.musicSinger }</td>
    	<td width="30%">《${music.musicHilight }》</td>
    	<%-- <td width="30%" ><audio id="audio" class="audio" controls style="display:block;margin-top:0px;position:relative;z-index: 1;width:100%;"><source src="${music.musicUrl}" type="audio/mp4"></audio></td> --%>
    </tr>
    </c:forEach>
    </table>
	<br>
   	<button id="b1" class="buclick" onclick="souyixia(1)">1</button>
    <button id="b2" class="buclick" onclick="souyixia(2)">2</button>
    <button id="b3" class="buclick" onclick="souyixia(3)">3</button>
    <button id="b4" class="buclick" onclick="souyixia(4)">4</button>
    <button id="b5" class="buclick" onclick="souyixia(5)">5</button>
    <c:if test="${not empty p}">
	    <script type="text/javascript">
	    	document.getElementById("${p}").style.cssText="background-color:black;color:white";
	    </script>
    </c:if>
	<script type="text/javascript">
			if(system.win||system.mac||system.xll){//如果是电脑
				//
			}else{
				
				document.getElementById("souyixia").style.width="100%";
				document.getElementById("souyixia2").style.width="100%";
				document.getElementById("souyixia").style.marginTop="10px";
				document.getElementById("liubai").style.height="170px";
				document.getElementById("searchname").style.width="68%";
				document.getElementById("clicksouyixia").style.width="20%";
				document.getElementById("clicksouyixia").innerHTML="嗖";
				//document.getElementById("audio").style.width="35%";
				
				
				//document.getElementById("songname").style.display="none";
				//document.getElementById("songurl").style.width="100%";
			}
	</script>
    
    
    </div>
    
   <div class="commondiv" style="height:100px;color: #999;text-align:center;">
   	<p>©sousou 2017-2018  </p>
   	<p>Mail: <a href="mailto:dashuizhuyu@qq.com">dashuizhuyu@qq.com</a>  </p>
   </div>
    
  </body>
</html>