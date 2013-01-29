
<%@ page import="centro.CentroSOS" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'centroSOS.label', default: 'CentroSOS')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
     <li><g:link controller="centroSOS" action="list" class="selected"><g:message code="Modificar Centro SOS"/></g:link></li>
     <li><g:link controller="centroSOS" action="create"><g:message code="Cargar Centro SOS"/></g:link></li>
    </ul>
  </div>    

<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    <h1>Datos del Centro SOS</h1>
    <g:link class="boton1" action="list"><g:message code="button.volver.label" default="Volover" args="[entityName]" /></g:link>
      
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <p>&nbsp;</p>
            
               <div class="form1">         
                <table class="tabla2">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="Centro"><g:message code="centroSOS.id.label" default="Centro" /></td></label>
                              <td valign="top" class="value">${fieldValue(bean: centroSOSInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="Nombre"><g:message code="nombre.label" default="Nombre" /></td></label>
                            
                            <td valign="top" class="value">${fieldValue(bean: centroSOSInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="Url"><g:message code="centroSOS.url.label" default="Url" /></td></label>
                            
                            <td valign="top" class="value">${fieldValue(bean: centroSOSInstance, field: "url")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><label for="Uuid"><g:message code="centroSOS.uuid.label" default="Uuid" /></td></label>
                            
                            <td valign="top" class="value">${fieldValue(bean: centroSOSInstance, field: "uuid")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>    
<p>&nbsp;</p>
            <div>
                <g:form>
                    <g:hiddenField name="id" value="${centroSOSInstance?.id}" />
                    <g:actionSubmit class="boton_submit4" action="edit" value="${message(code: 'button.edit.label', default: 'Editar')}" />
                    <g:actionSubmit class="boton_submit4" action="delete" value="${message(code:  'button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>          
        </div>
</div>
            <p>&nbsp;</p>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
