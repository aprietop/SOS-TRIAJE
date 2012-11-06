package especialidad

class EspecialidadController {

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
        [especialidadInstanceList: Especialidad.list(params), especialidadInstanceTotal: Especialidad.count()]
    }
    
    def listaEspAdmin = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: "menuAdministrador", model: [especialidadInstanceList: Especialidad.list(params), especialidadInstanceTotal: Especialidad.count()])       
    }

    def create = {
        def especialidadInstance = new Especialidad()
        especialidadInstance.properties = params
        return [especialidadInstance: especialidadInstance]
    }

    def save = {
        def especialidadInstance = new Especialidad(params)
        if (especialidadInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), especialidadInstance.id])}"
            redirect(action: "show", id: especialidadInstance.id)
        }
        else {
            render(view: "create", model: [especialidadInstance: especialidadInstance])
        }
    }

    def show = {
        def especialidadInstance = Especialidad.get(params.id)
        if (!especialidadInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])}"
            redirect(action: "list")
        }
        else {
            [especialidadInstance: especialidadInstance]
        }
    }

    def edit = {
        def especialidadInstance = Especialidad.get(params.id)
        if (!especialidadInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [especialidadInstance: especialidadInstance]
        }
    }

    def update = {
        def especialidadInstance = Especialidad.get(params.id)
        if (especialidadInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (especialidadInstance.version > version) {
                    
                    especialidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'especialidad.label', default: 'Especialidad')] as Object[], "Another user has updated this Especialidad while you were editing")
                    render(view: "edit", model: [especialidadInstance: especialidadInstance])
                    return
                }
            }
            especialidadInstance.properties = params
            if (!especialidadInstance.hasErrors() && especialidadInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), especialidadInstance.id])}"
                redirect(action: "show", id: especialidadInstance.id)
            }
            else {
                render(view: "edit", model: [especialidadInstance: especialidadInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def especialidadInstance = Especialidad.get(params.id)
        if (especialidadInstance) {
            try {
                especialidadInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])}"
            redirect(action: "list")
        }
    }
}
