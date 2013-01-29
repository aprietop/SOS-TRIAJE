

<%@ page import="medico.Especialista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialista.label', default: 'Especialista')}" />
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
<div id="infoSec"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${new Date()}"/>&nbsp;<div><br/></div></div>
<div id="header"><div id="loginHeader"><g:loginControl/></div></div>
</div>
</div>

<div id="menu1">
<ul>
<li><g:link controller="especialista" action="list" class="selected"><g:message code="Modificar Especialista"/></g:link></li>
<li><g:link controller="especialista" action="create"><g:message code="Cargar Especialista"/></g:link></li>
</ul>
</div>
            
<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos del especialista</h1>
       <g:link class="boton1" action="list"><g:message code="button.volver.label" default="Volver" args="[entityName]" /></g:link>
              
        <div class="form1">
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialistaInstance}">
            <div class="error">
                <g:renderErrors bean="${especialistaInstance}" as="list" />
            </div>
            </g:hasErrors>
          <p>&nbsp;</p>
          
            <g:form method="post" >
                <g:hiddenField name="id" value="${especialistaInstance?.id}" />
                <g:hiddenField name="version" value="${especialistaInstance?.version}" />
               
                    <table class="tabla2">
                        <tbody>
                        <span class="obligatorio">&nbsp;*</span> Campos Obligatorios 
                            <tr>
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'nombre', 'errors')}">
                                    <g:textField style="width:250px" name="nombre" value="${especialistaInstance?.nombre}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="apellido"><g:message code="apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'apellido', 'errors')}">
                                    <g:textField style="width:250px" name="apellido" value="${especialistaInstance?.apellido}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="cedula"><g:message code="cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'cedula', 'errors')}">
                                    <g:textField style="width:250px" name="cedula" value="${fieldValue(bean: especialistaInstance, field: 'cedula')}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'sexo', 'errors')}">
                                    <g:select style="width:250px" name="sexo" noSelection="['':'Seleccione']" from="['Masculino', 'Femenino']" value="${especialistaInstance?.sexo}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="nacionalidad"><g:message code="nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'nacionalidad', 'errors')}">
                                    <g:select style="width:250px" name="nacionalidad" noSelection="['':'Seleccione']" from="['V', 'E']" value="${especialistaInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="login"><g:message code="login.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'login', 'errors')}">
                                    <g:textField style="width:250px" name="login" value="${especialistaInstance?.login}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="password.label" default="Contraseña" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'password', 'errors')}">
                                    <g:passwordField style="width:250px" name="password" value="${especialistaInstance?.password}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="mail"><g:message code="mail.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'mail', 'errors')}">
                                    <g:textField style="width:250px" name="mail" value="${especialistaInstance?.mail}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="numColegioMedico"><g:message code="numColegioMedico.label" default="Num Colegio Medico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'numColegioMedico', 'errors')}">
                                    <g:textField style="width:250px" name="numColegioMedico" value="${fieldValue(bean: especialistaInstance, field: 'numColegioMedico')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="numMinisterioSalud"><g:message code="numMinisterioSalud.label" default="Num Ministerio Salud" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'numMinisterioSalud', 'errors')}">
                                    <g:textField style="width:250px" name="numMinisterioSalud" value="${fieldValue(bean: especialistaInstance, field: 'numMinisterioSalud')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="horarioDeTrabajo"><g:message code="horarioDeTrabajo.label" default="Horario De Trabajo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'horarioDeTrabajo', 'errors')}">
                                    <g:textField style="width:250px" name="horarioDeTrabajo" value="${especialistaInstance?.horarioDeTrabajo}" />
                                </td>
                            </tr>
                        
                            
                            <tr>
                                <td valign="top" class="name">
                                  <label for="especialidades"><g:message code="especialidad.label" default="Especialidades" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'especialidades', 'errors')}">
                                    <g:select name="especialidades" from="${especialidad.Especialidad.list()}" multiple="yes" optionKey="id"
                                              optionValue="nombre" size="5" value="${especialistaInstance?.especialidades*.id}"  style="width:250px"/><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                <p>&nbsp;</p>
                <div>
                    <g:actionSubmit class="boton_submit2" action="update" value="${message(code: 'button.update.label', default: 'Actualizar')}" />
                    <g:actionSubmit class="boton_submit2" action="delete" value="${message(code: 'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'delete.confirm.message', default: 'Are you sure?')}');" />
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
