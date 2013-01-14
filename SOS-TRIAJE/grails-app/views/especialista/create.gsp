

<%@ page import="medico.Especialista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'especialista.label', default: 'Especialista')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        
        
        <g:javascript library="jquery" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'estilo.css')}" />
    
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"> </script>
    
        
        <script id="demo" type="text/javascript">
        $(document).ready(function() {
                // propose username by combining first- and lastname
                $("#login").focus(function() {
                        var firstname = $("#nombre").val();
                        var lastname = $("#apellido").val();
                        if(firstname && lastname && !this.value) {
                                this.value = firstname + "." + lastname;
                        }
                });
        });
      </script>
     
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
         <li><g:link controller="especialista" action="list"><g:message code="Modificar Especialista"/></g:link></li>
         <li><g:link controller="especialista" action="create" class="selected"><g:message code="Cargar Especialista"/></g:link></li>
        </ul>
      </div>
      
        <div id="nivel1">
        <div id="nivel2">
          <div id="contenido">
          <h1>Datos del Especialista</h1>
          <g:link class="boton1" controller="actorSistema" action="menuAdministrador"><g:message code="button.volver.label" default="Volver" /></g:link>
          
            <p>&nbsp;</p>
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialistaInstance}">
            <div class="errors">
                <g:renderErrors bean="${especialistaInstance}" as="list" />
            </div>
            </g:hasErrors>
    
            <div class="form1">
            <g:form action="save" >
                <div class="tabla2">
                    <table>
                        <tbody>
                        <span class="obligatorio">&nbsp;*</span> Campos Obligatorios 
                            <tr>
                                <td valign="top">
                                    <label for="nombre"><g:message code="nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'nombre', 'errors')}">
                                    <g:textField  style="width:250px" name="nombre" value="${especialistaInstance?.nombre}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="apellido"><g:message code="apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'apellido', 'errors')}">
                                    <g:textField  style="width:250px" name="apellido" value="${especialistaInstance?.apellido}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="cedula"><g:message code="cedula.label" default="Cedula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'cedula', 'errors')}">
                                    <g:textField  style="width:250px" name="cedula" value="${fieldValue(bean: especialistaInstance, field: 'cedula')}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="sexo"><g:message code="sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'sexo', 'errors')}">
                                    <g:select  style="width:250px" name="sexo" noSelection="['':'Seleccione']" from="['Masculino', 'Femenino']" value="${especialistaInstance?.sexo}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top">
                                    <label for="nacionalidad"><g:message code="nacionalidad.label" default="Nacionalidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'nacionalidad', 'errors')}">
                                    <g:select style="width:250px" name="nacionalidad" noSelection="['':'Seleccione']" from="['V', 'E']" value="${especialistaInstance?.nacionalidad}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="login"><g:message code="login.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'login', 'errors')}">
                                    <g:textField  style="width:250px" name="login" value="${especialistaInstance?.login}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="password"><g:message code="password.label" default="Contraseña" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'password', 'errors')}">
                                    <g:passwordField  style="width:250px" name="password" value="${especialistaInstance?.password}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="mail"><g:message code="mail.label" default="Correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'mail', 'errors')}">
                                    <g:textField  style="width:250px" name="mail" value="${especialistaInstance?.mail}" /><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top">
                                    <label for="numColegioMedico"><g:message code="numColegioMedico.label" default="Num Colegio Medico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'numColegioMedico', 'errors')}">
                                    <g:textField  style="width:250px" name="numColegioMedico" value="${fieldValue(bean: especialistaInstance, field: 'numColegioMedico')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="numMinisterioSalud"><g:message code="numMinisterioSalud.label" default="Num Ministerio Salud" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'numMinisterioSalud', 'errors')}">
                                    <g:textField  style="width:250px" name="numMinisterioSalud" value="${fieldValue(bean: especialistaInstance, field: 'numMinisterioSalud')}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="horarioDeTrabajo"><g:message code="horarioDeTrabajo.label" default="Horario De Trabajo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'horarioDeTrabajo', 'errors')}">
                                    <g:textField  style="width:250px" name="horarioDeTrabajo" value="${especialistaInstance?.horarioDeTrabajo}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top">
                                    <label for="especialidad1"><g:message code="especialidad.label" default="Especialidad 1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'especialidad', 'errors')}">
                                    <g:select  style="width:250px" name="especialidad" noSelection="['':'Seleccione']" from="${especialidad.Especialidad.list()}" optionKey="id" optionValue="nombre" 
                                    value="${especialistaInstance?.especialidades?.id}"/><span class="obligatorio">&nbsp;*</span>
                                </td>
                            </tr>
                            
                            <tr>
                                <td valign="top">
                                    <label for="especialidad2"><g:message code="especialidad.label" default="Especialidad 2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialistaInstance, field: 'especialidad', 'errors')}">
                                    <g:select  style="width:250px" name="especialidad2" noSelection="['':'Seleccione']" from="${especialidad.Especialidad.list()}" optionKey="id" optionValue="nombre" 
                                    value="${especialistaInstance?.especialidades?.id}"/>
                                    
                                    <g:link class="boton1" controller="especialista" action="cargarOtraEspecialidad"><g:message code="Otra"/></g:link>
                                 </td>
                           </tr>  
                           <g:if test="${tipo=='visible'}">    
                           <tr>                              
                              <td valign="top">
                                <label for="especialidad3"><g:message code="especialidad.label" default="Especialidad 3" /></label>
                                </td>
                                <td valign="top"  class="value ${hasErrors(bean: especialistaInstance, field: 'especialidad', 'errors')}">
                                    <g:select  style="width:250px" name="especialidad3" noSelection="['':'Seleccione']" from="${especialidad.Especialidad.list()}" optionKey="id" optionValue="nombre" 
                                    value="${especialistaInstance?.especialidades?.id}"/>
                                 </td>
                            </tr>
                          </g:if>
                          <g:else>
                           <tr>                              
                              <td valign="top" style="visibility:hidden">
                                <label for="especialidad3"><g:message code="especialidad.label" default="Especialidad 3" /></label>
                                </td>
                                <td valign="top"  style="hidden" class="value ${hasErrors(bean: especialistaInstance, field: 'especialidad', 'errors')}">
                                    <g:select  style="width:250px" style="visibility:hidden" name="especialidad3" noSelection="['':'Seleccione']" from="${especialidad.Especialidad.list()}" optionKey="id" optionValue="nombre" 
                                    value="${especialistaInstance?.especialidades?.id}"/>
                                </td>
                            </tr>                            
                          </g:else>
                        </tbody>
                    </table>              
              <p>&nbsp;</p>
                <div>
                    <g:submitButton name="create" class="boton_submit" value="${message(code: 'button.create.label', default: 'Crear')}" />
                </div>
            </g:form>
        </div>
           <p>&nbsp;</p>
          </div>
       </div>
        <p style="clear:both">&nbsp;</p>
      </div>
           </div>
    </body>
</html>
