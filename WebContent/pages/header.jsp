<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.1.1/css/mdb.min.css">	
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<header>
        <!--Navbar-->
        <nav class="navbar navbar-dark navbar-fixed-top scrolling-navbar mdb-gradient top-nav-collapse">
            <div class="container">
            	<span class="navbar-brand" style="color:azure;cursor:default;">Gestionnaire de contacts</span>
                    <!--Navbar icons-->
                    <ul class="nav navbar-nav nav-flex-icons">
                        	<form id="langForm">
                        		<select id="lang" name="lang">
                        			<option value="fr" selected>FR</option>
                        			<option value="en">EN</option>
                        		</select>
                        	</form>
                        <li class="nav-item">
                        	<button id="logout" class="btn btn-sm btn-default"><a href="Logout.do"><bean:message key="logout"/></a></button>
                        </li>
                    </ul>
            </div>
        </nav>
        <!--/.Navbar-->
</header>
<div class="row">
	<div id="fabContainer" class="col-sm-1 col-mg-1">
		<a href="index.do" class="btn btn-info btn-fab-mini"><i class="material-icons">home</i></a>
		<a href="searchContact.do" class="btn btn-default btn-fab-mini"><i class="material-icons">search</i></a>
		<a href="create.do" class="btn btn-primary btn-fab-mini"><i class="material-icons">add</i></a>
		<a href="delete.do" class="btn btn-warning btn-fab-mini"><i class="material-icons">clear</i></a>
		<a href="update.do" class="btn btn-success btn-fab-mini"><i class="material-icons">mode_edit</i></a>
	</div>
	<div id="rightPanel" class="col-sm-11 col-mg-11">
		<h5 style="float:right"><bean:message key="welcome.message" arg0="${user}"/></h5>
