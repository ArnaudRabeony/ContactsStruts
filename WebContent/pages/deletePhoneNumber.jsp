<%@page import="ServiceEntities.ContactService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ServiceEntities.TelephoneService"%>
<%@page import="Models.Telephone"%>
<%@page import="Models.Contact"%>
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
	
	<% 
		TelephoneService ts = new TelephoneService();
		ArrayList<Telephone> telephones = ts.getTelephones();
	%>	
	<h3><bean:message key="delete.phone.title"/></h3> <br>
	<form id="deleteForm" class="form-inline col-sm-4 col-md-4" method="post" action="DeletePhone.do">
			<div class="form-group form-group-sm">			
			<label for="selectedId" ><bean:message key="phone.select"/></label><br>
			<%
				for(Telephone t : telephones)
				{
					ContactService cs = new ContactService();
					Contact c = cs.getContactById(t.getIdContact());
					
					if(c!=null)
						out.write("<input type='checkbox' name='idsToDelete' value='"+t.getId()+"'> "+c.getPrenom()+" "+c.getNom()+" ("+t.getPhoneKind()+") : "+t.getNumber()+"</input><br>");
					else
						out.write("<input type='checkbox' name='idsToDelete' value='"+t.getId()+"'> "+t.getPhoneKind()+" : "+t.getNumber()+"</input><br>");
				}
			%>
<!-- 			</select><br> -->
			</div>
			<html:errors/><br>
			<button id="deleteBtn" class="btn btn-primary" type="submit" disabled><bean:message key="delete"/></button>
	</form>
<jsp:include page="footer.jsp"/>
</html>