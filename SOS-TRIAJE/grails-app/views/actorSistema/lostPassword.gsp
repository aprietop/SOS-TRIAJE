

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
                newO.setAttribute('name',obj.getAttribute('name'));
                newO.setAttribute('class','userlogin')
                obj.parentNode.replaceChild(newO,obj);
                newO.focus();
            }
        </script>
        <script type="text/javascript">
            function replaceT2(obj){
                var newO=document.createElement('input');
                newO.setAttribute('name',obj.getAttribute('name'));
                newO.setAttribute('class','userlogin2')
                obj.parentNode.replaceChild(newO,obj);
                newO.focus();
            }
        </script>        
    
</head>
 
<body class="login_fondo">
<div id="cabLogin">
      <h1><img src="${createLinkTo(dir:'images',file:'sos_login.png')}" alt="SOS" width="163" height="95" align="absmiddle" />Referencias Médicas</h1>
</div>
  
<table>
<tr>
  
<td>
<div id="formLogin">  
            <h2><g:message code="send.link.reset.password"/></h2>
            <g:message code="loginAuth.lostPassword.ingreseEmail"/>
            
            <g:if test="${opcion==1}">
            <g:if test="${flash.message}">
              <div class="message"><g:message code="${flash.message}" /></div>
            </g:if> 
            </g:if> 
            <g:else>
              <div><br/><br/></div>
            </g:else>
            
          <g:form action="sendEmailLink" method="post" >

            <div id="correo" class="userlogin">
            <input type="text" id="userEmail" name="userEmail" class="userlogin" value="e-mail" onmousedown="javascript:this.value='';"/>
            </div>
            
            <div id="ingresarboton" class="ingresarboton">
            <input type="submit" name="doit" id="doit" value="Enviar" class="buttonlogin"/>
            </div>
            </g:form>
</div>
</td>
<td> 

<div id="formLogin">  
            <h2><g:message code="send.password.to.mail"/></h2>            
            <g:message code="loginAuth.lostPassword.ingreseEmail"/>
            
            <g:if test="${opcion==2}">
            <g:if test="${flash.message}">
              <div class="message"><g:message code="${flash.message}" /></div>
            </g:if>   
            </g:if>
            <g:else>
              <div><br/><br/></div>
            </g:else>
            
          <g:form action="sendPassword" method="post" >

            <div id="correo2" class="userlogin">
            <input type="text" id="userEmail" name="userEmail2" class="userlogin" value="e-mail" onmousedown="javascript:this.value='';"/>
            </div>

            <div id="ingresarboton2" class="ingresarboton">
            <input type="submit" name="doit" id="doit" value="Enviar" class="buttonlogin"/>
            </div>
            </g:form>
</div>  
</td>

</td></tr> 
</table>  
</body>
</html>