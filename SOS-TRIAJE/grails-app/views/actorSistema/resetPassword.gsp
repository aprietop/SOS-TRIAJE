<%@ page import="persona.ActorSistema" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta name="layout" content="login" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.Jcrop.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'estilo.css')}" />       
   
<script type="text/javascript">
            function replaceT(obj){
                var newO=document.createElement('input');
                newO.setAttribute('name',obj.getAttribute('name'));
                newO.setAttribute('class','pass')
                obj.parentNode.replaceChild(newO,obj);
                newO.focus();
            }
        </script>
        <script type="text/javascript">
            function replaceT2(obj){
                var newO=document.createElement('input');
                newO.setAttribute('name',obj.getAttribute('name'));
                newO.setAttribute('class','pass2')
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
        
        <g:if test="${flash.message}">
          <div class="message"><g:message code="${flash.message}" /></div>
        </g:if> 
  

      <g:if test="${result == 1}" >
        <!--<p> RESULTADO POSITIVO </p>-->
        <!--
        <p> ${actor.id}</p>
        <p> ${actor}</p>
        <p> ${actor.login}</p>-->
        
        <g:form id="form1" url="[controller:'actorSistema',action:'restablecerPassword']" method="post" >
            <label>${actor.nombre} ${actor.apellido} ingrese su nueva contraseña</label>
          
            <div id="userlogin" class="userlogin">
              <g:passwordField id="newPassword" name="pass" type="text" value="" class="password"/>

            </div>
           <label>Repita su nueva contraseña</label> 
            <div id="userlogin" class="userlogin"> 
              <g:passwordField id="repeatPassword" name="pass2" type="text" value="" class="password email" />

            </div>
            <div id="enviarBoton" class="enviarBoton">
           <input id="doit" type="submit"  name="doit" class="buttonlogin" value="${message(code:'loginAuth.lostPassword.enviar')}" />
           </div>

            <input id="user" type="hidden"  name="id" value="${actor.id}" />      

        </g:form>
        
      </g:if>      
      <g:else>
       
      </g:else>  
      
    </div> 
  </body>
</html>
     