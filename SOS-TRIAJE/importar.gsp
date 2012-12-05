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

<g:uploadform name="importUser" controller="importar" action="importarArchivos" method="post">
	 
Seleccionar Archivo.
<input type="file" id="fileName" name="fileName" width="250px">
	 
<input type="button" name="importar" id="importar" value="Importar" onclick="confirmar()">
<!-- onClick="confirmar()"En opnclick if(validarCampos()){} -->

</g:uploadform>
    
    
  </body>
</html>
