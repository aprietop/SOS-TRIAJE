

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
<div id="infoSec">14-12-2011 06:59 PM &nbsp; | &nbsp; Cambiar idioma <a href="#"><img src="${resource(dir:'images',file:'ico_ingles.jpg')}" alt="Inglés" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a> <a href="#"><img src="${resource(dir:'images',file:'ico_port.jpg')}" alt="Portugués" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a></div>
<div id="header"><div id="loginHeader"><g:loginControl/></div></div>
</div>
</div>

<div id="menu1">
<ul>
<li><g:link controller="especialista" action="list" class="selected"><g:message code="Modificar Especialista"/></g:link></li>
<li><g:link controller="especialista" action="create"><g:message code="Crear Especialista"/></g:link></li>
</ul>
</div>
            
<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos del especialista</h1>
       <g:link class="boton1" action="list"><g:message code="Volver" args="[entityName]" /></g:link>
       <p>&nbsp;</p>
       
        <div class="form1">
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialistaInstance}">
            <div class="errors">
                <g:renderErrors bean="${especialistaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${especialistaInstance?.id}" />
                <g:hiddenField name="version" value="${especialistaInstance?.version}" />
               
                    <table class="tabla2">
                        <tbody>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="especialista.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'nombre', 'errors')}">
                                    <g:textField style="width:250px" name="nombre" value="${especialistaInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="apellido"><g:message code="especialista.apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'apellido', 'errors')}">
                                    <g:textField style="width:250px" name="apellido" value="${especialistaInstance?.apellido}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="cedula"><g:message code="especialista.cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'cedula', 'errors')}">
                                    <g:textField style="width:250px" name="cedula" value="${fieldValue(bean: especialistaInstance, field: 'cedula')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="especialista.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'sexo', 'errors')}">
                                    <g:select style="width:250px" name="sexo" noSelection="['':'Seleccione']" from="['Masculino', 'Femenino']" value="${especialistaInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="nacionalidad"><g:message code="especialista.nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'nacionalidad', 'errors')}">
                                    <g:textField style="width:250px" name="nacionalidad" value="${especialistaInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="login"><g:message code="especialista.login.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'login', 'errors')}">
                                    <g:textField style="width:250px" name="login" value="${especialistaInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="especialista.password.label" default="Contraseña" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'password', 'errors')}">
                                    <g:passwordField style="width:250px" name="password" value="${especialistaInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="mail"><g:message code="especialista.mail.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'mail', 'errors')}">
                                    <g:textField style="width:250px" name="mail" value="${especialistaInstance?.mail}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="numColegioMedico"><g:message code="especialista.numColegioMedico.label" default="Num Colegio Medico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'numColegioMedico', 'errors')}">
                                    <g:textField style="width:250px" name="numColegioMedico" value="${fieldValue(bean: especialistaInstance, field: 'numColegioMedico')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="numMinisterioSalud"><g:message code="especialista.numMinisterioSalud.label" default="Num Ministerio Salud" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'numMinisterioSalud', 'errors')}">
                                    <g:textField style="width:250px" name="numMinisterioSalud" value="${fieldValue(bean: especialistaInstance, field: 'numMinisterioSalud')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="horarioDeTrabajo"><g:message code="especialista.horarioDeTrabajo.label" default="Horario De Trabajo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'horarioDeTrabajo', 'errors')}">
                                    <g:textField style="width:250px" name="horarioDeTrabajo" value="${especialistaInstance?.horarioDeTrabajo}" />
                                </td>
                            </tr>
                        
                            
                            <tr>
                                <td valign="top" class="name">
                                  <label for="especialidades"><g:message code="especialista.especialidades.label" default="Especialidades" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'especialidades', 'errors')}">
                                    <g:select name="especialidades" from="${especialidad.Especialidad.list()}" multiple="yes" optionKey="id"
                                              optionValue="nombre" size="5" value="${especialistaInstance?.especialidades*.id}"  style="width:250px"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                <p>&nbsp;</p>
                <div>
                    <g:actionSubmit class="boton_submit2" action="update" value="${message(code: 'button.update.label', default: 'Actualizar')}" />
                    <g:actionSubmit class="boton_submit2" action="delete" value="${message(code: 'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
