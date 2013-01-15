
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
          <g:if test="${nMetodo==1}">
            <li><g:link controller="opinion" action="verRespuestasT" class="selected"><g:message code="Todas las respuestas" /></g:link></li>
            <li><g:link controller="opinion" action="verOtrasRespuestas"><g:message code="Respuestas a mis casos" /></g:link></li>
            <li><g:link controller="opinion" action="verMisRespuestas"><g:message code="Mis respuestas" /></g:link></li>
          </g:if>      
          <g:if test="${nMetodo==2}">
            <li><g:link controller="opinion" action="verRespuestasT"><g:message code="Todas las respuestas" /></g:link></li>
            <li><g:link controller="opinion" action="verOtrasRespuestas" class="selected"><g:message code="Respuestas a mis casos" /></g:link></li>
            <li><g:link controller="opinion" action="verMisRespuestas"><g:message code="Mis respuestas" /></g:link></li>
          </g:if>          
          <g:if test="${nMetodo==3}">
            <li><g:link controller="opinion" action="verRespuestasT"><g:message code="Todas las respuestas" /></g:link></li>
            <li><g:link controller="opinion" action="verOtrasRespuestas"><g:message code="Respuestas a mis casos" /></g:link></li>
            <li><g:link controller="opinion" action="verMisRespuestas" class="selected"><g:message code="Mis respuestas" /></g:link></li>
          </g:if>
        </g:if> 
          
        <g:if test="${session.ActorSistema.rol == 'Especialista'}">
          <g:if test="${nMetodo==2}">
            <li><g:link controller="opinion" action="verMisRespuestas"><g:message code="Mis respuestas" /></g:link></li>
            <li><g:link controller="opinion" action="verOtrasRespuestas" class="selected"><g:message code="Respuestas a mis casos" /></g:link></li>
          </g:if>          
          <g:if test="${nMetodo==3}">
            <li><g:link controller="opinion" action="verMisRespuestas" class="selected"><g:message code="Mis respuestas" /></g:link></li>
            <li><g:link controller="opinion" action="verOtrasRespuestas"><g:message code="Respuestas a mis casos" /></g:link></li>
          </g:if>
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
              <g:sortableColumn property="id" title="${message(code: 'opinion.id.label', default: 'Id')}" />
              
              <g:sortableColumn property="fechaOpinion" title="${message(code: 'opinion.fechaOpinion.label', default: 'Fecha Opinion')}" />

              <g:sortableColumn property="cuerpoOpinion" title="${message(code: 'opinion.cuerpoOpinion.label', default: 'Cuerpo Opinion')}" />
              
              <g:sortableColumn property="medico" title="${message(code: 'opinion.medico.label', default: 'Medico')}" />
              
              <g:sortableColumn property="caso" title="${message(code: 'opinion.caso.label', default: 'Caso')}" />
                     
          </tr>
      </thead>
          <tbody>
          <g:each in="${opinionInstanceList}" status="i" var="opinionList">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <g:each in="${opinionList}" status="j" var="opinionInstance">
                <tr>

                  <td><g:link action="show" id="${opinionInstance.id}">${fieldValue(bean: opinionInstance, field: "id")}</g:link></td>

                  <td><g:formatDate format="dd-MM-yyyy" date="${opinionInstance.fechaOpinion}"/></td>

                  <td>${fieldValue(bean: opinionInstance, field: "cuerpoOpinion")}</td>

                  <td>${fieldValue(bean: opinionInstance, field: "medico.nombre")}
                      ${fieldValue(bean: opinionInstance, field: "medico.apellido")}
                  </td>

                  <td>${fieldValue(bean: opinionInstance, field: "caso.descripcion")}</td>
                  
                 </tr>
            </g:each>                
            </tr>
          </g:each>
          </tbody>
      </table>     
           
            <div class="paginateButtons">
                <g:paginate total="${opinionInstanceTotal}" />
            </div>
        </div>
          <p>&nbsp;</p>
<g:link class="boton1" controller="caso" action="listaDeCasosT"><g:message code="Volver"/></g:link>          
    </div>      
  </div>
  <p style="clear:both">&nbsp;</p>
</div>
</body>

<html>