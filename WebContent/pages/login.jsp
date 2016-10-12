<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="main.title"/></title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<body style="padding: 50px 30px 50px 80px;">

	<h1><bean:message key="login.title"/></h1><br>
	<form class="form-group col-sm-4 col-md-4 col-md-offset-4" method="get" action="Login.do">
		<label for="name"><bean:message key="login.name"/></label><input class="form-control" type="text" name="nom" id="nom" value="${errorNom}"><br>
		<label for="password"><bean:message key="login.password"/></label><input class="form-control" type="password" name="password" id="password"><br>
		<html:errors/><br><br>
  		<button type="submit" class="btn btn-primary"><bean:message key="login.connection"/></button>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</html>