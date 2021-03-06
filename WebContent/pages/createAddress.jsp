<%@page import="Models.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ServiceEntities.ContactService"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><bean:message key="main.title"/></title>
</head>
<body>
<jsp:include page="header.jsp"/>
		<div class="col-md-4 col-sm-4">
	<h3><bean:message key="create.address.title"/></h3> <br>
		<form class="form-group form-group-sm col-sm-11 col-md-11" method="post" action="CreateAddress.do">
			<div class="form-group form-group-sm">
					<input class="form-control form-control-sm inputPadding" type="text" name="numeroAdresse" id="numeroAdresse" value="${errorNumero}" placeholder="<bean:message key="create.address.placeholder.num"/>">
					<input class="form-control inputPadding" type="text" name="rue" id="rue" value="${errorRue}" placeholder="<bean:message key="create.address.placeholder.street"/>">
					<input class="form-control inputPadding" type="text" name="ville" id="ville" value="${errorVille}" placeholder="<bean:message key="create.address.placeholder.city"/>">
					<input class="form-control inputPadding" type="text" name="codep" id="codep" value="${errorCodePostal}" placeholder="<bean:message key="create.address.placeholder.code"/>">
					<input class="form-control inputPadding" type="text" name="pays" id="pays" value="${errorPays}" placeholder="<bean:message key="create.address.placeholder.country"/>">
					<html:errors/><br>
					<button class="btn btn-primary" type="submit"><bean:message key="create"/></button>
				</div> 
			</div>
			
		</form>
<jsp:include page="footer.jsp"/>
</html>