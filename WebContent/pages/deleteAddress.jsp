<%@page import="ServiceEntities.ContactService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ServiceEntities.AdresseService"%>
<%@page import="Models.Adresse"%>
<%@page import="Models.Contact"%>
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
	
	<% 
		AdresseService as = new AdresseService();
		ArrayList<Adresse> adresses = as.getAdresses();
	%>	
	<h3><bean:message key="delete.address.title"/></h3> <br>
	<form id="deleteForm" class="form-inline col-sm-4 col-md-4" method="post" action="DeleteAddress.do">
			<div class="form-group form-group-sm">			
			<label for="selectedId" ><bean:message key="address.select"/></label><br>
			<select class="form-control col-md-3 col-md-3" name="selectedId" id="selectedId">
				<option value="-1"><bean:message key="address.placeholder"/></option>
			<%
				for(Adresse a : adresses)
				{
					ContactService cs = new ContactService();
					Contact c = cs.getContactById(a.getIdContact());
					out.write(a.getIdAddress());
					if(c!=null)
						out.write("<option value='"+a.getIdAddress()+"'>"+c.getPrenom()+" "+c.getNom()+" : "+a.getRue()+", "+a.getCodePostal()+"</option>");
					else
						out.write("<option value='"+a.getIdAddress()+"'>"+a.getRue()+", "+a.getCodePostal()+"</option>");
				}	
			%>
			</select><br>
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