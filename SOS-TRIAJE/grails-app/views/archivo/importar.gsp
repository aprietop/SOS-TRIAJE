<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>

<g:form name="importUser" controller="archivo" action="importarArchivos" method="post" enctype="multipart/form-data">
    <input type="file" id="fileName" name="fileName" width="250px"/>
    <g:submitButton name="importar" value="Importar"/>    
</g:form>  
    
  </body>
</html>