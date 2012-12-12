

<%@ page import="archivo.Archivo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}" />
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
            <g:hasErrors bean="${archivoInstance}">
            <div class="errors">
                <g:renderErrors bean="${archivoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="archivo.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: archivoInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${archivoInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="archivo.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: archivoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${archivoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="adjunto"><g:message code="archivo.adjunto.label" default="Adjunto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: archivoInstance, field: 'adjunto', 'errors')}">
                                    <input type="file" id="adjunto" name="adjunto" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caso"><g:message code="archivo.caso.label" default="Caso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: archivoInstance, field: 'caso', 'errors')}">
                                    <g:select name="caso.id" from="${caso.Caso.list()}" optionKey="id" value="${archivoInstance?.caso?.id}"  />
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
