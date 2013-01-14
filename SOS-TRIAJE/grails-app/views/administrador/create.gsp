

<%@ page import="persona.Administrador" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
         
        <g:javascript library="jquery" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'estilo.css')}" />
    
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"> </script>
    
        
        <script id="demo" type="text/javascript">
        $(document).ready(function() {
                // propose username by combining first- and lastname
                $("#login").focus(function() {
                        var firstname = $("#nombre").val();
                        var lastname = $("#apellido").val();
                        if(firstname && lastname && !this.value) {
                                this.value = firstname + "." + lastname;
                        }
                });
        });
      </script>
        
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
         <li><g:link controller="administrador" action="list"><g:message code="Modificar Administrador"/></g:link></li>
         <li><g:link controller="administrador" action="create" class="selected"><g:message code="Crear Administrador"/></g:link></li>
        </ul>
      </div>
      
      
        <div id="nivel1">
        <div id="nivel2">
          <div id="contenido">
          <h1>Datos del administrador</h1>
          
          <g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="button.volver.label" default="Volver" /></g:link>
            <p>&nbsp;</p>
            <%--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--%>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${administradorInstance}">
            <div class="errors">
                <g:renderErrors bean="${administradorInstance}" as="list" />
            </div>
            </g:hasErrors>
    
            <div class="form1">
            <g:form action="save" >
                <div class="tabla2">
                    <table>
                        <tbody>
                        <span class="obligatorio">&nbsp;*</span> Campos Obligatorios 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'nombre', 'errors')}">
                                    <g:textField style="width:250px" name="nombre" value="${administradorInstance?.nombre}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido"><g:message code="apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'apellido', 'errors')}">
                                    <g:textField style="width:250px" name="apellido" value="${administradorInstance?.apellido}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cedula"><g:message code="cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'cedula', 'errors')}">
                                    <g:textField style="width:250px" name="cedula" value="${fieldValue(bean: administradorInstance, field: 'cedula')}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sexo"><g:message code="sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'sexo', 'errors')}">
                                    <g:select  style="width:250px" name="sexo" noSelection="['':'Seleccione']" from="['Masculino', 'Femenino']" value="${administradorInstance?.sexo}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nacionalidad"><g:message code="nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'nacionalidad', 'errors')}">
                                    <g:select style="width:250px" name="nacionalidad" noSelection="['':'Seleccione']" from="['V', 'E']" value="${administradorInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login"><g:message code="login.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'login', 'errors')}">
                                    <g:textField style="width:250px" name="login" value="${administradorInstance?.login}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="password.label" default="Contraseña" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'password', 'errors')}">
                                    <g:passwordField style="width:250px" name="password" maxlength="10" value="${administradorInstance?.password}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mail"><g:message code="mail.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administradorInstance, field: 'mail', 'errors')}">
                                    <g:textField style="width:250px" name="mail" value="${administradorInstance?.mail}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                  <p>&nbsp;</p>
                <div>
                    <g:submitButton name="create" class="boton_submit" value="${message(code: 'button.create.label', default: 'Crear')}" />
                </div>
            </g:form>
          </div>
           <p>&nbsp;</p>
          </div>
       </div>
        <p style="clear:both">&nbsp;</p>
      </div>
          </div>
    </body>
</html>
