
<%@ page import="caso.Caso" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
</div>
  
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]" /></h1>
  <g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
  </g:if>

<%--  
<g:formRemote name="myForm" update="updateMe"
              url="[controller: 'book', action: 'byAuthor',
                    params: [sort: 'title', order: 'desc']]">
    Author: <input name="author" type="text" />
</g:formRemote>
<div id="updateMe">this div is updated with the result of the byAuthor call</div>
--%>


<g:formRemote name="busquedaCasoPorFecha"
              url="[controller:'caso',action:'verPorFecha']"
              update="[success: 'resultadoCasoPorFecha', failure: 'errorResultadoCasoPorFecha']"
              onLoading="cargando('#resultadoCasoPorFecha')">
  
  <label for="rangoFechas">
    <b> <g:message code="buscar.rango_fechas" /></b>
  </label>

  <label for="desde">
    <g:message code="buscar.desde" />
  </label>
    <g:datePicker name="desde" value="" precision="day" noSelection="['':'']" />

  <label for="hasta">
    <g:message code="buscar.hasta" />
  </label>
    <g:datePicker name="hasta" value="" precision="day" noSelection="['':'']" />

  <g:submitButton name="doit" value="${message(code:'buscar.filtro')}" class="boton1" />
              
</g:formRemote>  

<div id="resultadoCasoPorFecha"></div>
<div id="errorResultadoCasoPorFecha"></div>

  <p>&nbsp;</p>
  <g:link class="boton1" controller="actorSistema" action="menuTriaje"><g:message code="Volver"/></g:link>            
</div>
</body>
</html>
