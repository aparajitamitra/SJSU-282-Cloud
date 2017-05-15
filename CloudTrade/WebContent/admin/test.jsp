<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jquery.growl.css"/>
    <script src="http://code.jquery.com/jquery.js"></script>
  
    <script src="/js/jquery.growl.js" type="text/javascript"></script>
</head>
<body>

<script src="https://cdn.auth0.com/js/lock/10.15/lock.min.js"></script>
<script>
var options = {
		  allowedConnections: ['Username-Password-Authentication']
		};
var lock = new Auth0Lock('CUhqC0yBiBGJctZ9Bjv2v145JuD4AcRw', 'newcloud.auth0.com',options);
if(window.location.hash)
	{
	window.location.href="Index.jsp";
	}
 
</script>
<%
String accessURL=request.getRequestURL().toString();



if(accessURL!=null && accessURL.indexOf("access_token=")>0){
	  
	//response.sendRedirect("/CloudTrade/admin/Index.jsp");
	
 }
else 
	{%>
	<button id="loginbutton"  onclick="lock.show()">Login</button>
	<!--span><%=accessURL %></span-->
	<% session.setAttribute("LoggedInUser","admin1"); }%>
</body>
</html>