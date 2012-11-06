
<%@ page import="medico.Medico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'medico.label', default: 'Medico')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'medico.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'medico.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'medico.apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="cedula" title="${message(code: 'medico.cedula.label', default: 'Cedula')}" />
                        
                            <g:sortableColumn property="sexo" title="${message(code: 'medico.sexo.label', default: 'Sexo')}" />
                        
                            <g:sortableColumn property="nacionalidad" title="${message(code: 'medico.nacionalidad.label', default: 'Nacionalidad')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${medicoInstanceList}" status="i" var="medicoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${medicoInstance.id}">${fieldValue(bean: medicoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: medicoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: medicoInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: medicoInstance, field: "cedula")}</td>
                        
                            <td>${fieldValue(bean: medicoInstance, field: "sexo")}</td>
                        
                            <td>${fieldValue(bean: medicoInstance, field: "nacionalidad")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${medicoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
