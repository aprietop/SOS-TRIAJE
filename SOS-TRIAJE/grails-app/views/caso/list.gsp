
<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'caso.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'caso.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="fechaInicio" title="${message(code: 'caso.fechaInicio.label', default: 'Fecha Inicio')}" />
                        
                            <th><g:message code="caso.paciente.label" default="Paciente" /></th>
                            
                            <th><g:message code="caso.medico.label" default="Medico" /></th>
                        
                            <g:sortableColumn property="fechaSolucion" title="${message(code: 'caso.fechaSolucion.label', default: 'Fecha Solucion')}" />
                        
                            <th><g:message code="caso.status.label" default="Status" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${casoInstanceList}" status="i" var="casoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${casoInstance.id}">${fieldValue(bean: casoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: casoInstance, field: "descripcion")}</td>
                        
                            <td><g:formatDate date="${casoInstance.fechaInicio}" /></td>
                        
                            <td>${fieldValue(bean: casoInstance, field: "paciente.nombre")}
                                ${fieldValue(bean: casoInstance, field: "paciente.apellido")}
                            </td>
                            
                            <td>${fieldValue(bean: casoInstance, field: "historialCasos.medico.nombre")}</td>
                        
                            <td><g:formatDate date="${casoInstance.fechaSolucion}" /></td>
                        
                            <td>${fieldValue(bean: casoInstance, field: "status.nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${casoInstanceTotal}" />
            </div>
    <p>&nbsp;</p>
    <g:link class="boton1" controller="actorSistema" action="menuTriaje"><g:message code="Volver"/></g:link>            
        </div>
    </body>
</html>
