<%@ page import="centro.CentroSOS" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="referenc" />
<g:set var="entityName" value="${message(code: 'centroSOS.label', default: 'CentroSOS')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="cabecera">
		<div id="cabColI">
			<div id="logo">
				<h1><img src="${resource(dir:'images',file:'SOS.gif')}" width="97" height="53" align="texttop" />Referencias Médicas</h1>        
			</div>
				<div id="breadcrumbs">
				<p>&nbsp;</p>
			</div>
		</div>
		<div id="cabColD">
		<div id="infoSec">14-12-2011 06:59 PM &nbsp; | &nbsp; Cambiar idioma <a href="#"><img src="${resource(dir:'images',file:'ico_ingles.jpg')}" alt="Inglés" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a> <a href="#"><img src="${resource(dir:'images',file:'ico_port.jpg')}" alt="Portugués" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a></div>
		<div id="header"><div id="loginHeader"><g:loginControl/></div></div>
		</div>
	</div>
	
	<div id="menu1">
	<ul>
	<li><g:link controller="centroSOS" action="list" class="selected"><g:message code="Modificar Centro SOS"/></g:link></li>
	<li><g:link controller="centroSOS" action="create"><g:message code="Cargar Centro SOS"/></g:link></li>
	</ul>
	</div>     
	
	<div id="nivel1">
		<div id="nivel2">
			<div id="contenido">
			<h1>Datos del Centro SOS</h1>
                        	<g:if test="${flash.message}">
					<div class="message">${flash.message}</div>
					</g:if>
				<p>&nbsp;</p>      
                                
				<div class="form1">

				<table  class="tabla2">
					<thead>
					<tr>
					<g:sortableColumn property="id" title="${message(code: 'centroSOS.id.label', default: 'Centro')}" />
					
					<g:sortableColumn property="nombre" title="${message(code: 'nombre.label', default: 'Nombre')}" />
					
					<g:sortableColumn property="url" title="${message(code: 'centroSOS.url.label', default: 'Url')}" />
					
					<g:sortableColumn property="uuid" title="${message(code: 'centroSOS.uuid.label', default: 'Uuid')}" />
					</tr>
					</thead>
				
					<tbody>
					<g:each in="${centroSOSInstanceList}" status="i" var="centroSOSInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td><g:link action="show" id="${centroSOSInstance.id}">${fieldValue(bean: centroSOSInstance, field: "id")}</g:link></td>
					
					<td>${fieldValue(bean: centroSOSInstance, field: "nombre")}</td>
					
					<td>${fieldValue(bean: centroSOSInstance, field: "url")}</td>
					
					<td>${fieldValue(bean: centroSOSInstance, field: "uuid")}</td>
					</tr>
					</g:each>
					</tbody>
				</table>
				
				<div class="paginateButtons">
				<g:paginate total="${centroSOSInstanceTotal}" />
				</div>
				</div>
				<p>&nbsp;</p>
			<g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="button.volver.label" default="Volover" /></g:link>
			</div>      
		</div>
	<p style="clear:both">&nbsp;</p>
	</div>    
</body>
</html>