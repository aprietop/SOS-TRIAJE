
<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.descripcion.label" default="Descripcion" /></td>
                            <td valign="top" class="value">${fieldValue(bean: casoInstance, field: "descripcion")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.fechaInicio.label" default="Fecha Inicio" /></td>
                            <td valign="top" class="value"><g:formatDate date="${casoInstance?.fechaInicio}" /></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.paciente.label" default="Paciente" /></td>
                            <td>${casoInstance.paciente.nombre} ${casoInstance.paciente.apellido}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.fechaSolucion.label" default="Fecha Solucion" /></td>
                            <td valign="top" class="value"><g:formatDate date="${casoInstance?.fechaSolucion}" /></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.status.label" default="Status" /></td>
                            <td>${casoInstance.status.nombre}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.archivos.label" default="Archivos" /></td>
                             <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${casoInstance.archivos}" var="a">
                                    <li><g:link controller="archivo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                   
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caso.opiniones.label" default="Opiniones" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${casoInstance.opiniones}" var="o">
                                    <li><g:link controller="opinion" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
