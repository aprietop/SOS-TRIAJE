
<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
        
        <r:require module="jquery-ui"/>
        <g:javascript library="jquery" />

        <jqui:resources themeCss="../css/jquery/jquery-ui-1.8.16.custom.css"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'estilo.css')}" />
        <g:javascript src="../js/jquery/jquery.Jcrop.js" />
        <g:javascript src="../js/jquery/jquery.Jcrop.min.js" />

        <script type="text/javascript" src="../js/jquery/jquery-ui-i18n.min.js"></script>
        <script type="text/javascript" src="../js/jquery/jquery-ui-timepicker-addon.js"> </script>

        <script type="text/javascript" src="${createLinkTo(dir:'js/jquery' ,file:'jquery.form.js')}"></script>
        <g:javascript src='formToWizard.js' />
        <g:javascript src='funciones.js' />
        <g:javascript src='jquery.validate.js' />
        <link rel="stylesheet" href="${resource(dir:'css',file:'wizard.css')}" />
        
<g:javascript>
          function mostrarEspecialistas(id){
          <!--  if(id>0){-->
              ${remoteFunction( 
                  controller:'especialista', 
                  action:'ajaxGetEspecialistas', 
                  update:'medicos', 
                  params:'\'id=\' + id')}
            <!--}-->
          }
</g:javascript>

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
      <b>
        
      </b>
      </div>
      
        <div id="nivel1">
        <div id="nivel2">
          <div id="contenido">
            
        <div class="form1">

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
             <g:form>
                      
              <table class="tabla2">
                      <span class="obligatorio">&nbsp;*</span> Campos Obligatorios   
                      <p>&nbsp;</p>
                    <tbody>
                      
                          <input type="hidden" value="${fieldValue(bean: casoInstance, field: "id")}" name="idCaso"/>                      
                            
                          <tr class="prop">
                                <td valign="top" class="name">
                                    <g:message code="opinion.nombreOpinion.label" default="Título Solución" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opinionInstance, field: 'nombreOpinion', 'errors')}">
                                    <g:textField style="width:250px" name="nombreOpinion" value="${opinionInstance?.nombreOpinion}" /><span class="obligatorio">&nbsp;*</span>
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
            <div >
                    <g:hiddenField name="id" value="${casoInstance?.id}" />
                    <g:actionSubmit class="boton_submit5" action="saveSolucion" value="${message(code: 'button.solucionar', default: 'Enviar')}" />
             </div>
            </g:form>
        </div>
</div>
        <p style="clear:both">&nbsp;</p>
      </div>
           </div>            
    </body>
</html>
