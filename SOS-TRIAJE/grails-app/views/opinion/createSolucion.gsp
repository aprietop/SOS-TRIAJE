

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
            <g:form action="saveSolucion" >
                <div class="dialog">
                    <table>
                      <span class="obligatorio">&nbsp;*</span> Campos Obligatorios
                        <tbody>
                            <input type="hidden" value="${fieldValue(bean: casoInstance, field: "id")}" name="idCaso"/>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombreOpinion"><g:message code="opinion.nombreOpinion.label" default="Nombre Opinion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'nombreOpinion', 'errors')}">
                                    <g:textField name="nombreOpinion" value="${opinionInstance?.nombreOpinion}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cuerpoOpinion"><g:message code="opinion.cuerpoOpinion.label" default="Cuerpo Opinion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'cuerpoOpinion', 'errors')}">
                                    <g:textArea style="width:250px" name="cuerpoOpinion" value="${opinionInstance?.cuerpoOpinion}"/><span class="obligatorio">&nbsp;*</span>
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
