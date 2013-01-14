package medico

class TriajeController {

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
        [triajeInstanceList: Triaje.list(params), triajeInstanceTotal: Triaje.count()]
    }

    def create = {
        def triajeInstance = new Triaje()
        triajeInstance.properties = params
        return [triajeInstance: triajeInstance]
    }

    def save = {
        def triajeInstance = new Triaje(params)
        
        if (params.nacionalidad=="V") {
            if(params.sexo=="Femenino"){
                triajeInstance.nacionalidad = "Venezolana"
            }else{
                triajeInstance.nacionalidad = "Venezolano"
            }            
        }else{
            if(params.sexo=="Femenino"){
                triajeInstance.nacionalidad = "Extranjera"
            }else{
                triajeInstance.nacionalidad = "Extranjero"
            }               
        }
        
        triajeInstance.rol="Triaje"
        if (triajeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'triaje.label', default: 'Triaje'), triajeInstance.id])}"
            redirect(action: "show", id: triajeInstance.id)
        }
        else {
            render(view: "create", model: [triajeInstance: triajeInstance])
        }
    }

    def show = {
        def triajeInstance = Triaje.get(params.id)
        if (!triajeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'triaje.label', default: 'Triaje'), params.id])}"
            redirect(action: "list")
        }
        else {
            [triajeInstance: triajeInstance]
        }
    }

    def edit = {
        def triajeInstance = Triaje.get(params.id)
        if (!triajeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'triaje.label', default: 'Triaje'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [triajeInstance: triajeInstance]
        }
    }

    def update = {
        def triajeInstance = Triaje.get(params.id)
        if (triajeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (triajeInstance.version > version) {
                    
                    triajeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'triaje.label', default: 'Triaje')] as Object[], "Another user has updated this Triaje while you were editing")
                    render(view: "edit", model: [triajeInstance: triajeInstance])
                    return
                }
            }
            triajeInstance.properties = params
            
            if (params.nacionalidad=="V") {
                if(params.sexo=="Femenino"){
                    triajeInstance.nacionalidad = "Venezolana"
                }else{
                    triajeInstance.nacionalidad = "Venezolano"
                }            
            }else{
                if(params.sexo=="Femenino"){
                    triajeInstance.nacionalidad = "Extranjera"
                }else{
                    triajeInstance.nacionalidad = "Extranjero"
                }               
            }
        
            if (!triajeInstance.hasErrors() && triajeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'triaje.label', default: 'Triaje'), triajeInstance.id])}"
                redirect(action: "show", id: triajeInstance.id)
            }
            else {
                render(view: "edit", model: [triajeInstance: triajeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'triaje.label', default: 'Triaje'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def triajeInstance = Triaje.get(params.id)
        if (triajeInstance) {
            try {
                triajeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'triaje.label', default: 'Triaje'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'triaje.label', default: 'Triaje'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'triaje.label', default: 'Triaje'), params.id])}"
            redirect(action: "list")
        }
    }
}
