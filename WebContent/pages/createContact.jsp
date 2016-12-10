<%@page import="ServiceEntities.AdresseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Adresse"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="main.title"/></title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>
<jsp:include page="header.jsp"/>

		<div class="col-md- col-sm-4">
			<h3><bean:message key="create.contact.title"/></h3> <br>
			<form class="form-group form-group-sm col-sm-11 col-md-11" method="post" action="Create.do">
				<input class="form-control inputPadding" type="text" name="nom" id="nom" value="${errorNom}" placeholder="<bean:message key="create.contact.placeholder.lastname"/>"><br>
				<input class="form-control inputPadding" type="text" name="prenom" id="prenom" value="${errorPrenom}" placeholder="<bean:message key="create.contact.placeholder.firstname"/>"><br>
				<input class="form-control inputPadding" type="email" name="email" id="email" value="${errorEmail}" placeholder="<bean:message key="create.contact.placeholder.email"/>"><br>
				<label for="selectedId" ><bean:message key="address.select"/></label><br>
				
				<select class="form-control col-md-3 col-md-3" name="selectedId" id="selectedId">
					<option value="-1" selected><bean:message key="address.na"/></option>
					<c:forEach items="${allAdresses}" var="a">
						<option value="${a.idAddress}">${a.rue}, ${a.codePostal}</option>
					</c:forEach>
				</select><br>
				
				<button id="newPhone" class="btn btn-info" type="button"><i class="material-icons">add</i><bean:message key="phone"/></button><br>
				<html:errors/><br>
				<button class="btn btn-primary" type="submit"><bean:message key="create"/></button>
		</div>
		
		<div class="form-group form-group-sm col-md-4 col-sm-4">
			<div id="phoneForm" class="col-md-10 col-sm-10">
				<input class="form-control inputPadding col-md-9 col-sm-9" type="text" name="numeroTel" id="numeroTel" placeholder="<bean:message key="create.phone.placeholder.num"/>">
					<select class="form-control col-md-3 col-md-3" name="type" id="type">
						<option value="pro" selected><bean:message key="create.phone.placeholder.type.pro"/></option>
						<option value="perso"><bean:message key="create.phone.placeholder.type.perso"/></option>
					</select><br>
			</div> 
		</div>
	</form>
<jsp:include page="footer.jsp"/>
<script>
	$(function()
	{
		$("#newPhone").click(function()
		{
			$(this).attr("disabled",true);
			$("#phoneForm").show();
		});
	});
</script>
</html>