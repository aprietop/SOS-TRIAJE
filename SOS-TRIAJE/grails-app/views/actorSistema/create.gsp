

<%@ page import="persona.ActorSistema" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'actorSistema.label', default: 'ActorSistema')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${actorSistemaInstance}">
            <div class="errors">
                <g:renderErrors bean="${actorSistemaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="actorSistema.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${actorSistemaInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido"><g:message code="actorSistema.apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'apellido', 'errors')}">
                                    <g:textField name="apellido" value="${actorSistemaInstance?.apellido}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cedula"><g:message code="actorSistema.cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'cedula', 'errors')}">
                                    <g:textField name="cedula" value="${fieldValue(bean: actorSistemaInstance, field: 'cedula')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sexo"><g:message code="actorSistema.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'sexo', 'errors')}">
                                    <g:textField name="sexo" value="${actorSistemaInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nacionalidad"><g:message code="actorSistema.nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'nacionalidad', 'errors')}">
                                    <g:textField name="nacionalidad" value="${actorSistemaInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login"><g:message code="actorSistema.login.label" default="Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'login', 'errors')}">
                                    <g:textField name="login" value="${actorSistemaInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="actorSistema.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${actorSistemaInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mail"><g:message code="actorSistema.mail.label" default="Mail" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'mail', 'errors')}">
                                    <g:textField name="mail" value="${actorSistemaInstance?.mail}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rol"><g:message code="actorSistema.rol.label" default="Rol" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorSistemaInstance, field: 'rol', 'errors')}">
                                    <g:textField name="rol" value="${actorSistemaInstance?.rol}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
