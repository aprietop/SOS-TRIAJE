

<%@ page import="persona.ActorSistema" %>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="login" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'estilo.css')}" />
        
        <script type="text/javascript">
            function replaceT(obj){
                var newO=document.createElement('input');
                newO.setAttribute('type','password');
                newO.setAttribute('name',obj.getAttribute('name'));
                newO.setAttribute('class','userlogin')
                obj.parentNode.replaceChild(newO,obj);
                newO.focus();
            }
        </script>
    
</head>
 
<body class="login_fondo">
<div id="cabLogin">
      <h1><img src="${createLinkTo(dir:'images',file:'sos_login.png')}" alt="SOS" width="163" height="95" align="absmiddle" />Referencias Médicas</h1>
</div>
<div id="formLogin">
          <g:form action="login" method="post" >

            <g:if test="${flash.message}">
              <div class="message"><g:message code="${flash.message}" /></div>
            </g:if>

<br/><br/>
            <div id="ingresarboton" class="ingresarboton">
            <input type="submit" name="doit" id="doit" value="Ingresar" class="buttonlogin"/>
            </div>
            </g:form>
          
</div>
</body>
</html>