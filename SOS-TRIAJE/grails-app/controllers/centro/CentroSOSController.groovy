package centro

class CentroSOSController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [centroSOSInstanceList: CentroSOS.list(params), centroSOSInstanceTotal: CentroSOS.count()]
    }

    def create = {
        def centroSOSInstance = new CentroSOS()
        centroSOSInstance.properties = params
        return [centroSOSInstance: centroSOSInstance]
    }

    def save = {
        def centroSOSInstance = new CentroSOS(params)
        if (centroSOSInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), centroSOSInstance.id])}"
            redirect(action: "show", id: centroSOSInstance.id)
        }
        else {
            render(view: "create", model: [centroSOSInstance: centroSOSInstance])
        }
    }

    def show = {
        def centroSOSInstance = CentroSOS.get(params.id)
        if (!centroSOSInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), params.id])}"
            redirect(action: "list")
        }
        else {
            [centroSOSInstance: centroSOSInstance]
        }
    }

    def edit = {
        def centroSOSInstance = CentroSOS.get(params.id)
        if (!centroSOSInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [centroSOSInstance: centroSOSInstance]
        }
    }

    def update = {
        def centroSOSInstance = CentroSOS.get(params.id)
        if (centroSOSInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (centroSOSInstance.version > version) {
                    
                    centroSOSInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'centroSOS.label', default: 'CentroSOS')] as Object[], "Another user has updated this CentroSOS while you were editing")
                    render(view: "edit", model: [centroSOSInstance: centroSOSInstance])
                    return
                }
            }
            centroSOSInstance.properties = params
            if (!centroSOSInstance.hasErrors() && centroSOSInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), centroSOSInstance.id])}"
                redirect(action: "show", id: centroSOSInstance.id)
            }
            else {
                render(view: "edit", model: [centroSOSInstance: centroSOSInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def centroSOSInstance = CentroSOS.get(params.id)
        if (centroSOSInstance) {
            try {
                centroSOSInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'centroSOS.label', default: 'CentroSOS'), params.id])}"
            redirect(action: "list")
        }
    }
}
