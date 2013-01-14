
<%@ page import="medico.Triaje" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'triaje.label', default: 'Triaje')}" />
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
         <li><g:link controller="triaje" action="list" class="selected"><g:message code="Modificar Encargado de Triaje"/></g:link></li>
         <li><g:link controller="triaje" action="create"><g:message code="Cargar Encargado de Triaje"/></g:link></li>
         </ul>
      </div>
      
<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos del encargado de Triaje</h1>

        <div class="form1">
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
                <table class="tabla2">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="cedula" title="${message(code: 'cedula.label', default: 'Cedula')}" />
                        
                            <g:sortableColumn property="sexo" title="${message(code: 'sexo.label', default: 'Sexo')}" />
                        
                            <g:sortableColumn property="nacionalidad" title="${message(code: 'nacionalidad.label', default: 'Nacionalidad')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${triajeInstanceList}" status="i" var="triajeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${triajeInstance.id}">${fieldValue(bean: triajeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: triajeInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: triajeInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: triajeInstance, field: "cedula")}</td>
                        
                            <td>${fieldValue(bean: triajeInstance, field: "sexo")}</td>
                        
                            <td>${fieldValue(bean: triajeInstance, field: "nacionalidad")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            
            <div class="paginateButtons">
                <g:paginate total="${triajeInstanceTotal}" />
            </div>
        </div>
    <p>&nbsp;</p>
      <g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="button.volver.label" default="Volver" /></g:link>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
