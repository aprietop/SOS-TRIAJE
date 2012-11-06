
<%@ page import="persona.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'paciente.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'paciente.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'paciente.apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="cedula" title="${message(code: 'paciente.cedula.label', default: 'Cedula')}" />
                        
                            <g:sortableColumn property="sexo" title="${message(code: 'paciente.sexo.label', default: 'Sexo')}" />
                        
                            <g:sortableColumn property="nacionalidad" title="${message(code: 'paciente.nacionalidad.label', default: 'Nacionalidad')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pacienteInstanceList}" status="i" var="pacienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pacienteInstance.id}">${fieldValue(bean: pacienteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pacienteInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: pacienteInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: pacienteInstance, field: "cedula")}</td>
                        
                            <td>${fieldValue(bean: pacienteInstance, field: "sexo")}</td>
                        
                            <td>${fieldValue(bean: pacienteInstance, field: "nacionalidad")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pacienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
