<%@page import="ServiceEntities.AdresseService"%>
<%@page import="Models.Adresse"%>
<%@page import="Models.Contact"%>
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
	<% 
		ContactService cs = new ContactService();
		ArrayList<Contact> contacts = cs.getContacts();
		AdresseService as = new AdresseService();
		ArrayList<Adresse> adresses = as.getAdresses();
		String selectedId = request.getParameter("selectedId")!=null ? request.getParameter("selectedId") : "";
	%>		
	<h3><bean:message key="search.contact.title"/></h3> <br>
	<form id="searchForm" class="form-inline col-sm-4 col-md-4" method="get" action="SearchContact.do">
			<div class="form-group form-group-sm">
			<label for="selectedId" ><bean:message key="contact.select"/></label><br>
			<select class="form-control col-md-3 col-md-3" name="selectedId" id="selectedId">
				<option value="-1"><bean:message key="contact.placeholder"/></option>
					<c:forEach items="${allContacts}" var="c">
						<option value="${c.id}"> ${c.prenom} ${c.nom}<br>
					</c:forEach>
			</select><br>
			</div><br>
<!-- 			<button class="btn btn-primary" type="submit">Chercher</button> -->
	</form>
	
	<div class="col-md-8 col-sm-8">
		<div id="cardResult" class="col-md-4 col-sm-4" style="display:none">
			<!--Card-->
			
		    <div class="card card-cascade narrower" data-contactid="${idResult}">
		
		        <!--Card image-->
		        <div class="view overlay hm-white-slight">
		            <img src="http://mdbootstrap.com/images/regular/city/img%20(11).jpg" class="img-fluid" alt="">
		            <a>
		                <div class="mask"></div>
		            </a>
		        </div>
		        <!--/.Card image-->
		
		        <!--Card content-->
		        <div class="card-block" style="padding:10px;">
		            <h5 class="red-text" id="groupeLabel"></h5>
		            <!--Title-->
		            <h4 class="card-title" id="cardContactName">${prenomResult} ${nomResult}</h4>
		            <!--Text-->
		            <p class="card-text"><br>${emailResult}</p>
		            <a id="editButton" class="btn btn-primary">Éditer</a>
		        </div>
		        <!--/.Card content-->
		
		    </div>
    <!--/.Card-->
		</div>
	</div>
	<%
   	if(selectedId!="")
      	{   
      %>
	
	<div id="editableFormCard" class="row">
	<form class="form-group form-group-sm col-sm-3 col-md-3" method="post" action="UpdateContact.do">
		<label for="selectedId" ><bean:message key="associated.address"/></label><br>
		<select class="form-control col-md-3 col-md-3" name="newAddress" id="newAddress">
			<option value="-1"><bean:message key="address.placeholder"/></option>
		<%
			int idAddress = Integer.valueOf(request.getParameter("selectedId"));
			
			Contact c = null;
			if(idAddress!=0)
				c = cs.getContactById(Integer.valueOf(request.getParameter("selectedId")));
		
			for(Adresse a : adresses)
				if(c!=null && a.getIdAddress()==c.getIdAdresse())
					out.write("<option value='"+a.getIdAddress()+"' selected>"+a.getRue()+", "+a.getCodePostal()+"</option>");
				else
					out.write("<option value='"+a.getIdAddress()+"'>"+a.getRue()+", "+a.getCodePostal()+"</option>");
		%>
		</select><br>
		<input class="inputPadding form-control" type="hidden" name="idContact" id="idContact" value="${idResult}" placeholder="ID..."><br>	
		<input class="inputPadding form-control" type="text" name="nom" id="nom" value="${nomResult}" placeholder="Nouveau nom..."><br>
		<input class="inputPadding form-control" type="text" name="prenom" id="prenom" value="${prenomResult}" placeholder="Nouveau prénom..."><br>
		<input class="inputPadding form-control" type="text" name="email" id="email" value="${emailResult}" placeholder="Nouvelle adresse mail..."><br>
		<html:errors/><br>		
		<button class="btn btn-primary" type="submit"><bean:message key="update"/></button>
	</form>
	</div>
	<% } %>
<jsp:include page="footer.jsp" />
<script>
$(function()
{
	$('#selectedId').change(function()
	{
		$("#searchForm").submit();
	});
	
	if($('#cardContactName').text().trim()!="" && $('#card').attr("data-contactid")!="")
	{
		$('#searchForm option:selected').attr("selected",false);
		$("#searchForm option").each(function()
		{
			console.log($(this).val());
			if($(this).val() == $('#card').attr("data-contactid"))
				$(this).attr("selected",true);
		});	
		
		$("#cardResult").show();
	}
	
	$("#editButton").click(function()
	{
		$("#cardResult").hide();
		$("#editableFormCard").show();
	});
	
	if($("#editableFormCard #errorMessage").text()!="")
	{
		$("#editableFormCard").show();
	}
});
</script>
</html>