
<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
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
             <g:form>
            <div class="dialog">
            
              <table>
                    <tbody>
                          <tr class="prop">
                              <td valign="top" class="name"><g:message code="descripcion.label" default="Descripcion" /></td>
                              <td valign="top" class="value"><g:encodeAs codec="NL2BR">${fieldValue(bean: casoInstance, field: "descripcion")}</g:encodeAs></td>
                                                                   
                          <tr class="prop">
                            <td valign="top" class="name">
                              <g:message code="especialidades.label" default="Especialidades" />
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'especialidades', 'errors')}">                              
                              <g:select name="especialidades" style="width:250px" from="${especialidad.Especialidad.list()}" optionKey="id" optionValue="nombre" value="${CasoInstance?.especialidades*.id}" onchange="mostrarEspecialistas(this.value)"   noSelection="['':'Seleccione']"/>
                            </td>
                          </tr>
                          
                          <tr class="prop">
                            <td valign="top" class="name">
                              <g:message code="medico.nombre.label" default="Medico" />
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: casoInstance, field: 'medico', 'errors')}">                              
                              <g:select name="medico" style="width:250px" id="medicos"   noSelection="['':'Seleccione']" />
                            </td>
                          </tr>

                    </tbody>
                </table>
            </div>
            
            <div class="buttons">
                    <g:hiddenField name="id" value="${casoInstance?.id}" />
                    <g:actionSubmit action="saveSolucion" value="${message(code: 'button.guardar.label', default: 'Guardar')}" />
             </div>
            </g:form>
        </div>
    </body>
</html>
