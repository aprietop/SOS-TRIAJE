
<%@ page import="persona.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
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
<div id="infoSec">14-12-2011 06:59 PM &nbsp; | &nbsp; Cambiar idioma <a href="#"><img src="${resource(dir:'images',file:'ico_ingles.jpg')}" alt="Inglés" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a> <a href="#"><img src="${resource(dir:'images',file:'ico_port.jpg')}" alt="Portugués" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a></div>
<div id="header"><div id="loginHeader"><g:loginControl/></div></div>
</div>
</div>      
      
<div id="menu1">
<ul>
  <d>Detalle del paciente</d>
</ul>
</div>       
      
      <div id="nivel1">
  <div id="nivel2">
    <div id="contenido">      
      
        <div class="form1">

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
           
                <table  class="tabla2">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paciente.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pacienteInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paciente.apellido.label" default="Apellido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pacienteInstance, field: "apellido")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paciente.cedula.label" default="Cedula" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pacienteInstance, field: "cedula")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paciente.sexo.label" default="Sexo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pacienteInstance, field: "sexo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paciente.nacionalidad.label" default="Nacionalidad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pacienteInstance, field: "nacionalidad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="paciente.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${pacienteInstance?.fechaNacimiento}"/></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
     </div>
      <p>&nbsp;</p>
<g:link class="boton1" controller="caso" action="listaDeCasosT"><g:message code="Elegir caso"/></g:link>
</div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>             
    </body>
</html>
