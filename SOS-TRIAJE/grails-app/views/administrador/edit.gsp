

<%@ page import="persona.Administrador" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
<li><g:link controller="administrador" action="list" class="selected"><g:message code="Modificar Administrador"/></g:link></li>
<li><g:link controller="administrador" action="create"><g:message code="Crear Administrador"/></g:link></li>
</ul>
</div>      

<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos del administrador</h1>
       <g:link class="boton1" action="list"><g:message code="Volver" args="[entityName]" /></g:link>
       <p>&nbsp;</p>
       
        <div class="form1">
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${administradorInstance}">
            <div class="errors">
                <g:renderErrors bean="${administradorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${administradorInstance?.id}" />
                <g:hiddenField name="version" value="${administradorInstance?.version}" />
     
                    <table class="tabla2">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'nombre', 'errors')}">
                                    <g:textField style="width:250px" name="nombre" value="${administradorInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apellido"><g:message code="apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'apellido', 'errors')}">
                                    <g:textField style="width:250px" name="apellido" value="${administradorInstance?.apellido}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cedula"><g:message code="cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'cedula', 'errors')}">
                                    <g:textField style="width:250px" name="cedula" value="${fieldValue(bean: administradorInstance, field: 'cedula')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'sexo', 'errors')}">
                                    <g:select style="width:250px" name="sexo" noSelection="['':'Seleccione']" from="['Masculino', 'Femenino']" value="${administradorInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nacionalidad"><g:message code="nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'nacionalidad', 'errors')}">
                                    <g:textField style="width:250px" name="nacionalidad" value="${administradorInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="login"><g:message code="login.label" default="Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'login', 'errors')}">
                                    <g:textField style="width:250px" name="login" value="${administradorInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'password', 'errors')}">
                                    <g:passwordField style="width:250px" name="password" maxlength="10" value="${administradorInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mail"><g:message code="mail.label" default="Mail" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'mail', 'errors')}">
                                    <g:textField style="width:250px" name="mail" value="${administradorInstance?.mail}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <p>&nbsp;</p>
                <div>
                    <g:actionSubmit class="boton_submit2" action="update" value="${message(code: 'button.update.label', default: 'Actualizar')}" />
                    <g:actionSubmit class="boton_submit2" action="delete" value="${message(code: 'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'delete.confirm.message', default: '¿Está seguro?')}');" />
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
