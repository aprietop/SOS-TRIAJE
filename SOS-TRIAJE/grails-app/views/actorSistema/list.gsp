
<%@ page import="persona.ActorSistema" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'actorSistema.label', default: 'ActorSistema')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'actorSistema.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'actorSistema.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'actorSistema.apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="cedula" title="${message(code: 'actorSistema.cedula.label', default: 'Cedula')}" />
                        
                            <g:sortableColumn property="sexo" title="${message(code: 'actorSistema.sexo.label', default: 'Sexo')}" />
                        
                            <g:sortableColumn property="nacionalidad" title="${message(code: 'actorSistema.nacionalidad.label', default: 'Nacionalidad')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${actorSistemaInstanceList}" status="i" var="actorSistemaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${actorSistemaInstance.id}">${fieldValue(bean: actorSistemaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: actorSistemaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: actorSistemaInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: actorSistemaInstance, field: "cedula")}</td>
                        
                            <td>${fieldValue(bean: actorSistemaInstance, field: "sexo")}</td>
                        
                            <td>${fieldValue(bean: actorSistemaInstance, field: "nacionalidad")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${actorSistemaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
