

<%@ page import="opinion.Opinion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'opinion.label', default: 'Opinion')}" />
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
          <div id="infoSec">14-12-2011 06:59 PM &nbsp; | &nbsp; Cambiar idioma <a href="#"><img src="${resource(dir:'images',file:'ico_ingles.jpg')}" alt="Inglés" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a> <a href="#"><img src="${resource(dir:'images',file:'ico_port.jpg')}" alt="Portugués" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a></div>
          <div id="header"><div id="loginHeader"><g:loginControl/></div></div>
          </div>
      </div>
      
      <div id="menu1">
      <ul>
      </ul>
      </div>
      
      
        <div id="nivel1">
        <div id="nivel2">
          <div id="contenido">
            
            
        <div class="form1">

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${opinionInstance}">
            <div class="errors">
                <g:renderErrors bean="${opinionInstance}" as="list" />
            </div>
            </g:hasErrors>
          
            <%--<g:form action="saveSolucion" > --%>
              
                    <table class="tabla2">
                      <span class="obligatorio">&nbsp;*</span> Campos Obligatorios
                        <tbody>
                            <input type="hidden" value="${fieldValue(bean: casoInstance, field: "id")}" name="idCaso"/>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <g:message code="opinion.nombreOpinion.label" default="Título Solución" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'nombreOpinion', 'errors')}">
                                    <g:textField name="nombreOpinion" value="${opinionInstance?.nombreOpinion}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <g:message code="opinion.cuerpoOpinion.label" default="Cuerpo Solución" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'cuerpoOpinion', 'errors')}">
                                    <g:textArea style="width:250px" name="cuerpoOpinion" value="${opinionInstance?.cuerpoOpinion}"/><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>  
                        </tbody>
                    </table>   
          <p>&nbsp;</p>
             <div>
                    <g:hiddenField name="id" value="${opinionInstance?.id}" />
                    <g:actionSubmit class="boton_submit5" action="saveSolucion" value="${message(code: 'button.solucionar', default: 'Enviar')}" />
             </div>
          
             <%-- <g:submitButton name="create" class="boton_submit5" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
            </g:form>--%>
        </div>
       </div>
        <p style="clear:both">&nbsp;</p>
      </div>
          </div>            
    </body>
</html>
