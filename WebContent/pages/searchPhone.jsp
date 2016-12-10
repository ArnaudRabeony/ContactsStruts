<%@page import="Models.Telephone"%>
<%@page import="Models.Contact"%>
<%@page import="ServiceEntities.TelephoneService"%>
<%@page import="ServiceEntities.ContactService"%>
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
		TelephoneService ts = new TelephoneService();
		ArrayList<Telephone> telephones = ts.getTelephones();
	%>	
	<h3><bean:message key="search.phone.title"/></h3> <br>
	<form id="searchForm" class="form-inline col-sm-4 col-md-4" method="get" action="SearchPhone.do">
			<div class="form-group form-group-sm">			
			<label for="selectedId" ><bean:message key="phone.select"/></label><br>
			<select class="form-control col-md-3 col-md-3" name="selectedId" id="selectedId">
				<option value="-1"><bean:message key="phone.placeholder"/></option>
			<%
				for(Telephone t : telephones)
				{
					ContactService cs = new ContactService();
					Contact c = cs.getContactById(t.getIdContact());
					
					if(c!=null)
						out.write("<option value='"+t.getId()+"'> "+c.getPrenom()+" "+c.getNom()+" ("+t.getPhoneKind()+") : "+t.getNumber()+"</option>");
					else
						out.write("<option value='"+t.getId()+"'> "+t.getPhoneKind()+" : "+t.getNumber()+"</option>");
				}
			%>
			</select><br>
			</div><br>
						<html:errors/>
<!-- 			<button class="btn btn-primary" type="submit">Chercher</button> -->
	</form>
	
	
	<div id="updateForm" class="row">
	<%
	if(request.getParameter("selectedId")!=null)
	{
	%>
	<span id="responseType"><%= request.getAttribute("errorPhoneType")%></span>
	<form class="form-group form-group-sm col-sm-3 col-md-3" method="post" action="UpdatePhone.do" style="margin-left:100px;">
		<input type="hidden" name="selectedId" value="<%=request.getParameter("selectedId")%>">
		<input class="form-control inputPadding col-md-9 col-sm-9 bfh-phone" data-country="FR" type="text" value="${errorPhone}" name="numeroTel" id="numeroTel" placeholder="N° téléphone...">
		<select class="form-control col-md-3 col-md-3" name="type" id="type">
				<option value="pro">Professionnel</option>
				<option value="perso">Personnel</option>
		</select><br>
		<html:errors/>
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
	
	$("#type").val($("#responseType").text());
	if($("#updateForm #errorMessage").text()!="" || $("#idAddress")!="")
	{
		$("#updateForm").show();
	}
});
</script>
</html>