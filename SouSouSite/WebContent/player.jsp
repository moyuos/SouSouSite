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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
	 <h5>${songname}</h5>
     <audio id="audio" autoplay loop controls style="display:block;margin-top:0px;position:relative;z-index: 1;width:100%;"><source src="${url}" type="audio/mp4"></audio>
  	 <br/>
  	 <a href="${url }" download="${songname }">下载</a> 
  </body>
</html>