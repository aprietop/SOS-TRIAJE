
<%@ page import="especialidad.Especialidad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialidad.label', default: 'Especialidad')}" />
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
         <li><g:link controller="especialidad" action="list" class="selected"><g:message code="Modificar Especialidades"/></g:link></li>
         <li><g:link controller="especialidad" action="create"><g:message code="Crear especialidad"/></g:link></li>
         </ul>
      </div>
      
<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos de la especialidad</h1>
      
      <div class="form1">
            <table class="tabla2">
            <thead>
            <tr>
              <g:sortableColumn property="id" title="${message(code: 'especialidad.id.label', default: 'Seleccionar')}" />
              <g:sortableColumn property="nombre" title="${message(code: 'especialidad.nombre.label', default: 'Nombre')}" />
              <g:sortableColumn property="descripcion" title="${message(code: 'especialidad.descripcion.label', default: 'Descripcion')}" />
            </tr>
            </thead>            
                <tbody>
                    <g:each in="${especialidadInstanceList}" status="i" var="especialidadInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">   
                            <td><g:link action="show" id="${especialidadInstance.id}">${fieldValue(bean: especialidadInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: especialidadInstance, field: "nombre")}</td>                        
                            <td>${fieldValue(bean: especialidadInstance, field: "descripcion")}</td>                                               
                        </tr>
                    </g:each>
                </tbody>                    
            </table>
            <div class="paginacion">
                <g:paginate total="${especialidadInstanceTotal}" />
            </div>
      </div>
      <p>&nbsp;</p>
      <g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="Volver"/></g:link>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
      
</body>
</html>
