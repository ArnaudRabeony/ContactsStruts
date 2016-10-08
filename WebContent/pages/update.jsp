<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>
<jsp:include page="header.jsp" />

	<h3>Mise � jour<br><br> <small>Veuillez cliquer sur le lien correspondant � l'action que vous voulez effectuer</small></h3>
	<div id="updateList" class="row">
		<div class="list-group col-sm-6 col-md-6">
		  <a href="searchContact.do" class="list-group-item">
		    <h4 class="list-group-item-heading">Contact</h4>
		    <p class="list-group-item-text">Mettre � jour les informations d'un contact existant</p>
		  </a>
		  <a href="searchAddress.do" class="list-group-item">
		    <h4 class="list-group-item-heading">Adresse</h4>
		    <p class="list-group-item-text">Mettre � jour une adresse existante</p>
		  </a>
		  <a href="searchPhone.do" class="list-group-item">
		    <h4 class="list-group-item-heading">Num�ro de t�l�phone</h4>
		    <p class="list-group-item-text">Mettre � jour un num�ro de t�l�phone existant</p>
		  </a>
		  <a href="searchGroup.do" class="list-group-item">
		    <h4 class="list-group-item-heading">Groupe</h4>
		    <p class="list-group-item-text">Mettre � jour un groupe existant</p>
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