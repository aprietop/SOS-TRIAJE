
<%@ page import="caso.Caso" %>

<html> 
  <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript library="scriptaculous" />
    
<g:javascript library="prototype"></g:javascript>
<g:javascript>
     function showSpinner(visible) {
         $('spinner').style.display = visible ? "inline" : "none";
     }
     Ajax.Responders.register({
     onLoading: function() {
           showSpinner(true);
     },
     onComplete: function() {
     if(!Ajax.activeRequestCount) showSpinner(false);
     }
   });
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
        <ul>
        <li><g:link controller="caso" action="listaDeCasosT" class="selected"><g:message code="Mis casos" /></g:link></li>
        <li><g:link controller="caso" action="miHistorial"><g:message code="Mi historial" /></g:link></li>
        <li><g:link controller="opinion" action="verMisRespuestas"><g:message code="Ver Respuestas" /></g:link></li>        
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Tramitar casos" /></g:link></li>
        
        <li><g:link controller="caso" action="verPorFecha"><g:message code="fecha" /></g:link></li>
        </ul>
      </div>
    
<g:form action="verPorFecha">
    <p>&nbsp;</p>    
    <label for="desde">
      <g:message code="buscar.desde" />
    </label>
      <g:datePicker name="desde" value="" precision="day" noSelection="['':'']" />

    <label for="hasta">
      <g:message code="buscar.hasta" />
    </label>
      <g:datePicker name="hasta" value="" precision="day" noSelection="['':'']" />    

      <g:submitButton name="buscarF" value="Buscar" class="boton1"/> 
</g:form>    
  
<g:form action="todosCasos">
    <g:submitButton name="buscarT" value="Todos" class="boton1"/> 
</g:form>

  
  <div id="resultadoCasoPorFecha">
    
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
                            <g:sortableColumn property="nombre" title="${message(code: 'paciente.nombre.label', default: 'Nombre Paciente')}" />
                            <g:sortableColumn property="cedula" title="${message(code: 'paciente.ci.label', default: 'CI Paciente')}" />
                            <th><g:message code="opiniones.label" default="Opiniones" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${casoInstanceList}" status="i" var="casoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                          
                            <td>${casoInstance.id}</td>
                           <td>${casoInstance.descripcion}</td>                      
                            <td>${casoInstance.status.nombre}</td>                            
                            <td><g:formatDate date="${casoInstance.fechaInicio}" /></td>                            
                            <td><g:formatDate date="${casoInstance.fechaSolucion}" /></td>                        
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
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>    
  </div>  
</body> 
</html> 
