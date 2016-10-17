<%@page import="ServiceEntities.MembreService"%>
<%@page import="ServiceEntities.ContactService"%>
<%@page import="Models.Groupe"%>
<%@page import="Models.Contact"%>
<%@page import="ServiceEntities.GroupeService"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		GroupeService gs = new GroupeService();
		MembreService ms = new MembreService();
		ArrayList<Groupe> groupes = gs.getGroups();
	%>	
	<h3><bean:message key="search.group.title"/></h3> <br>
	<form id="searchForm" class="form-inline col-sm-4 col-md-4" method="get" action="SearchGroup.do">
			<div class="form-group form-group-sm">			
			<label for="selectedId" ><bean:message key="group.select"/></label><br>
			<select class="form-control col-md-3 col-md-3" name="selectedId" id="selectedId">
				<option value="-1"><bean:message key="group.placeholder"/></option>
			<%
				for(Groupe g : groupes)
					out.write("<option value='"+g.getId()+"'>"+g.getNom()+" - "+ms.getMembersByGroupId(g.getId()).size()+" contact(s)</option>");
			%>
			</select><br>
			</div><br>
<!-- 			<button class="btn btn-primary" type="submit">Chercher</button> -->
	</form>
	
	
	<div id="updateForm" class="row">
	<%
	if(request.getParameter("selectedId")!=null)
	{
	%>
	<form class="form-group form-group-sm col-sm-3 col-md-3" method="post" action="UpdateGroup.do">
		<input type="hidden" name="selectedId" value="<%=request.getParameter("selectedId")%>">
		<input class="form-control inputPadding col-md-9 col-sm-9" type="text" value="${errorNomGroupe}" name="nomGroupe" id="nomGroupe" placeholder="Nom...">
		
		<%
				ContactService cs = new ContactService();
				ArrayList<Contact> allContacts = cs.getContacts();
				ArrayList<Contact> contacts = ms.getMembersByGroupId(Integer.valueOf(request.getParameter("selectedId")));
				
				for(Contact c : allContacts)
				{
					if(cs.listContainsContact(contacts, c.getId()))
						out.write("<input type='checkbox' checked name='members' value='"+c.getId()+"'> "+c.getPrenom()+" "+c.getNom()+"</input><br>");
					else
						out.write("<input type='checkbox' name='members' value='"+c.getId()+"'> "+c.getPrenom()+" "+c.getNom()+"</input><br>");
				}
		%>
			<html:errors/><br>
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
	
	$("#type").val($("#responseType").text());
	if($("#updateForm #errorMessage").text()!="" || $("#idAddress")!="")
	{
		$("#updateForm").show();
	}
});
</script>
</html>