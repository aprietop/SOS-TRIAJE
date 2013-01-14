package persona

class AdministradorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth]

    def auth() {
        if(!session.ActorSistema) {
            redirect(controller:"actorSistema", action:"login")
        }
    }    
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [administradorInstanceList: Administrador.list(params), administradorInstanceTotal: Administrador.count()]
    }

    def create = {
        def administradorInstance = new Administrador()
        administradorInstance.properties = params
        return [administradorInstance: administradorInstance]
    }

    def save = {
        def administradorInstance = new Administrador(params)
        administradorInstance.rol = "Administrador"
        
            if (params.nacionalidad=="V") {
                if(params.sexo=="Femenino"){
                    administradorInstance.nacionalidad = "Venezolana"
                }else{
                    administradorInstance.nacionalidad = "Venezolano"
                }            
            }else{
                if(params.sexo=="Femenino"){
                    administradorInstance.nacionalidad = "Extranjera"
                }else{
                    administradorInstance.nacionalidad = "Extranjero"
                }               
            }
            
        if (administradorInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'administrador.label', default: 'Administrador'), administradorInstance.id])}"
            redirect(action: "show", id: administradorInstance.id)
        }
        else {
            render(view: "create", model: [administradorInstance: administradorInstance])
        }
    }

    def show = {
        def administradorInstance = Administrador.get(params.id)
        if (!administradorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])}"
            redirect(action: "list")
        }
        else {
            [administradorInstance: administradorInstance]
        }
    }

    def edit = {
        def administradorInstance = Administrador.get(params.id)
        if (!administradorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [administradorInstance: administradorInstance]
        }
    }

    def update = {
        def administradorInstance = Administrador.get(params.id)
        if (administradorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (administradorInstance.version > version) {
                    
                    administradorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'administrador.label', default: 'Administrador')] as Object[], "Another user has updated this Administrador while you were editing")
                    render(view: "edit", model: [administradorInstance: administradorInstance])
                    return
                }
            }
            administradorInstance.properties = params
            if (params.nacionalidad=="V") {
                if(params.sexo=="Femenino"){
                    administradorInstance.nacionalidad = "Venezolana"
                }else{
                    administradorInstance.nacionalidad = "Venezolano"
                }            
            }else{
                if(params.sexo=="Femenino"){
                    administradorInstance.nacionalidad = "Extranjera"
                }else{
                    administradorInstance.nacionalidad = "Extranjero"
                }               
            }            
            
            if (!administradorInstance.hasErrors() && administradorInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'administrador.label', default: 'Administrador'), administradorInstance.id])}"
                redirect(action: "show", id: administradorInstance.id)
            }
            else {
                render(view: "edit", model: [administradorInstance: administradorInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def administradorInstance = Administrador.get(params.id)
        if (administradorInstance) {
            try {
                administradorInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])}"
            redirect(action: "list")
        }
    }
}
