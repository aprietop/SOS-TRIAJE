
<%@ page import="persona.Administrador" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
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
<li><g:link controller="administrador" action="list" class="selected"><g:message code="Modificar Administrador"/></g:link></li>
<li><g:link controller="administrador" action="create"><g:message code="Crear Administrador"/></g:link></li>
</ul>
</div>
      
      <%--
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>--%>
    
      
      <div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos del administrador</h1>
    <g:link class="boton1" action="list"><g:message code="Volver" args="[entityName]" /></g:link>
      <p>&nbsp;</p>      
      
        <div class="form1">
           <%-- <h1><g:message code="default.show.label" args="[entityName]" /></h1>--%>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
                <table class="tabla2">
                    <tbody>
                       <tr class="prop">
                            <td valign="top" class="name"><label for="nombre"><g:message code="administrador.nombre.label" default="Nombre" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "nombre")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="apellido"><g:message code="administrador.apellido.label" default="Apellido" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "apellido")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="cedula"><g:message code="administrador.cedula.label" default="Cedula" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "cedula")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="sexo"><g:message code="administrador.sexo.label" default="Sexo" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "sexo")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="nacionalidad"><g:message code="administrador.nacionalidad.label" default="Nacionalidad" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "nacionalidad")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="login"><g:message code="administrador.login.label" default="Login" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "login")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="password"><g:message code="administrador.password.label" default="Password" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "password")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="mail"><g:message code="administrador.mail.label" default="Mail" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "mail")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="rol"><g:message code="administrador.rol.label" default="Rol" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: administradorInstance, field: "rol")}</td>
                        </tr>
                    
                    </tbody>
                </table>
          <p>&nbsp;</p>
            <div>
                <g:form>
                    <g:hiddenField name="id" value="${administradorInstance?.id}" />
                    <g:actionSubmit class="edit boton_submit4" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="delete boton_submit4" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
            </div>
        </div>
    </body>
</html>
