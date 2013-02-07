
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
        <li><g:link controller="caso" action="rechazarCaso"><g:message code="Rechazar casos" /></g:link></li>  
        <li><g:link controller="caso" action="vResolverCaso"><g:message code="Resolver casos" /></g:link></li>
        <li><g:link controller="caso" action="casosSinAsignar" class="selected"><g:message code="Segunda opinión" /></g:link>
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

                            <th><g:message code="especialidad.label" default="Especialidad" /></th>

                            <g:sortableColumn property="nombre" title="${message(code: 'paciente.label', default: 'Paciente')}" />

                           <!-- <g:sortableColumn property="cedula" title="${message(code: 'paciente.ci.label', default: 'CI Paciente')}" />-->

                            <th><g:message code="opiniones.label" default="Opiniones" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${casoInstanceList}" status="i" var="casoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                          
                            <td><g:link controller="historialCaso" action="historial2daOpinion" id="${casoInstance.id}">${fieldValue(bean: casoInstance, field: "id")}</g:link></td>
                      
                            <td style="width:460px;" class="pJustifica"><g:encodeAs codec="NL2BR">${casoInstance.descripcion}</g:encodeAs></td>
                        
                            <td style="width:100px;">${casoInstance.status.nombre}</td>
                            
                            <td style="width:85px;"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${casoInstance.fechaInicio}"/></td>
                            
                            <td style="width:100px;">
                                <g:each in="${casoInstance.especialidades}" var="e">
                                  ${e?.nombre?.encodeAsHTML()}
                                </g:each>                            
                            </td>                              
                        
                            <td style="width:100px;">
                              <g:link controller="paciente" action="show" id="${casoInstance.paciente.id}">
                                ${casoInstance.paciente.nombre}
                                ${casoInstance.paciente.apellido}<br/>
                                C.I. ${casoInstance.paciente.cedula}
                              </g:link>
                            </td>                        
                            
                            <!--<td style="width:85px;">${casoInstance.paciente.cedula}</td>-->
                            
                            <td style="width:140px;">
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
