<%@page import="java.util.ArrayList"%>
<%@page import="ServiceEntities.ContactService"%>
<%@page import="Models.Contact"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<h3><bean:message key="delete.contact.title"/></h3> <br>
	<form id="deleteForm" class="form-inline col-sm-4 col-md-4" method="post" action="DeleteContact.do">
		<div class="form-group form-group-sm">			
		<label for="selectedId" ><bean:message key="contact.select"/></label><br>
			<c:forEach items="${allContacts}" var="c">
				<input type='checkbox' name='idsToDelete' value="${c.id}"> ${c.prenom}, ${c.nom}<br>
			</c:forEach>
		</div><br>
		<html:errors/>
		<button id="deleteBtn" class="btn btn-primary" type="submit" disabled><bean:message key="delete"/></button>
	</form>
<jsp:include page="footer.jsp"/>
<script>
$(function()
{
	$("#selectedId").change(function()
	{
		var value =$(this).val();
		if(value==-1)
			$("#deleteBtn").attr("disabled",true);
		else if(value!=-1)
			$("#deleteBtn").attr("disabled",false);
	});

});
</script>
</html>