package medico

class MedicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [medicoInstanceList: Medico.list(params), medicoInstanceTotal: Medico.count()]
    }

    def create = {
        def medicoInstance = new Medico()
        medicoInstance.properties = params
        return [medicoInstance: medicoInstance]
    }

    def save = {
        def medicoInstance = new Medico(params)
        if (medicoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'medico.label', default: 'Medico'), medicoInstance.id])}"
            redirect(action: "show", id: medicoInstance.id)
        }
        else {
            render(view: "create", model: [medicoInstance: medicoInstance])
        }
    }

    def show = {
        def medicoInstance = Medico.get(params.id)
        if (!medicoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])}"
            redirect(action: "list")
        }
        else {
            [medicoInstance: medicoInstance]
        }
    }

    def edit = {
        def medicoInstance = Medico.get(params.id)
        if (!medicoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [medicoInstance: medicoInstance]
        }
    }

    def update = {
        def medicoInstance = Medico.get(params.id)
        if (medicoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (medicoInstance.version > version) {
                    
                    medicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'medico.label', default: 'Medico')] as Object[], "Another user has updated this Medico while you were editing")
                    render(view: "edit", model: [medicoInstance: medicoInstance])
                    return
                }
            }
            medicoInstance.properties = params
            if (!medicoInstance.hasErrors() && medicoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'medico.label', default: 'Medico'), medicoInstance.id])}"
                redirect(action: "show", id: medicoInstance.id)
            }
            else {
                render(view: "edit", model: [medicoInstance: medicoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def medicoInstance = Medico.get(params.id)
        if (medicoInstance) {
            try {
                medicoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])}"
            redirect(action: "list")
        }
    }
}
