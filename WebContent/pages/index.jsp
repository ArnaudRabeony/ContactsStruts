
<%@page import="ServiceEntities.MembreService"%>
<%@page import="Models.Adresse"%>
<%@page import="ServiceEntities.AdresseService"%>
<%@page import="Models.Telephone"%>
<%@page import="ServiceEntities.TelephoneService"%>
<%@page import="Models.Groupe"%>
<%@page import="ServiceEntities.GroupeService"%>
<%@page import="Models.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ServiceEntities.ContactService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accueil</title>
</head>
<body>
<jsp:include page="header.jsp" />

<%
	ContactService cs = new ContactService();
	MembreService ms = new MembreService();
	AdresseService as = new AdresseService();

	GroupeService gs = new GroupeService();
	ArrayList<Groupe> groupes = gs.getGroups();

	String selectedId = request.getParameter("selectedId")!=null ? request.getParameter("selectedId") : "";
%>

	<div class="row">
		<div class="col-md-4 col-sm-4">
			<h3><small><bean:message key="index.groups"/></small></h3><br>
			<div class="form-group form-group-sm label-floating is-empty">
			  <input class="form-control" style="width:45%" id="searchContact" type="text" placeholder="<bean:message key="index.search.placeholder"/>">
			</div>
		<div class="groupPanel panel-group">
	
	<!-- 	foreach group g => g.getName() + getNbContactByGroup()	 -->
	
	 <%
		for(Groupe g : groupes)
		{
			ArrayList<Contact> members = ms.getMembersByGroupId(g.getId());
			session.setAttribute("members", members);
			%>
	
			    <div class="panel panel-default">
			      <div data-toggle="collapse" data-target="#collapse<%=g.getId() %>" class="panel-heading" data-group="<%= g.getId()%>">
			        <h4 class="panel-title">	
			          <%= g.getNom() %>
			          <span style="float:right"><%= members.size() %></span>
			        </h4>
			      </div>
			      <div id="collapse<%=g.getId() %>" class="panel-collapse collapse">
			        <ul class="list-group">
			        <c:forEach items="${members}" var="contact">
						<li class='list-group-item contactItem' data-contactid='${contact.id}'>${contact.nom} ${contact.prenom}
							<span><img class='displayContact' src='images/Contacts-icon.png' width='30' height='35'></span></li>
					</c:forEach>
			        </ul>
			      </div>
			    </div>
	<%	}
	 
	 	ArrayList<Contact> noGroup = ms.getContactsWithoutGroup();
	 	if(!noGroup.isEmpty())
	 	{
			session.setAttribute("noGroup", noGroup);

	 		%>
		    <div class="panel panel-default">
		      <div data-toggle="collapse" data-target="#noGroup" class="panel-heading" data-group="NoGroup">
		        <h4 class="panel-title">
		          Pas de groupe
		          <span style="float:right"><%= noGroup.size() %></span>
		        </h4>
		      </div>
		      <div id="noGroup" class="panel-collapse collapse">
		        <ul class="list-group">
		          
		        <c:forEach items="${noGroup}" var="contact">
					<li class='list-group-item contactItem' data-contactid='${contact.id}'>${contact.nom} ${contact.prenom}
							<span><img class='displayContact' src='images/Contacts-icon.png' width='30' height='35'></span></li>
				</c:forEach>
		        </ul>
		      </div>
		    </div>
<%		}
	 %>
	<!-- 	 -->  
			  </div>
		</div>
   <%
   	if(selectedId!="")
      	{   
       	Contact c = cs.getContactById(Integer.valueOf(selectedId));
//        	ArrayList<Integer> idsGroupe = ms.getGroupIdByContactId(Integer.valueOf(selectedId));
       	
//        	Groupe groupe = gs.getGroupById(idGroupe);
//    		String groupName = groupe.getNom();

   		TelephoneService ts = new TelephoneService();
   		ArrayList<Telephone> telephonesList = ts.getTelephonesByContactId(c.getId());

   		String telToDisplay = "";

   		if (!telephonesList.isEmpty())
   			telToDisplay = telephonesList.get(0).getPhoneKind() + " : "
   					+ telephonesList.get(0).getNumber();
   %>
	<div id="contactInfo" class="row col-md-8 col-sm-8">
		<div id="cardContainer" class="col-md-5 col-sm-5">
			<!--Card-->
			
		    <div class="card card-cascade narrower" data-contactid="<%= c.getId()%>">
		
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
<%-- 		            <h5 class="red-text" id="groupeLabel"><%= groupName %></h5> --%>
		            <!--Title-->
		            <h4 class="card-title" id="cardContactName"><%= c.getPrenom()%> <%= c.getNom()%></h4>
		            <!--Text-->
		            <p class="card-text"><%=telToDisplay %><br><%= c.getEmail()%></p>
		        </div>
		        <!--/.Card content-->
		    </div>
    <!--/.Card-->
    	</div>
    	<%
    		
    	%>
    	<div id="adressePhone" class="col-md-7 col-sm-7">
<!--     		    	<h3 style="display:none"><small>Adresse(s)</small></h3> -->
	    	<div id="addressList" class="list-group">
	    	<%
	    		int idAdresse = cs.getIdAdresseByContactId(Integer.valueOf(selectedId));

	    		if(idAdresse!=0)
	    		{
		    		Adresse a = as.getAdresseById(idAdresse);
		    		out.write("<li class='list-group-item'>"+a.getRue()+", "+a.getCodePostal()+"</li>");
	    		}
	    	%>
			</div>
<!--     		    	<h3 style="display:none"><small>Téléphone(s)</small></h3> -->
			<div id="telephonesList" class="list-group">
			<%
	    		ArrayList<Telephone> telephones = ts.getTelephonesByContactId(c.getId());
				session.setAttribute("phones", telephones);
	    	%>			
			    <c:forEach items="${phones}" var="tel">
			    	<li class='list-group-item'>${tel.phoneKind} : ${tel.number}</li>
		    	</c:forEach>
	    	</div>
    	</div>
    	<%
    	}
    	%>
    </div>
			
<jsp:include page="footer.jsp" />
<script>
$(function()
{
	$("body").on("click",".displayContact",function()
	{
		var id = $(this).parent().parent().attr("data-contactid");
		window.location.href= "index.do?selectedId="+id;
	});
	
	if($("#addressList li").length != 0 && $("#telephonesList li").length != 0)
	{
		$("<hr>").insertAfter("#addressList");
		$("#adressePhone small").show();	
	}
	
	if($("#telephonesList li")!=0)
	{
		$("#adressePhone small").eq(1).show();	
	}
	
	if($("#addressList li")!=0)
	{
		$("#adressePhone small").eq(0).show();	
	}
});
</script>
</html>