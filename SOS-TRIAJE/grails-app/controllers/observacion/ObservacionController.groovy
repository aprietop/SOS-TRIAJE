package observacion

class ObservacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [observacionInstanceList: Observacion.list(params), observacionInstanceTotal: Observacion.count()]
    }

    def create = {
        def observacionInstance = new Observacion()
        observacionInstance.properties = params
        return [observacionInstance: observacionInstance]
    }

    def save = {
        def observacionInstance = new Observacion(params)
        if (observacionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'observacion.label', default: 'Observacion'), observacionInstance.id])}"
            redirect(action: "show", id: observacionInstance.id)
        }
        else {
            render(view: "create", model: [observacionInstance: observacionInstance])
        }
    }

    def show = {
        def observacionInstance = Observacion.get(params.id)
        if (!observacionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), params.id])}"
            redirect(action: "list")
        }
        else {
            [observacionInstance: observacionInstance]
        }
    }

    def edit = {
        def observacionInstance = Observacion.get(params.id)
        if (!observacionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [observacionInstance: observacionInstance]
        }
    }

    def update = {
        def observacionInstance = Observacion.get(params.id)
        if (observacionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (observacionInstance.version > version) {
                    
                    observacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'observacion.label', default: 'Observacion')] as Object[], "Another user has updated this Observacion while you were editing")
                    render(view: "edit", model: [observacionInstance: observacionInstance])
                    return
                }
            }
            observacionInstance.properties = params
            if (!observacionInstance.hasErrors() && observacionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'observacion.label', default: 'Observacion'), observacionInstance.id])}"
                redirect(action: "show", id: observacionInstance.id)
            }
            else {
                render(view: "edit", model: [observacionInstance: observacionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def observacionInstance = Observacion.get(params.id)
        if (observacionInstance) {
            try {
                observacionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'observacion.label', default: 'Observacion'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'observacion.label', default: 'Observacion'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), params.id])}"
            redirect(action: "list")
        }
    }
}
