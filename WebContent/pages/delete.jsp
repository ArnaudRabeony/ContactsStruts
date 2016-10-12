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
<jsp:include page="header.jsp" />

	<h3><bean:message key="delete.title"/><br><br> <small><bean:message key="action.help"/></small></h3>
	<div id="deleteList" class="row">
		<div class="list-group col-sm-6 col-md-6">
		  <a href="deleteContact.do" class="list-group-item">
		    <h4 class="list-group-item-heading"><bean:message key="contact"/></h4>
		    <p class="list-group-item-text"><bean:message key="delete.contact.help"/></p>
		  </a>
		  <a href="deleteAddress.do" class="list-group-item">
		    <h4 class="list-group-item-heading"><bean:message key="address"/></h4>
		    <p class="list-group-item-text"><bean:message key="delete.address.help"/></p>
		  </a>
		  <a href="deletePhoneNumber.do" class="list-group-item">
		    <h4 class="list-group-item-heading"><bean:message key="phone"/></h4>
		    <p class="list-group-item-text"><bean:message key="delete.phone.help"/></p>
		  </a>
		  <a href="deleteGroup.do" class="list-group-item">
		    <h4 class="list-group-item-heading"><bean:message key="group"/></h4>
		    <p class="list-group-item-text"><bean:message key="delete.group.help"/></p>
		  </a>
		</div>
	</div>
<jsp:include page="footer.jsp" />
<script>
$(function()
{
	$('.list-group-item').mouseover(function()
	{
		$(this).parent().find(".active").removeClass("active");
		$(this).addClass("active");
	});
	
});
</script>
</html>