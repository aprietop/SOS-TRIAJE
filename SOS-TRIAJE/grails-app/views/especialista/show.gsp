
<%@ page import="medico.Especialista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialista.label', default: 'Especialista')}" />
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
            
                <table class="tabla2">
                    <tbody>
                        <tr>
                            <td valign="top" class="name"><label for="nombre"><g:message code="especialista.nombre.label" default="Nombre" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "nombre")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="apellido"><g:message code="especialista.apellido.label" default="Apellido" /></td></label>
                            
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "apellido")}</td>
                            
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="cedula"><g:message code="especialista.cedula.label" default="Cedula" /></td></label>
                             <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "cedula")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="sexo"><g:message code="especialista.sexo.label" default="Sexo" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "sexo")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="nacionalidad"><g:message code="especialista.nacionalidad.label" default="Nacionalidad" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "nacionalidad")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="login"><g:message code="especialista.login.label" default="Usuario" /></td></label>
                             <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "login")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="password"><g:message code="especialista.password.label" default="Contraseña" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "password")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="mail"><g:message code="especialista.mail.label" default="Correo" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "mail")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="numColegioMedico"><g:message code="especialista.numColegioMedico.label" default="Num Colegio Medico" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "numColegioMedico")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="numMinisterioSalud"><g:message code="especialista.numMinisterioSalud.label" default="Num Ministerio Salud" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "numMinisterioSalud")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="horarioDeTrabajo"><g:message code="especialista.horarioDeTrabajo.label" default="Horario De Trabajo" /></td></label>
                            <td valign="top" class="value">${fieldValue(bean: especialistaInstance, field: "horarioDeTrabajo")}</td>
                        </tr>
                    
                        <tr>
                            <td valign="top" class="name"><label for="especialidades"><g:message code="especialista.especialidades.label" default="Especialidades" /></td></label>
                            <td valign="top" class="value">
                                <ul>
                                <g:each in="${especialistaInstance.especialidades}" var="e">
                                    <g:link controller="especialidad" action="show" id="${e.id}">${e?.nombre}</g:link>
                                </g:each>
                                </ul>
                            </td>
                        </tr>                    
                    </tbody>
                </table>
            <p>&nbsp;</p>
            <div>
                <g:form>
                    <g:hiddenField name="id" value="${especialistaInstance?.id}" />
                    <g:actionSubmit class="boton_submit4" action="edit" value="${message(code: 'button.edit.label', default: 'Editar')}" />
                    <g:actionSubmit class="boton_submit4" action="delete" value="${message(code: 'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
