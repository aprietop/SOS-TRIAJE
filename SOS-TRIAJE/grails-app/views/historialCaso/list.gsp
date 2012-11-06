
<%@ page import="caso.HistorialCaso" %>
<%@ page import="caso.Caso" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'historialCaso.label', default: 'HistorialCaso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'historialCaso.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'historialCaso.fecha.label', default: 'Fecha')}" />
                        
                            <th><g:message code="historialCaso.caso.label" default="Caso" /></th>
                        
                            <th><g:message code="historialCaso.medico.label" default="Medico" /></th>
                        
                            <g:sortableColumn property="estadoCaso" title="${message(code: 'historialCaso.estadoCaso.label', default: 'Estado Caso')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${historialCasoInstanceList}" status="i" var="historialCasoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${historialCasoInstance.id}">${fieldValue(bean: historialCasoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${historialCasoInstance.fecha}" /></td>
                        
                            <td>${fieldValue(bean: historialCasoInstance, field: "caso.descripcion")}</td>
                        
                            <td>${fieldValue(bean: historialCasoInstance, field: "medico.nombre")} 
                                ${fieldValue(bean: historialCasoInstance, field: "medico.apellido")}</td>
                        
                            <td>${fieldValue(bean: historialCasoInstance, field: "estadoCaso")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${historialCasoInstanceTotal}" />
            </div>
    <p>&nbsp;</p>
    <g:link class="boton1" controller="actorSistema" action="menuTriaje"><g:message code="Volver"/></g:link>            
        </div>
    </body>
</html>
