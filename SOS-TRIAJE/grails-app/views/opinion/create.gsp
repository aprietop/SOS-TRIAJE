

<%@ page import="opinion.Opinion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opinion.label', default: 'Opinion')}" />
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
            <g:hasErrors bean="${opinionInstance}">
            <div class="errors">
                <g:renderErrors bean="${opinionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaOpinion"><g:message code="opinion.fechaOpinion.label" default="Fecha Opinion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'fechaOpinion', 'errors')}">
                                    <g:datePicker name="fechaOpinion" precision="day" value="${opinionInstance?.fechaOpinion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cuerpoOpinion"><g:message code="opinion.cuerpoOpinion.label" default="Cuerpo Opinion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'cuerpoOpinion', 'errors')}">
                                    <g:textField name="cuerpoOpinion" value="${opinionInstance?.cuerpoOpinion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estadoOpinion"><g:message code="opinion.estadoOpinion.label" default="Estado Opinion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'estadoOpinion', 'errors')}">
                                    <g:textField name="estadoOpinion" value="${opinionInstance?.estadoOpinion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="medico"><g:message code="opinion.medico.label" default="Medico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'medico', 'errors')}">
                                    <g:select name="medico.id" from="${medico.Medico.list()}" optionKey="id" value="${opinionInstance?.medico?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caso"><g:message code="opinion.caso.label" default="Caso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'caso', 'errors')}">
                                    <g:select name="caso.id" from="${caso.Caso.list()}" optionKey="id" value="${opinionInstance?.caso?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombreOpinion"><g:message code="opinion.nombreOpinion.label" default="Nombre Opinion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'nombreOpinion', 'errors')}">
                                    <g:textField name="nombreOpinion" value="${opinionInstance?.nombreOpinion}" />
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
