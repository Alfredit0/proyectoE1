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
		<script type="text/javascript" src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"/>"></script>
		<script type="text/javascript">
			function results() {
				var nombre=$("input#input").val();
				nombre=nombre.replace(" ","%20");
				$("#div1").load("resultados.htm?name="+nombre);						
			}						
		</script>
	</head>
<body>
	<aside class="sidebar-left">
		<a class="company-logo" href="#">AgM</a>
		<div class="sidebar-links">
			<a class="link-blue  selected" href="/SpringMVCHibernate"><i class="fa fa-home"></i>Inicio</a>
			<a class="link-green" href="alta"><i class="fa fa-user-plus"></i>Nuevo contacto</a>
			<a class="link-yellow" href="#"><i class="fa fa-refresh"></i>Actualizar</a>
			<a class="link-red" href="deleteall"><i class="fa fa-user-times"></i>Eliminar contactos</a>
		</div>
	</aside>
<div  class="main-content">
	<div class="col-md-6">
		<h2><span class="fa fa-users text-primary"></span> Lista de contactos</h2>		
	</div>	
	<div class="col-md-6">
		<c:url var="addAction" value="/search" ></c:url>
		<h4>
		<form:form action="${addAction}" commandName="person" role="form">
			<span class="fa fa-search"></span>
			<input placeholder="Nombre" id="input" onkeyup="results()" name="name" required="">
			<input type="submit" value="Buscar">
		</form:form>
		</h4>
	</div>
	<br>
	<c:if test="${empty listPersons2 && empty listPersons}">
		<br>
		<br>
		<div class="row" style="background-color: #c62b2b;">
		<h4 class="text-left" style="color: #fff;"> <span class="fa fa-times-circle-o" style="font-size:1.5em;"></span>
			No se obtuvieron Resultados para: ${searchedName}
		</h4>
		</div>				
		<br>
		<a href="persons" class="btn btn-primary btn-lg"> <span class="fa fa-undo"></span> Volver</a>
	</c:if>
	<div id="div1">
	<c:if test="${!empty listPersons2}">
		<br>
		<br>
		<div class="row" style="background-color: #509832;">
		<h4 class="text-left" style="color: #fff;">Resultados para: ${searchedName}</h4>
		</div>				
		<br>
		<table class="table table-hover">
		<tr>
			<th >Nombre</th>
			<th >Teléfono</th>			
			<th >Dirección</th>
			<th >Correo electrónico</th>
			<th >Fecha de nacimiento</th>		
			<th >Editar</th>
			<th >Eliminar</th>
		</tr>
		<c:forEach items="${listPersons2}" var="person">
			<tr>
				<td>${person.name}</td>				
				<td>${person.telefono}</td>
				<td>${person.country}</td>
				<td>${person.email}</td>
				<td>${person.borndate}</td>
				<td><a href="<c:url value='/edit/${person.id}' />" class="btn btn-success"><span class="fa fa-edit"></span></a></td>
				<td><a href="<c:url value='/remove/${person.id}' />" class="btn btn-danger" ><span class="fa fa-times"></span></a></td>
			</tr>
		</c:forEach>
		</table>
		<a href="persons" class="btn btn-primary btn-lg"> <span class="fa fa-undo"></span> Volver</a>
	</c:if>	
	<c:if test="${!empty listPersons}">		
		<table class="table table-hover">
		<tr>			
			<th >Nombre</th>
			<th >Teléfono</th>			
			<th >Dirección</th>
			<th >Correo electrónico</th>
			<th >Fecha de nacimiento</th>		
			<th >Editar</th>
			<th >Eliminar</th>
		</tr>
		<c:forEach items="${listPersons}" var="person">
			<tr>				
				<td>${person.name}</td>				
				<td>${person.telefono}</td>
				<td>${person.country}</td>
				<td>${person.email}</td>
				<td>${person.borndate}</td>
				<td><a href="<c:url value='/edit/${person.id}' />" class="btn btn-success"><span class="fa fa-edit"></span></a></td>
				<td><a href="<c:url value='/remove/${person.id}' />" class="btn btn-danger" ><span class="fa fa-times"></span></a></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>	
	</div>
</div>			
</body>
</html>
