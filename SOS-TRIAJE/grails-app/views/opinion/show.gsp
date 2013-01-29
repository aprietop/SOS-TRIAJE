
<%@ page import="opinion.Opinion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'opinion.label', default: 'Opinion')}" />
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
  <d>Detalle de opinion</d>
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
                            <td valign="top" class="name"><g:message code="opinion.nombreOpinion.label" default="Nombre Opinion" /></td>
                            <td valign="top" class="value">${fieldValue(bean: opinionInstance, field: "nombreOpinion")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.caso.label" default="Caso" /></td>
                            <td valign="top"  class="pJustifica"><g:encodeAs codec="NL2BR">${opinionInstance?.caso?.descripcion?.encodeAsHTML()}</g:encodeAs></td>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.medico.label" default="Medico" /></td>
                            <td valign="top" class="value">${opinionInstance?.medico?.nombre?.encodeAsHTML()} ${opinionInstance?.medico?.apellido?.encodeAsHTML()}</td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opinion.fechaOpinion.label" default="Fecha Opinion" /></td>
                            <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${opinionInstance?.fechaOpinion}" /></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name" style="width:200px;"><g:message code="opinion.cuerpoOpinion.label" default="Cuerpo Opinion" /></td>
                            <td valign="top"  class="pJustifica">${fieldValue(bean: opinionInstance, field: "cuerpoOpinion")}</td>
                        </tr>                        
                    </tbody>
                </table>
</div>
<p>&nbsp;</p>
<g:link class="boton1" controller="caso" action="listaDeCasosT"><g:message code="Volver"/></g:link>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>         
    </body>
</html>
