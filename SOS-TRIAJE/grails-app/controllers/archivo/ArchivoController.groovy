package archivo

class ArchivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [archivoInstanceList: Archivo.list(params), archivoInstanceTotal: Archivo.count()]
    }

    def create = {
        def archivoInstance = new Archivo()
        archivoInstance.properties = params
        return [archivoInstance: archivoInstance]
    }

    def save = {
        def archivoInstance = new Archivo(params)
        if (archivoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])}"
            redirect(action: "show", id: archivoInstance.id)
        }
        else {
            render(view: "create", model: [archivoInstance: archivoInstance])
        }
    }

    def show = {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [archivoInstance: archivoInstance]
        }
    }

    def edit = {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [archivoInstance: archivoInstance]
        }
    }

    def update = {
        def archivoInstance = Archivo.get(params.id)
        if (archivoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (archivoInstance.version > version) {
                    
                    archivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'archivo.label', default: 'Archivo')] as Object[], "Another user has updated this Archivo while you were editing")
                    render(view: "edit", model: [archivoInstance: archivoInstance])
                    return
                }
            }
            archivoInstance.properties = params
            if (!archivoInstance.hasErrors() && archivoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])}"
                redirect(action: "show", id: archivoInstance.id)
            }
            else {
                render(view: "edit", model: [archivoInstance: archivoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def archivoInstance = Archivo.get(params.id)
        if (archivoInstance) {
            try {
                archivoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
    }
}
