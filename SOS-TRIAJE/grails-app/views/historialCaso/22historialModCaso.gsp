

<%@ page import="caso.HistorialCaso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'historialCaso.label', default: 'HistorialCaso')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${CasoInstance}">
            <div class="errors">
                <g:renderErrors bean="${CasoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="saveAsignacion" >
                <div class="dialog">
                    <table>
                        <tbody>
                        <%--
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="historialCaso.id.label" default="Id" /></td>                            
                            <td valign="top" class="value">${fieldValue(bean: CasoInstance, field: "id")}</td>                            
                          </tr>--%>
                          
                          
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="descipcion.caso.label" default="Id" /></td>                            
                            <td valign="top"  name="desCaso" class="value">${CasoInstance.descripcion}</td>                            
                          </tr>                          
                           
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="fecha" default="Fecha" /></td>                            
                            <td valign="top"  name="fecha" class="value">${fechaActual}</td>
                          </tr>
                          
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="ListaEspecialidades"><g:message code="especialidad.label" default="Especialidad" /></label>
                            </td>
                            <td valign="top" class="value ${CasoInstance}">
                              <g:select name="especialidades" style="width:250px" disabled="false" noSelection="['':'Seleccione']"  from="${especialidadList}" optionKey="id" optionValue="nombre" value="id" onclick="mostrarEspecialistas(this.value)" />
                            </td>
                          </tr>
                          
                          <tr class="prop">
                            <td valign="top" class="name">
                              <label for="medicos"><g:message code="historialCaso.medico.label" default="Medico" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: CasoInstance, field: 'medico', 'errors')}">
                              <g:select name="medico" style="width:250px" id="medicos" value="${params.nombre}"  disabled="false" noSelection="['0':'Seleccione']"/>
                            </td>
                          </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'button.asignar.label', default: 'Asignar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
