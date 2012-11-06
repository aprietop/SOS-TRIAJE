

<%@ page import="especialidad.Especialidad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialidad.label', default: 'Especialidad')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
         <li><g:link controller="especialidad" action="list"><g:message code="Modificar especialidades"/></g:link></li>
         <li><g:link controller="especialidad" action="create" class="selected"><g:message code="Crear especialidad"/></g:link></li>
        </ul>
      </div>     

       <div id="nivel1">
        <div id="nivel2">
          <div id="contenido">
          <h1>Datos de la especialidad</h1>
          <g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="Volver"/></g:link>
            <p>&nbsp;</p>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialidadInstance}">
            <div class="errors">
                <g:renderErrors bean="${especialidadInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div class="form1">
            <g:form action="save" >
                    <table class="tabla2">
                    <span class="obligatorio">&nbsp;*</span> Campos Obligatorios 
                            <tr>
                                <td valign="top">
                                    <label for="nombre"><g:message code="nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class=" ${hasErrors(bean: especialidadInstance, field: 'nombre', 'errors')}">
                                    <g:textField style="width:250px" name="nombre" value="${especialidadInstance?.nombre}"/><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>                        
                            <tr>
                                <td valign="top">
                                    <label for="descripcion"><g:message code="descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class=" ${hasErrors(bean: especialidadInstance, field: 'descripcion', 'errors')}">
                                    <g:textArea style="width:250px" name="descripcion" value="${especialidadInstance?.descripcion}"/><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                    </table>
                <div>
                  <g:submitButton name="create" class="boton_submit" value="${message(code: 'Crear', default: 'Crear')}" />
                </div>
            </g:form>
            </div>
            <p>&nbsp;</p>
          </div>
       </div>
        <p style="clear:both">&nbsp;</p>
      </div>      
    </body>
</html>