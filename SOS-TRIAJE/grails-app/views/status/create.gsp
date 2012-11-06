

<%@ page import="status.Status" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
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
            <g:hasErrors bean="${statusInstance}">
            <div class="errors">
                <g:renderErrors bean="${statusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="status.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statusInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${statusInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaStatus"><g:message code="status.fechaStatus.label" default="Fecha Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statusInstance, field: 'fechaStatus', 'errors')}">
                                    <g:datePicker name="fechaStatus" precision="day" value="${statusInstance?.fechaStatus}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="decripcion"><g:message code="status.decripcion.label" default="Decripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statusInstance, field: 'decripcion', 'errors')}">
                                    <g:textField name="decripcion" value="${statusInstance?.decripcion}" />
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
