<%@page import="Models.Contact"%>
<%@page import="ServiceEntities.ContactService"%>
<%@page import="java.util.ArrayList"%>
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
			
		<% 
			ContactService cs = new ContactService();
			ArrayList<Contact> contacts = cs.getContacts();
		%>	
			<h3><bean:message key="create.group.title"/></h3> <br>
		<form class="form-group form-group-sm " method="post" action="CreateGroup.do">
			<div class="form-group form-group-sm">
					<input class="form-control inputPadding col-md-9 col-sm-9" type="text" value="${errorNomGroupe}" name="nomGroupe" id="nomGroupe" placeholder="<bean:message key="create.group.placeholder.name"/>">
					<h4><small><bean:message key="create.group.placeholder.name"/></small></h4>
					<label class="radio-inline"><input type="radio" name="addMembers" value="y"><bean:message key="yes"/></label>
					<label class="radio-inline"><input type="radio" name="addMembers" value="n" checked><bean:message key="no"/></label><br><br>
					
					<div id="membersSelection">
						<h4><small>Veuillez selecitonner les membres à ajouter ?</small></h4>
						<hr>
						<%
							for(Contact c : contacts)
								out.write("<div class='checkbox'><input name='addToGroup' type='checkbox' value='"+c.getId()+"'>"+c.getPrenom()+" "+c.getNom()+"</label></div>");
						%>
					</div>
					<html:errors/>
					<button class="btn btn-primary" type="submit"><bean:message key="create"/></button>
				</div> 
			</div>
			
		</form>
<jsp:include page="footer.jsp"/>
<script>
$(function()
{
	$('input[name=addMembers]').change(function()
	{	
		var value=$('input[name=addMembers]:checked').val();
		value == "y" ? $("#membersSelection").show() : $("#membersSelection").hide();
	});
});
</script>
</html>