

<%@ page import="caso.HistorialCaso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'historialCaso.label', default: 'HistorialCaso')}" />
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
            <g:hasErrors bean="${historialCasoInstance}">
            <div class="errors">
                <g:renderErrors bean="${historialCasoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha"><g:message code="historialCaso.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: historialCasoInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${historialCasoInstance?.fecha}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caso"><g:message code="historialCaso.caso.label" default="Caso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: historialCasoInstance, field: 'caso', 'errors')}">
                                    <g:select name="caso.id" from="${caso.Caso.list()}" optionKey="id" optionValue="descripcion" value="${historialCasoInstance?.caso?.id}"  />
                                </td>
                            </tr>
                        
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="descipcion.caso.label" default="Id" /></td>                            
                            <td valign="top"  name="desCaso" class="value">${historialCasoInstance.descripcion}</td>                            
                          </tr>                            
                            
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="ListaEspecialidades"><g:message code="especialidad.label" default="Especialidad" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: historialCasoInstance, field: 'especialidad', 'errors')}">
                              <g:select name="especialidades" style="width:250px" disabled="false" noSelection="['':'Seleccione']"  from="${especialidadList}" optionKey="id" optionValue="nombre" value="id" onclick="mostrarEspecialistas(this.value)" />
                            </td>
                          </tr>
                          
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="medicos"><g:message code="historialCaso.medico.label" default="Medico" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: historialCasoInstance, field: 'medico', 'errors')}">
                              <g:select name="medico" style="width:250px" id="medicos" value="${params.nombre}"  disabled="false" noSelection="['0':'Seleccione']"/>
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
