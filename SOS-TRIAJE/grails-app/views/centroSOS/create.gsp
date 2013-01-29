

<%@ page import="centro.CentroSOS" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'centroSOS.label', default: 'CentroSOS')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
         <li><g:link controller="centroSOS" action="list"><g:message code="Modificar Centro SOS"/></g:link></li>
         <li><g:link controller="centroSOS" action="create" class="selected"><g:message code="Cargar Centro SOS"/></g:link></li>
        </ul>
      </div> 


                
       <div id="nivel1">
        <div id="nivel2">
          <div id="contenido">
          
          <h1>Datos del Centro SOS</h1>
          <g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="button.volver.label" default="Volover" /></g:link>
                      
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${centroSOSInstance}">
            <div class="error">
                <g:renderErrors bean="${centroSOSInstance}" as="list" />
            </div>
            </g:hasErrors>
            <p>&nbsp;</p>          
            
            <div  class="form1"> 
            <g:form action="save" >
                    <table class="tabla2">
                        <tbody>            
                          <span class="obligatorio">&nbsp;*</span> Campos Obligatorios 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: centroSOSInstance, field: 'nombre', 'errors')}">
                                    <g:textField style="width:250px" name="nombre" value="${centroSOSInstance?.nombre}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="centroSOS.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: centroSOSInstance, field: 'url', 'errors')}">
                                    <g:textField style="width:250px" name="url" value="${centroSOSInstance?.url}" />
                                </td>
                            </tr>
                       
                        </tbody>
                    </table>
                <div>
                    <span class="button"><g:submitButton name="create" class="boton_submit" value="${message(code: 'button.create.label', default: 'Crear')}" /></span>
                </div>
            </g:form>
        </div>
 <p>&nbsp;</p>
          </div>
       </div>
        <p style="clear:both">&nbsp;</p>
      </div>           
    </body>
</html>