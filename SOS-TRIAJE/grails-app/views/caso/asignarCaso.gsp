
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
          <div id="infoSec">14-12-2011 06:59 PM &nbsp; | &nbsp; Cambiar idioma <a href="#"><img src="${resource(dir:'images',file:'ico_ingles.jpg')}" alt="Inglés" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a> <a href="#"><img src="${resource(dir:'images',file:'ico_port.jpg')}" alt="Portugués" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a></div>
          <div id="header"><div id="loginHeader"><g:loginControl/></div></div>
        </div>
      </div>

      <div id="menu1">
      <ul>       
        <g:if test="${session.ActorSistema.rol == 'Triaje'}">        
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Aceptar casos" /></g:link></li>
        <li><g:link controller="caso" action="vResolverCaso"><g:message code="Resolver casos" /></g:link></li>  
        <li><g:link controller="caso" action="casosSinAsignar" class="selected"><g:message code="Asignar casos" /></g:link></li>
        <li><g:link controller="caso" action="cerrarCaso"><g:message code="Cerrar casos" /></g:link>
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
                            <g:sortableColumn property="id" title="${message(code: 'caso.id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="descripcion" title="${message(code: 'descipcion.caso.label', default: 'Caso')}" />
                                    
                            <g:sortableColumn property="status" title="${message(code: 'estado.caso.label', default: 'Estado')}" />

                            <g:sortableColumn property="fechaInicio" title="${message(code: 'fecha.inicio.label', default: 'Fecha inicio')}" />

                            <g:sortableColumn property="fechaSolucion" title="${message(code: 'fecha.solucion.label', default: 'Fecha solucion')}" />
                            
                            <th><g:message code="paciente.nombre.label" default="Nombre Paciente" /></th>
                            <%--<g:sortableColumn property="nombre" title="${message(code: 'paciente.nombre.label', default: 'Nombre Paciente')}" />--%>
                            
                            <th><g:message code="paciente.ci.label" default="CI Paciente" /></th>
                            <%--<g:sortableColumn property="cedula" title="${message(code: 'paciente.ci.label', default: 'CI Paciente')}" />--%>

                            <th><g:message code="opiniones.label" default="Opiniones" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${casoInstanceList}" status="i" var="casoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                          
                            <td><g:link controller="historialCaso" action="historialModCaso" id="${casoInstance.id}">${fieldValue(bean: casoInstance, field: "id")}</g:link></td>
                      
                            <td>${casoInstance.descripcion}</td>
                        
                            <td>${casoInstance.status.nombre}</td>
                            
                            <td><g:formatDate format="dd-MM-yyyy" date="${casoInstance.fechaInicio}"/></td>
                            
                            <td><g:formatDate format="dd-MM-yyyy" date="${casoInstance.fechaSolucion}"/></td>
                                                    
                            <td>${casoInstance.paciente.nombre}
                                ${casoInstance.paciente.apellido}
                            </td>                        
                            
                            <td>${casoInstance.paciente.cedula}</td>
                            
                            <td>
                              <ul>
                                <g:each in="${casoInstance.opiniones}" var="o">
                                  <li><g:link controller="opinion" action="show" id="${o.id}">${o?.nombreOpinion?.encodeAsHTML()}</g:link></li>
                                </g:each>
                              </ul>
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
<g:link class="boton1" controller="caso" action="listaDeCasosT"><g:message code="Volver"/></g:link>           
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
