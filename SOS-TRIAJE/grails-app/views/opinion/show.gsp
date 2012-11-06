
<%@ page import="opinion.Opinion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opinion.label', default: 'Opinion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opinionInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.fechaOpinion.label" default="Fecha Opinion" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${opinionInstance?.fechaOpinion}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.cuerpoOpinion.label" default="Cuerpo Opinion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opinionInstance, field: "cuerpoOpinion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.estadoOpinion.label" default="Estado Opinion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opinionInstance, field: "estadoOpinion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.medico.label" default="Medico" /></td>
                            
                            <td valign="top" class="value"><g:link controller="medico" action="show" id="${opinionInstance?.medico?.id}">${opinionInstance?.medico?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.caso.label" default="Caso" /></td>
                            
                            <td valign="top" class="value"><g:link controller="caso" action="show" id="${opinionInstance?.caso?.id}">${opinionInstance?.caso?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.nombreOpinion.label" default="Nombre Opinion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opinionInstance, field: "nombreOpinion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.opiniones.label" default="Opiniones" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${opinionInstance.opiniones}" var="o">
                                    <li><g:link controller="opinion" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${opinionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
