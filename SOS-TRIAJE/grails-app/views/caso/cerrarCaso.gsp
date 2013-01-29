
<%@ page import="caso.Caso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
        <g:if test="${session.ActorSistema.rol == 'Especialista'}">
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Aceptar casos" /></g:link></li>  
        <li><g:link controller="caso" action="rechazarCaso" class="selected"><g:message code="Rechazar casos" /></g:link></li>  
        <li><g:link controller="caso" action="vResolverCaso"><g:message code="Resolver casos" /></g:link></li>
        <li><g:link controller="caso" action="casosSinAsignar"><g:message code="Segunda opinión" /></g:link>
        </g:if>

        <g:if test="${session.ActorSistema.rol == 'Triaje'}">
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Aceptar casos" /></g:link></li>  
        <li><g:link controller="caso" action="vResolverCaso"><g:message code="Resolver casos" /></g:link></li>
        <li><g:link controller="caso" action="casosSinAsignar"><g:message code="Asignar casos" /></g:link>
        <li><g:link controller="caso" action="cerrarCaso" class="selected"><g:message code="Cerrar casos" /></g:link>
        </g:if>
      </ul>
      </div>
      
<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
        
        <div  class="form1">
              <table class="tabla2">
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="descripcion" title="${message(code: 'descipcion.caso.label', default: 'Caso')}" />
                                    
                            <g:sortableColumn property="status" title="${message(code: 'estado.caso.label', default: 'Estado')}" />

                            <g:sortableColumn property="fechaInicio" title="${message(code: 'fecha.inicio.label', default: 'Fecha inicio')}" />

                            <th><g:message code="paciente.nombre.label" default="Nombre Paciente" /></th>
                     
                            <th><g:message code="paciente.ci.label" default="CI Paciente" /></th>
         
                            <th><g:message code="opiniones.label" default="Opiniones" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${casoInstanceList}" status="i" var="casoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                          
                            <td><g:link controller="caso" action="saveCerrarCaso" id="${casoInstance.id}">${fieldValue(bean: casoInstance, field: "id")}</g:link></td>
                      
                            <td style="width:460px;" class="pJustifica"><g:encodeAs codec="NL2BR">${casoInstance.descripcion}</g:encodeAs></td>
                        
                            <td style="width:100px;">${casoInstance.status.nombre}</td>
                            
                            <td style="width:85px;"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${casoInstance.fechaInicio}"/></td>
                            
                            <td style="width:100px;">${casoInstance.paciente.nombre}
                                ${casoInstance.paciente.apellido}
                            </td>                        
                            
                            <td style="width:85px;">${casoInstance.paciente.cedula}</td>
                            
                            <td style="width:200px;">
                                <g:each in="${casoInstance.opiniones}" var="o">
                                  <li><g:link controller="opinion" action="show" id="${o.id}">${o?.nombreOpinion?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            
            <div class="paginateButtons">
                <g:paginate total="${casoInstanceTotal}" />
            </div>           
        </div>
          <p>&nbsp;</p>
<g:link class="boton1" controller="caso" action="listaDeCasosT"><g:message code="button.volver.label" default="Volover" /></g:link>           
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
