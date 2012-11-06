
<%@ page import="caso.HistorialCaso" %>
<%@ page import="caso.Caso" %>

<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'historialCaso.label', default: 'HistorialCaso')}" />
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
        <li><g:link controller="caso" action="listaDeCasosT"><g:message code="Casos" /></g:link></li>
        <li><g:link controller="historialCaso" action="listaDeHistorialesT"><g:message code="Historiales" /></g:link></li>
        <li><g:link controller="caso" action="casosAsociados"><g:message code="Mis casos" /></g:link></li>
        <li><g:link controller="caso" action="mostrarPorMedico" class="selected"><g:message code="Mi historial" /></g:link></li>
        <li><g:link controller="opinion" action="verRespuestasT"><g:message code="Ver Respuestas" /></g:link></li>
        <li><g:link controller="caso" action="modificarCasos"><g:message code="Asignar casos" /></g:link></li>
  </g:if>
  <g:if test="${session.ActorSistema.rol == 'Especialista'}">
    <li><g:link controller="caso" action="listaDeCasosT"><g:message code="Mis casos" /></g:link></li>
    <li><g:link controller="caso" action="mostrarPorMedico" class="selected"><g:message code="Mi historial" /></g:link></li>
    <li><g:link controller="opinion" action="verRespuestasT"><g:message code="Ver Respuestas" /></g:link></li>
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
                  <g:sortableColumn property="fecha" title="${message(code: 'fecha.label', default: 'Fecha')}" />
                  
                  <g:sortableColumn property="caso" title="${message(code: 'descipcion.caso.label', default: 'Caso')}" />
                  
                  <g:sortableColumn property="estadoCaso" title="${message(code: 'estado.caso.label', default: 'Estado')}" />
                          
                  <g:sortableColumn property="caso.fechaInicio" title="${message(code: 'fecha.inicio.label', default: 'Fecha Inicio')}" />
                  
                  <g:sortableColumn property="caso.fechaSolucion" title="${message(code: 'fecha.solucion.label', default: 'Fecha Solución')}" />
                  
                  <g:sortableColumn property="caso.paciente.nombre" title="${message(code: 'paciente.nombre.label', default: 'Nombre paciente')}" />
                  
                  <g:sortableColumn property="caso.paciente.cedula" title="${message(code: 'paciente.ci.label', default: 'CI paciente')}" />
                  
                  <th><g:message code="opiniones.label" default="Opiniones" /></th>
                                    
              </tr>
          </thead>
          <tbody>
          <g:each in="${historialCasoInstanceList}" status="i" var="historialCasoInstance">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                  <td><g:formatDate date="${historialCasoInstance.fecha}" /></td>

                  <td>${fieldValue(bean: historialCasoInstance, field: "caso.descripcion")}</td>
                  
                  <td>${fieldValue(bean: historialCasoInstance, field: "estadoCaso")}</td>
                  
                  <td>${fieldValue(bean: historialCasoInstance, field: "caso.fechaInicio")}</td>

                  <td>${fieldValue(bean: historialCasoInstance, field: "caso.fechaSolucion")}</td>
                  
                  <td>${fieldValue(bean: historialCasoInstance, field: "caso.paciente.nombre")}
                      ${fieldValue(bean: historialCasoInstance, field: "caso.paciente.apellido")}</td>
                  
                  <td>${fieldValue(bean: historialCasoInstance, field: "caso.paciente.cedula")}</td>
                  
                 <td>
                    <ul>
                    <g:each in="${historialCasoInstance.caso.opiniones}" var="o">
                        <li><g:link controller="opinion" action="show" id="${o.id}">${o?.nombreOpinion?.encodeAsHTML()}</g:link></li>
                    </g:each>
                    </ul>
                 </td>
                            
                  </tr>
              </tr>
          </g:each>
          </tbody>
      </table>          
        </div>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
</body>

<html>