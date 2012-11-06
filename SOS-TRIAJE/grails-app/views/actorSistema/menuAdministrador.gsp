

<%@ page import="persona.ActorSistema" %>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="referenc" />
  </head>
  <body>
    
    <div id="cabecera">
        <div id="cabColI">
          <div id="logo">
             <h1><img src="${resource(dir:'images',file:'SOS.gif')}" width="97" height="53" align="texttop" />Referencias Médicas</h1>        
          </div>
          <div id="breadcrumbs">
          
          </div>
        </div>
          <div id="cabColD">
          <div id="infoSec">14-12-2011 06:59 PM &nbsp; | &nbsp; Cambiar idioma <a href="#"><img src="${resource(dir:'images',file:'ico_ingles.jpg')}" alt="Inglés" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a> <a href="#"><img src="${resource(dir:'images',file:'ico_port.jpg')}" alt="Portugués" width="25" height="34" hspace="2" border="0" align="absmiddle" /></a></div>
          <div id="header"><div id="loginHeader"><g:loginControl/></div></div>
          </div>
      </div>
    
      <div id="menu1">
      <ul>
        <li><g:link controller="especialidad" action="list" ><g:message code="Especialidad" /></g:link></li>
        <li><g:link controller="especialista" action="list"><g:message code="Especialista" /></g:link></li>	
        <li><g:link controller="triaje" action="list"><g:message code="Triaje"/></g:link></li>
        <li><g:link controller="administrador" action="list"><g:message code="Administrador"/></g:link></li>
        </ul>
      </div> 
    
    <div id="nivel1">
	<div id="listaDominio">
  <ul> 
    <li><a href="#"><img src="${resource(dir:'images',file:'ico_historia_integral.gif')}" width="142" height="101" alt="Historia Integral" />Referencias Médicas</a></li>
  </ul>
  </div>
  <div style="clear:both"></div>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
</div>
  </body>
</html>