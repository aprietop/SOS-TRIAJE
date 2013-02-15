package persona

import org.apache.commons.validator.EmailValidator
import java.net.InetAddress
import java.util.regex.Matcher /*para uso de expresiones regulares*/
import java.util.regex.Pattern

class ActorSistemaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def login = {}
    def mailService
    
    def authenticate = {
        def ActorSistema = ActorSistema.findByLoginAndPassword(params.login, params.password)
        
        if(ActorSistema){
            
            String login = ActorSistema.login
            String password = ActorSistema.password 
            
            boolean loginCompare = login.equals(params.login)
            boolean passwordCompare = password.equals(params.password)
            
                //para comparar la sensibilidad en los caracteres
                if(loginCompare && passwordCompare){          
                        session.ActorSistema = ActorSistema
                        flash.message = "Hola ${ActorSistema.login}!"

                        if(session?.ActorSistema?.rol == "Administrador" ){
                          redirect(action:"menuAdministrador")
                        }
                        if(session?.ActorSistema?.rol == "Triaje" ){
                          redirect(controller:"caso", action:"listaDeCasosT")
                        }
                        if(session?.ActorSistema?.rol == "Especialista" ){
                          redirect(controller:"caso", action:"listaDeCasosT")
                        }          
                }else{
                  flash.message = "Lo siento, ${params.login}. Por favor intente de nuevo."
                  redirect(action:"login")                
                }               
        }else{
          flash.message = "Lo siento, ${params.login}. Por favor intente de nuevo."
          redirect(action:"login")
        }
    }
    
    def menuAdministrador = {}
    
    def menuEspecialista = {}
    
    def menuTriaje = {}
    
    def logout = {
      flash.message = "Adios ${session.ActorSistema.nombre} ${session.ActorSistema.apellido}"
      session.ActorSistema = null
      redirect(controller:"actorSistema", action:"login")      
    }
    
    def lostPassword = {
        flash.message = ""
             
    }    
    
    def sendEmailLink = {
        def opcion = 1
        def emailValidator = EmailValidator.getInstance()
        if (!emailValidator.isValid(params.userEmail)) {
            flash.message = "loginAuth.sendEmailLink.noValidEmail"
            render(view:'lostPassword', model:[opcion: opcion])
            return 
        }

        def actor = ActorSistema.withCriteria{
           
            eq("mail", params.userEmail)
           
        }

        if(!actor){            
            //El usuario no existe
            flash.message = "loginAuth.sendEmailLink.noExisteEmail"
            render(view:'lostPassword', model:[opcion: opcion])
            return 
            //Eniviar mensaje sobre la no existencia del email   
        }else{
            //Asignar idReset            
            actor = ActorSistema.get(actor[0].id)
            actor.createIdReset()
            actor.save()
            
            def link = "http://"+InetAddress.getLocalHost().getHostAddress() + ":"+ request.getLocalPort() + createLink(controller: 'actorSistema',action:'resetPassword',id:actor.idReset)
                
            try{
            mailService.sendMail {
                    to actor.mail //Email del usuario
                    subject "Restablecer contraseña en SOS-TRIAJE" // Asunto del mensaje   <a href="/shop/book/list">Book List</a>
                    html    'Haz click en el link para restablecer tu contraseña en SOS-TRIAJE <a href="'+link+'">RESTABLECER CONTRASEÑA</a>'
                    flash.message = "loginAuth.sendEmailLink.mensaje"
                }
            }catch(Exception e){
                flash.message = "loginAuth.sendEmailLink.error"
                render(view:'lostPassword', model:[opcion: opcion])
                return 
            }
            return         
        }    
    }
    
    
    def sendPassword = {
        def opcion = 2
        def emailValidator = EmailValidator.getInstance()
        if (!emailValidator.isValid(params.userEmail2)) {
            flash.message = "loginAuth.sendEmailLink.noValidEmail"
            render(view:'lostPassword', model:[opcion: opcion])
            return 
        }

        def actor = ActorSistema.withCriteria{
           
            eq("mail", params.userEmail2)
           
        }

        if(!actor){
             //El usuario no existe
            flash.message = "loginAuth.sendEmailLink.noExisteEmail"
            render(view:'lostPassword', model:[opcion: opcion])
            return 
        }else{
            //Asignar idReset            
            actor = ActorSistema.get(actor[0].id)
            actor.createIdReset()
            actor.save()

            try{
            mailService.sendMail {
                    to actor.mail //Email del usuario
                    subject "Solicitud de envío de contraseña SOS-TRIAJE" // Asunto del mensaje   <a href="/shop/book/list">Book List</a>
                    html    "Usted ha solicitado el envio de su contraseña. Su contraseña es: "+actor.password
                    flash.message = "loginAuth.sendEmailPassword.mensaje"
                }
            }catch(Exception e){
                flash.message = "loginAuth.sendEmailLink.error"
                render(view:'lostPassword', model:[opcion: opcion])
                return 
            }
            return
        }    
    }    
    
    def resetPassword = {   
        if(params.id){
            def actor = ActorSistema.existIdReset(params.id)
            if(actor){
                //Link correcto
                return [result:1, idReset: params.id, actor: actor]
            }else{
                //Link Errado
                flash.message = "loginAuth.resetPassword.linkErrado"
                return [result:2]
            }
        }else{
            flash.message = "loginAuth.resetPassword.linkErrado"
            return [result:2]
            
        }
    }    
    
    def restablecerPassword = {
        if(params.id){
            def result =1 
            def actor = ActorSistema.get(params.id)
            
            String contrasena1=params.pass
            String contrasena2=params.pass2
            boolean contrasenaCompare = contrasena1.equals(contrasena2)
            
            if (contrasenaCompare){
                //COntraseñas iguales
                actor.password = contrasena1
                actor.idReset = ""
                
                    if(actor.save(flush: true)){      
                        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'Médico', default: 'Médico'), actor.id])}"
                        redirect(controller: "actorSistema",action: "login")
                        return 
                    }else{
                        render(view: 'resetPassword',model:[actor: actor,result:result])
                        return 
                    }

            }else {
                //println "NO coinciden las contrasenas por favor repetir"//COntraseñas no coinciden
                flash.message = "loginAuth.resetPassword.no.coincide"
                render(view: 'resetPassword',model:[actor: actor,result:result])
                return                 
            }
        }      
    }    
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [actorSistemaInstanceList: ActorSistema.list(params), actorSistemaInstanceTotal: ActorSistema.count()]
    }

    def create = {
        def actorSistemaInstance = new ActorSistema()
        actorSistemaInstance.properties = params
        return [actorSistemaInstance: actorSistemaInstance]
    }

    def save = {
        def actorSistemaInstance = new ActorSistema(params)
        if (actorSistemaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), actorSistemaInstance.id])}"
            redirect(action: "show", id: actorSistemaInstance.id)
        }
        else {
            render(view: "create", model: [actorSistemaInstance: actorSistemaInstance])
        }
    }

    def show = {
        def actorSistemaInstance = ActorSistema.get(params.id)
        if (!actorSistemaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), params.id])}"
            redirect(action: "list")
        }
        else {
            [actorSistemaInstance: actorSistemaInstance]
        }
    }

    def edit = {
        def actorSistemaInstance = ActorSistema.get(params.id)
        if (!actorSistemaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [actorSistemaInstance: actorSistemaInstance]
        }
    }

    def update = {
        def actorSistemaInstance = ActorSistema.get(params.id)
        if (actorSistemaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (actorSistemaInstance.version > version) {
                    
                    actorSistemaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'actorSistema.label', default: 'ActorSistema')] as Object[], "Another user has updated this ActorSistema while you were editing")
                    render(view: "edit", model: [actorSistemaInstance: actorSistemaInstance])
                    return
                }
            }
            actorSistemaInstance.properties = params
            if (!actorSistemaInstance.hasErrors() && actorSistemaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), actorSistemaInstance.id])}"
                redirect(action: "show", id: actorSistemaInstance.id)
            }
            else {
                render(view: "edit", model: [actorSistemaInstance: actorSistemaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def actorSistemaInstance = ActorSistema.get(params.id)
        if (actorSistemaInstance) {
            try {
                actorSistemaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actorSistema.label', default: 'ActorSistema'), params.id])}"
            redirect(action: "list")
        }
    }
}
