<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">	    
	</head>
<body>
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
	<c:if test="${!empty listPersons2 && !searchedName.equals('')}">
		<br>
		<br>
		<div class="row" style="background-color: #509832;">
		<h4 class="text-left" style="color: #fff;">Resultados para: ${searchedName}</h4>
		</div>				
		<br>
	</c:if>
	<c:if test="${!empty listPersons2}">
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
	</c:if>	
</body>
</html>
