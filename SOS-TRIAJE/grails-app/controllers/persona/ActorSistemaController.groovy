package persona

class ActorSistemaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

        def login = {}
    
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
