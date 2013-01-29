
<%@ page import="medico.Triaje" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'triaje.label', default: 'Triaje')}" />
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
<div id="infoSec"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${new Date()}"/>&nbsp;<div><br/></div></div>
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
    <h1>Datos del encargado de triaje</h1>
    <g:link class="boton1" action="list"><g:message code="button.volver.label" default="Volver" args="[entityName]" /></g:link>
      
        <div class="form1">
           
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <p>&nbsp;</p>      
            
                <table class="tabla2">
                    <tbody>
                    
                        <tr>
                            <td valign="top" class="name"><label for="nombre"><g:message code="nombre.label" default="Nombre" /></td></label>
                             <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "nombre")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="apellido"><g:message code="apellido.label" default="Apellido" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "apellido")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="cedula"><g:message code="cedula.label" default="Cedula" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "cedula")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="sexo"><g:message code="sexo.label" default="Sexo" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "sexo")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="nacionalidad"><g:message code="nacionalidad.label" default="Nacionalidad" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "nacionalidad")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="login"><g:message code="login.label" default="Usuario" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "login")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="password"><g:message code="password.label" default="Contraseña" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "password")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="mail"><g:message code="mail.label" default="Correo" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "mail")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="rol"><g:message code="rol.label" default="Rol" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "rol")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="numColegioMedico"><g:message code="numColegioMedico.label" default="Num Colegio Medico" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "numColegioMedico")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="numMinisterioSalud"><g:message code="numMinisterioSalud.label" default="Num Ministerio Salud" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: triajeInstance, field: "numMinisterioSalud")}</td>
                        </tr>
                    </tbody>
                </table>
            <p>&nbsp;</p>
            <div>
                <g:form>
                    <g:hiddenField name="id" value="${triajeInstance?.id}" />
                    <g:actionSubmit class="boton_submit4" action="edit" value="${message(code: 'button.edit.label', default: 'Editar')}" />
                    <g:actionSubmit class="boton_submit4" action="delete" value="${message(code: 'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'delete.confirm.message', default: '¿Está seguro?')}');" />
                </g:form>
            </div>
        </div>
         </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
