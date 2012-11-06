
<%@ page import="especialidad.Especialidad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialidad.label', default: 'Especialidad')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
    <g:link class="boton1" action="list"><g:message code="Volver" args="[entityName]" /></g:link>
      <p>&nbsp;</p>
      
            <div class="form1">
                <table class="tabla2">
                    <tbody>
                        <tr>
                            <td valign="top" class="name"><label for="nombre"><g:message code="nombre.label" default="Nombre" /></td></label>
                             <td valign="top" class="value">${fieldValue(bean: especialidadInstance, field: "nombre")}</td>
                        </tr>
             
                        <tr>
                            <td valign="top" class="name"><label for="descripcion"><g:message code="descripcion.label" default="Descripcion" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialidadInstance, field: "descripcion")}</td>
                        </tr>
                   </tbody>
                </table>
                <p>&nbsp;</p>
                <div>
                    <g:form>
                        <g:hiddenField name="id" value="${especialidadInstance?.id}" />
                        <g:actionSubmit class="boton_submit4" action="edit" value="${message(code: 'Editar', default: 'Editar')}" />
                        <g:actionSubmit class="boton_submit4" action="delete" value="${message(code: 'Eliminar', default: 'Eliminar')}" onclick="return confirm('${message(code: '¿Está seguro?', default: '¿Está seguro?')}');" />
                    </g:form>
                </div>
            </div>
            <p>&nbsp;</p>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
