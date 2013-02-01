

<%@ page import="medico.Medico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'medico.label', default: 'Medico')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${medicoInstance}">
            <div class="errors">
                <g:renderErrors bean="${medicoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${medicoInstance?.id}" />
                <g:hiddenField name="version" value="${medicoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="medico.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${medicoInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apellido"><g:message code="medico.apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'apellido', 'errors')}">
                                    <g:textField name="apellido" value="${medicoInstance?.apellido}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cedula"><g:message code="medico.cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'cedula', 'errors')}">
                                    <g:textField name="cedula" value="${fieldValue(bean: medicoInstance, field: 'cedula')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="medico.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'sexo', 'errors')}">
                                    <g:textField name="sexo" value="${medicoInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nacionalidad"><g:message code="medico.nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'nacionalidad', 'errors')}">
                                    <g:textField name="nacionalidad" value="${medicoInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="login"><g:message code="medico.login.label" default="Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'login', 'errors')}">
                                    <g:textField name="login" value="${medicoInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="medico.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${medicoInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mail"><g:message code="medico.mail.label" default="Mail" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'mail', 'errors')}">
                                    <g:textField name="mail" value="${medicoInstance?.mail}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rol"><g:message code="medico.rol.label" default="Rol" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'rol', 'errors')}">
                                    <g:textField name="rol" value="${medicoInstance?.rol}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numColegioMedico"><g:message code="medico.numColegioMedico.label" default="Num Colegio Medico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'numColegioMedico', 'errors')}">
                                    <g:textField name="numColegioMedico" value="${fieldValue(bean: medicoInstance, field: 'numColegioMedico')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numMinisterioSalud"><g:message code="medico.numMinisterioSalud.label" default="Num Ministerio Salud" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'numMinisterioSalud', 'errors')}">
                                    <g:textField name="numMinisterioSalud" value="${fieldValue(bean: medicoInstance, field: 'numMinisterioSalud')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="opiniones"><g:message code="medico.opiniones.label" default="Opiniones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: medicoInstance, field: 'opiniones', 'errors')}">
                                    
<ul>
<g:each in="${medicoInstance?.opiniones?}" var="o">
    <li><g:link controller="opinion" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="opinion" action="create" params="['medico.id': medicoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'opinion.label', default: 'Opinion')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
