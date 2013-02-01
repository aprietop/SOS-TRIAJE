

<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${casoInstance}">
            <div class="errors">
                <g:renderErrors bean="${casoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${casoInstance?.id}" />
                <g:hiddenField name="version" value="${casoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="caso.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${casoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaInicio"><g:message code="caso.fechaInicio.label" default="Fecha Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'fechaInicio', 'errors')}">
                                    <g:datePicker name="fechaInicio" precision="day" value="${casoInstance?.fechaInicio}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paciente"><g:message code="caso.paciente.label" default="Paciente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'paciente', 'errors')}">
                                    <g:select name="paciente.id" from="${persona.Paciente.list()}" optionKey="id" value="${casoInstance?.paciente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaSolucion"><g:message code="caso.fechaSolucion.label" default="Fecha Solucion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'fechaSolucion', 'errors')}">
                                    <g:datePicker name="fechaSolucion" precision="day" value="${casoInstance?.fechaSolucion}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="caso.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'status', 'errors')}">
                                    <g:select name="status.id" from="${status.Status.list()}" optionKey="id" value="${casoInstance?.status?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="especialidades"><g:message code="caso.especialidades.label" default="Especialidades" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'especialidades', 'errors')}">
                                    <g:select name="especialidades" from="${especialidad.Especialidad.list()}" multiple="yes" optionKey="id" size="5" value="${casoInstance?.especialidades*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="archivos"><g:message code="caso.archivos.label" default="Archivos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'archivos', 'errors')}">
                                    
<ul>
<g:each in="${casoInstance?.archivos?}" var="a">
    <li><g:link controller="archivo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="archivo" action="create" params="['caso.id': casoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'archivo.label', default: 'Archivo')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="historialCasos"><g:message code="caso.historialCasos.label" default="Historial Casos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'historialCasos', 'errors')}">
                                    
<ul>
<g:each in="${casoInstance?.historialCasos?}" var="h">
    <li><g:link controller="historialCaso" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="historialCaso" action="create" params="['caso.id': casoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'historialCaso.label', default: 'HistorialCaso')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="opiniones"><g:message code="caso.opiniones.label" default="Opiniones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'opiniones', 'errors')}">
                                    
<ul>
<g:each in="${casoInstance?.opiniones?}" var="o">
    <li><g:link controller="opinion" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="opinion" action="create" params="['caso.id': casoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'opinion.label', default: 'Opinion')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
