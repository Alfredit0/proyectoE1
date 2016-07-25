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
			<a class="link-green" href="../alta"><i class="fa fa-user-plus"></i>Nuevo contacto</a>
			<a class="link-yellow selected" href="#"><i class="fa fa-refresh"></i>Actualizar</a>
			<a class="link-red" href="../deleteall"><i class="fa fa-user-times"></i>Eliminar contactos</a>
		</div>
	</aside>
<div  class="main-content">
	<h2>Actualizar un contacto</h2>
	<c:url var="addAction" value="/add" ></c:url>
	<form:form action="${addAction}" commandName="person" role="form">				
	<div class="form-group">
		<form:label path="id">
			<spring:message text="ID"/>
		</form:label>
		<form:input path="id" readonly="true" size="8"  disabled="true" class="form-control"/>
		<form:hidden path="id" />
	</div>		
	<div class="form-group">
		<form:label path="name">
		<spring:message text="Nombre"/>
		</form:label>
		<form:input path="name" class="form-control"/>
		<form:errors path="name" cssClass="bg-danger" />
	</div>			
	<div class="form-group">
				<form:label path="country">
					<spring:message text="Dirección"/>
				</form:label>

				<form:input path="country" class="form-control"/>
				<form:errors path="country" cssClass="bg-danger" />
	</div>				
	<div class="form-group">
		<form:label path="telefono">
			<spring:message text="Telefono"/>
		</form:label>
		<form:input path="telefono" class="form-control"/>
		<form:errors path="telefono" cssClass="bg-danger" />
	</div>
	<div class="form-group">
		<form:label path="email">
			<spring:message text="Correo electrónico"/>
		</form:label>
		<form:input path="email" class="form-control" type="email"/>
		<form:errors path="email" cssClass="bg-danger" />
	</div>
		<div class="form-group">
		<form:label path="borndate">
			<spring:message text="Fecha de nacimiento"/>
		</form:label>
		<form:input path="borndate" class="form-control" type="date"/>
		<form:errors path="borndate" cssClass="bg-danger" />
	</div>	
	<div class="form-group">				
			<input type="submit"
			value="<spring:message text="Guardar cambios"/>" class="btn btn-success" />		
	</div>
	</form:form>	
</div>
</body>
</html>
