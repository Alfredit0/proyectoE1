<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Agenda Meltsan</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/sidebar/demo.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/sidebar/sidebar-left.css'/>" />		
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<script type="text/javascript" src="<c:url value="/resources/angular.min.js"/>"></script>
	</head>
<body>
	<aside class="sidebar-left">
		<a class="company-logo" href="#">AgM</a>
		<div class="sidebar-links">
			<a class="link-blue" href="/SpringMVCHibernate"><i class="fa fa-home"></i>Inicio</a>
			<a class="link-green" href="alta"><i class="fa fa-user-plus"></i>Nuevo contacto</a>
			<a class="link-yellow" href="#"><i class="fa fa-refresh"></i>Actualizar</a>
			<a class="link-red  selected" href="#"><i class="fa fa-user-times"></i>Eliminar contactos</a>
		</div>
	</aside>
<div  class="main-content">
	<h2>Eliminar toda la lista de contactos</h2>
	<br>
	<c:url var="addAction" value="/removeall" ></c:url>	
	<form:form action="${addAction}" commandName="person" role="form" class=" bg-danger row text-center">
		<div class="form-group">
			<h3>¿Está seguro de que desea eliminar todos sus contactos?</h3>
		</div>				
		<div class="form-group">				
			<input type="submit"
			value="<spring:message text="Si, eliminar"/>"class="btn btn-danger" />	
		</div>
	</form:form>
	
</div>
</body>
</html>
