

<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
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
            <g:hasErrors bean="${casoInstance}">
            <div class="errors">
                <g:renderErrors bean="${casoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="caso.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${casoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaInicio"><g:message code="caso.fechaInicio.label" default="Fecha Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'fechaInicio', 'errors')}">
                                    <g:datePicker name="fechaInicio" precision="day" value="${casoInstance?.fechaInicio}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paciente"><g:message code="caso.paciente.label" default="Paciente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'paciente', 'errors')}">
                                    <g:select name="paciente.id" from="${persona.Paciente.list()}" optionKey="id" optionValue="nombre" value="${casoInstance?.paciente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaSolucion"><g:message code="caso.fechaSolucion.label" default="Fecha Solucion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'fechaSolucion', 'errors')}">
                                    <g:datePicker name="fechaSolucion" precision="day" value="${casoInstance?.fechaSolucion}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        <%--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="caso.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'status', 'errors')}">
                                    <g:select name="status.id" from="${status.Status.list()}" optionKey="id"  optionValue="nombre" value="${casoInstance?.status?.id}"  />
                                </td>
                            </tr>
                            --%>
                        
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
