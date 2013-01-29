

<%@ page import="especialidad.Especialidad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialidad.label', default: 'Especialidad')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
      
            
<div id="cabecera">
  <div id="cabColI">
    <div id="logo">
       <h1><img src="${resource(dir:'images',file:'SOS.gif')}" width="97" height="53" align="texttop" />Referencias Médicas</h1>        
    </div>
    <div id="breadcrumbs">
        <p>&nbsp;</p>
    </div>
  </div>
          <div id="cabColD">
          <div id="infoSec"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${new Date()}"/>&nbsp;<div><br/></div></div>
          <div id="header"><div id="loginHeader"><g:loginControl/></div></div>
        </div>
</div>

<div id="menu1">
  <ul>
   <li><g:link controller="especialidad" action="list" class="selected"><g:message code="Modificar Especialidades"/></g:link></li>
   <li><g:link controller="especialidad" action="create"><g:message code="Crear especialidad"/></g:link></li>
  </ul>
</div>  
      

     <g:form method="post" >
        <g:hiddenField name="id" value="${especialidadInstance?.id}" />
        <g:hiddenField name="version" value="${especialidadInstance?.version}" />

<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos de la especialidad</h1>
       <g:link class="boton1" controller="especialidad" action="list"><g:message code="button.volver.label" default="Volover" /></g:link>
              
        <div class="form1">
          
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialidadInstance}">
            <div class="error">
                <g:renderErrors bean="${especialidadInstance}" as="list" />
            </div>
            </g:hasErrors>
          <p>&nbsp;</p>
          
            <table class="tabla2">
              <span class="obligatorio">&nbsp;*</span> Campos Obligatorios 
                <tbody>
                  
                    <tr>
                        <td valign="top">
                            <label for="numMinisterioSalud"><g:message code="nombre.label" default="Nombre" /></td></label>
                        <td valign="top" class="value ${hasErrors(bean: especialidadInstance, field: 'nombre', 'errors')}">
                            <g:textField style="width:250px" name="nombre" value="${especialidadInstance?.nombre}" /><span class="obligatorio">&nbsp;*</span>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <label for="numMinisterioSalud"><g:message code="descripcion.label" default="Descripcion" /></td></label>
                        <td valign="top" class="value ${hasErrors(bean: especialidadInstance, field: 'descripcion', 'errors')}">
                            <g:textArea style="width:250px" name="descripcion" value="${especialidadInstance?.descripcion}" /><span class="obligatorio">&nbsp;*</span>
                        </td>
                    </tr>

                </tbody>
            </table>
            
            <p>&nbsp;</p>
            <div>
            <g:actionSubmit class="boton_submit2" action="update" value="${message(code: 'button.update.label', default: 'Actualizar')}" />
            <g:actionSubmit class="boton_submit2" action="delete" value="${message(code: 'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'delete.confirm.message', default: '¿Está seguro?')}');" />
            </div>
        </div>
        
    <p>&nbsp;</p>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
      </g:form>
     
    </body>
</html>
