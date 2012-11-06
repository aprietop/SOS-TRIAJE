
<%@ page import="medico.Medico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'medico.label', default: 'Medico')}" />
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
                            <td valign="top" class="name"><g:message code="medico.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.apellido.label" default="Apellido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "apellido")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.cedula.label" default="Cedula" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "cedula")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.sexo.label" default="Sexo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "sexo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.nacionalidad.label" default="Nacionalidad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "nacionalidad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.login.label" default="Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "login")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.mail.label" default="Mail" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "mail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.rol.label" default="Rol" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "rol")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.numColegioMedico.label" default="Num Colegio Medico" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "numColegioMedico")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.numMinisterioSalud.label" default="Num Ministerio Salud" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: medicoInstance, field: "numMinisterioSalud")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="medico.opiniones.label" default="Opiniones" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${medicoInstance.opiniones}" var="o">
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
                    <g:hiddenField name="id" value="${medicoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
