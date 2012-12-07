
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
        <li><g:link controller="caso" action="listaDeCasosT"><g:message code="Casos" /></g:link></li>
        <li><g:link controller="historialCaso" action="listaDeHistorialesT" class="selected"><g:message code="Historiales" /></g:link></li>        
        <li><g:link controller="caso" action="casosAsociados"><g:message code="Mis casos" /></g:link></li>
        <li><g:link controller="caso" action="miHistorial"><g:message code="Mi historial" /></g:link></li>
        <li><g:link controller="opinion" action="verRespuestasT"><g:message code="Ver Respuestas" /></g:link></li>
        <li><g:link controller="caso" action="aceptarCaso"><g:message code="Tramitar casos" /></g:link></li>       
        </ul>
      </div>      
      
<div id="nivel1">
  <div id="nivel2">
    <div id="contenido">
    
        <div  class="form1">
           <table class="tabla2">
                    <thead>
                        <tr>
                            <g:sortableColumn property="caso" title="${message(code: 'id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="caso" title="${message(code: 'descipcion.caso.label', default: 'Caso')}" />
                           
                            <g:sortableColumn property="estadoCaso" title="${message(code: 'estado.caso.label', default: 'Estado')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'fecha.label', default: 'Fecha')}" />
                            
                            <g:sortableColumn property="medico" title="${message(code: 'medico.nombre.label', default: 'Medico')}" />
                            
                            <g:sortableColumn property="caso.paciente" title="${message(code: 'paciente.nombre.label', default: 'Paciente')}" />
                            
                            <g:sortableColumn property="caso.paciente" title="${message(code: 'paciente.ci.label', default: 'CI Paciente')}" />
                         </tr>
                    </thead>
                    <tbody>
                    <g:each in="${historialCasoInstanceList}" status="i" var="historialCasoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                                              
                            <td>${historialCasoInstance.caso.id}</td>
                            
                            <td>${historialCasoInstance.caso.descripcion}</td>
                            
                            <td>${historialCasoInstance.estadoCaso}</td>
                        
                            <td><g:formatDate date="${historialCasoInstance.fecha}" /></td>

                            <td>${historialCasoInstance.medico.nombre} 
                                ${historialCasoInstance.medico.apellido}
                            </td>
                            
                            <td>${historialCasoInstance.caso.paciente.nombre}
                                ${historialCasoInstance.caso.paciente.apellido}
                            </td>                        
                            
                            <td>${historialCasoInstance.caso.paciente.cedula}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>            
            <div class="paginateButtons">
                <g:paginate total="${historialCasoInstanceTotal}" />
            </div>
        </div>
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
    </body>
</html>
