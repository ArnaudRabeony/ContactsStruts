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
			Boolean empty = contacts.isEmpty();
		%>	
			<h3><bean:message key="create.phone.title"/></h3> <br>
		<form class="form-group form-group-sm col-sm-11 col-md-11" method="post" action="CreatePhone.do">
			<div class="form-group form-group-sm">
					<label for="contactId" ><bean:message key="associated.contact"/></label>
					<select class="form-control col-md-3 col-md-3" name="contactId" id="contactId">
					<%
						boolean firstContact = true;
						for(Contact c : contacts)
						{
							if(firstContact)
							{
								out.write("<option value='"+c.getId()+"' selected>"+c.getPrenom()+" "+c.getNom()+"</option>");
								firstContact = false;
							}
							else
								out.write("<option value='"+c.getId()+"'>"+c.getPrenom()+" "+c.getNom()+"</option>");
						}
					%>
					</select><br>
					<input class="form-control inputPadding col-md-9 col-sm-9" type="text" value="${errorPhoneType}" name="numeroTel" id="numeroTel" placeholder="<bean:message key="create.phone.placeholder.num"/>">
					<select class="form-control col-md-3 col-md-3" value="${errorPhone}" name="type" id="type">
						<option value="pro" selected><bean:message key="create.phone.placeholder.type.pro"/></option>
						<option value="perso"><bean:message key="create.phone.placeholder.type.perso"/></option>
					</select><br>
					<html:errors/>
					<button class="btn btn-primary" type="submit"><bean:message key="create"/></button>
				</div> 
			</div>
			
		</form>
<jsp:include page="footer.jsp"/>
</html>