<%@page import="Models.Adresse"%>
<%@page import="Models.Contact"%>
<%@page import="ServiceEntities.AdresseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ServiceEntities.ContactService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="main.title"/></title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>
<jsp:include page="header.jsp" />
	<h3><bean:message key="search.address.title"/></h3> <br>
	<form id="searchForm" class="form-inline col-sm-4 col-md-4" method="get" action="SearchAddress.do">
			<div class="form-group form-group-sm">			
			<label for="selectedId" ><bean:message key="address.select"/></label><br>
			<select class="form-control col-md-3 col-md-3" name="selectedId" id="selectedId">
				<option value="-1"><bean:message key="address.placeholder"/></option>
				<c:forEach items="${allAdresses}" var="a">
					<option value="${a.idAddress}">${a.rue}, ${a.codePostal}</option>
				</c:forEach>
			</select><br>
			</div>
			<html:errors/>
			<br>
<!-- 			<button class="btn btn-primary" type="submit">Chercher</button> -->
	</form>
	
	
	<div id="updateForm" class="row">
	<%
	if(request.getParameter("selectedId")!=null)
	{
	%>
	<form class="form-group form-group-sm col-sm-3 col-md-3" method="post" action="UpdateAddress.do">
		<input class="inputPadding form-control" type="hidden" name="idAddress" id="idAddress" value="${errorId}" placeholder="ID..."><br>	
		<input class="form-control form-control-sm inputPadding" type="text" name="numeroAdresse" id="numeroAdresse" value="${errorNumero}" placeholder="N°...">
		<input class="form-control inputPadding" type="text" name="rue" id="rue" value="${errorRue}" placeholder="Rue...">
		<input class="form-control inputPadding" type="text" name="ville" id="ville" value="${errorVille}" placeholder="Ville...">
		<input class="form-control inputPadding" type="text" name="codep" id="codep" value="${errorCodePostal}" placeholder="Code Postal...">
		<input class="form-control inputPadding" type="text" name="pays" id="pays" value="${errorPays}" placeholder="Pays...">
		<span id="errorMessage" data-type="${errorType}"><i>${errorMessage}</i></span><br>		
		<button class="btn btn-primary" type="submit"><bean:message key="update"/></button>
	</form>
		<%
	}
	%>
	</div>
<jsp:include page="footer.jsp" />
<script>
$(function()
{
	$('#selectedId').change(function()
	{
		$("#searchForm").submit();
	});
	
	if($("#updateForm #errorMessage").text()!="" || $("#idAddress")!="")
	{
		$("#updateForm").show();
	}
	
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