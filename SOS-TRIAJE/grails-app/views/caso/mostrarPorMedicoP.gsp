
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
          <div id="infoSec"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${new Date()}"/>&nbsp;<div><br/></div></div>
          <div id="header"><div id="loginHeader"><g:loginControl/></div></div>
        </div>
      </div>
  
<div id="menu1">
<ul>
  <g:if test="${session.ActorSistema.rol == 'Triaje'}">
        <li><g:link controller="caso" action="listaDeCasosT"><g:message code="Casos" /></g:link></li>
        <li><g:link controller="historialCaso" action="listaDeHistorialesT"><g:message code="Historiales" /></g:link></li>        
        <li><g:link controller="caso" action="casosAsociados"><g:message code="Mis casos" /></g:link></li>
        <li><g:link controller="caso" action="miHistorial" class="selected"><g:message code="Mi historial" /></g:link></li>
        <li><g:link controller="opinion" action="verRespuestasT"><g:message code="Ver Respuestas" /></g:link></li>       
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Tramitar casos" /></g:link></li>        
  </g:if>
  <g:if test="${session.ActorSistema.rol == 'Especialista'}">
        <li><g:link controller="caso" action="listaDeCasosT"><g:message code="Mis casos" /></g:link></li>
        <li><g:link controller="caso" action="miHistorial" class="selected"><g:message code="Mi historial" /></g:link></li>
        <li><g:link controller="opinion" action="verMisRespuestas"><g:message code="Ver Respuestas" /></g:link></li>
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Tramitar casos" /></g:link></li>   
  </g:if>
</ul>
</div>
 
<div id="nivel1">
<div id="nivel3"> 
<g:form  method="post">
    <label for="desde">
      <g:message code="buscar.desde.label" default="Desde" />
    </label>
      <g:datePicker name="desde" value="" precision="day" noSelection="['':'']" />

    <label for="hasta">
      <g:message code="buscar.hasta.label" default="Hasta" />
    </label>
      <g:datePicker name="hasta" value="" precision="day" noSelection="['':'']" />    
   
<g:actionSubmit action="verHistorialesPorFecha" value="Filtrar" class="boton1"/>

<g:actionSubmit action="miHistorial" value="Todos" class="boton1"/>

</g:form>     
 
</div>      
</div>
  
<div id="nivel1">
<div id="nivel2">
<div id="contenido">
<div  class="form1">  
 <table class="tabla2">
          <thead>
              <tr>
                <g:if test="${tipoBusqueda==1}">
                  <g:sortableColumn property="fecha" title="${message(code: 'fecha.label', default: 'Fecha')}" />
                  
                  <g:sortableColumn property="caso" title="${message(code: 'descipcion.caso.label', default: 'Caso')}" />
                  
                  <g:sortableColumn property="estadoCaso" title="${message(code: 'estado.caso.label', default: 'Estado')}" />
                  
                  <g:sortableColumn property="medico.nombre" title="${message(code: 'medico.nombre.label', default: 'Nombre Medico')}" />
                          
                  <g:sortableColumn property="caso.fechaInicio" title="${message(code: 'fecha.inicio.label', default: 'Fecha Inicio')}" />
                  
                  <g:sortableColumn property="caso.fechaSolucion" title="${message(code: 'fecha.solucion.label', default: 'Fecha Solución')}" />
                  
                  <g:sortableColumn property="caso.paciente.nombre" title="${message(code: 'paciente.label', default: 'Paciente')}" />
                  
                  <!--<g:sortableColumn property="caso.paciente.cedula" title="${message(code: 'paciente.ci.label', default: 'CI paciente')}" />-->
                  
                  <th><g:message code="opiniones.label" default="Opiniones" /></th>
                </g:if>
                <g:if test="${tipoBusqueda==2}">                  
                  <th><g:message code="fecha.label" default="Fecha" /></th>
                                    
                  <th><g:message code="descipcion.caso.label" default="Caso" /></th>
                  
                  <th><g:message code="estado.caso.label" default="Estado" /></th>
                          
                  <th><g:message code="medico.nombre.label" default="Nombre Medico" /></th>
                  
                  <th><g:message code="fecha.inicio.label" default="Fecha Inicio" /></th>
                  
                  <th><g:message code="fecha.solucion.label" default="Fecha Solucion" /></th>
                                    
                  <th><g:message code="paciente.label" default="Paciente" /></th>
                  
                  <!--<th><g:message code="paciente.ci.label" default="CI Paciente" /></th>-->
                  
                  <th><g:message code="opiniones.label" default="Opiniones" /></th>
                </g:if>
              </tr>
          </thead>
          <tbody>
          <g:each in="${historialCasoInstanceList}" status="i" var="historialCasoList">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <g:each in="${historialCasoList}" status="j" var="historialCasoInstance">
                <tr>
                  <td style="width:65px;"><g:formatDate format="dd-MM-yyyy HH:mm a date="${historialCasoInstance.fecha}"/></td>

                  <td style="width:340px;" class="pJustifica"><g:encodeAs codec="NL2BR">${fieldValue(bean: historialCasoInstance, field: "caso.descripcion")}</g:encodeAs></td>
                  
                  <td style="width:75px;">${fieldValue(bean: historialCasoInstance, field: "estadoCaso")}</td>
                  
                  <td style="width:75px;">${fieldValue(bean: historialCasoInstance, field: "medico.nombre")}
                      ${fieldValue(bean: historialCasoInstance, field: "medico.apellido")}</td>  
               
                  <td style="width:85px;"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${historialCasoInstance.caso.fechaInicio}"/></td>

                  <td style="width:85px;"><g:formatDate format="dd-MM-yyyy HH:mm a" date="${historialCasoInstance.caso.fechaSolucion}"/></td>
                  
                  <td style="width:100px;">
                    <g:link controller="paciente" action="show" id="${historialCasoInstance.caso.paciente.id}">
                      ${fieldValue(bean: historialCasoInstance, field: "caso.paciente.nombre")}
                      ${fieldValue(bean: historialCasoInstance, field: "caso.paciente.apellido")}<br/>
                      C.I. ${historialCasoInstance.caso.paciente.cedula}
                    </g:link>
                    </td>
                  
                  <!--<td style="width:75px;">${fieldValue(bean: historialCasoInstance, field: "caso.paciente.cedula")}</td>-->
                  
                 <td style="width:120px;">
                    <g:each in="${historialCasoInstance.caso.opiniones}" var="o">
                        <li><g:link controller="opinion" action="show" id="${o.id}">${o?.nombreOpinion?.encodeAsHTML()}</g:link></li>
                    </g:each>
                 </td>
                 </tr>
            </g:each>                
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