<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MithunTechnologies- Home Page</title>
<link href="images/Naveen_DevOps_Resume.png" rel="icon">
</head>
</head>
<body>
<h1 align="center">Naveen Arvapalli</h1>
<h1 align="center">Phone Number: +91 8184899742</h1>
<h1 align="center">Linkedin- https://www.linkedin.com/in/naveen-70414b238/</h1>

<h1 align="center">Github- https://github.com/Naveengoud8184?tab=repositories</h1>

<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address  :: "+ip);%>
</h1>
<br>
<h1><h3> Client Side IP Address </h3><br>
<%out.print( "Client IP Address  :: "+request.getRemoteAddr()); %><br>
<%out.print( "Client Name Host :: "+request.getRemoteHost() );%><br></h1>
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/mithunlogo.jpg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		 Hyderabad,
		 Telanagana,
		+91 8184899742 and 
		naveena81848@gmail.com
		<br>
		<a href="mailto:naveena81848@gmail.com">Mail to Naveen</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>Mithun Technologies - Consultant, Training and Development Center.</p>
<p align=center><small>Copyrights 2025 by <a href="http://mithuntechnologies.com/">Mithun Technologies,Bengaluru</a> </small></p>

</body>
</html>
