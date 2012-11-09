package medico
import especialidad.Especialidad
import persona.ActorSistema

class EspecialistaController {

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
        [especialistaInstanceList: Especialista.list(params), especialistaInstanceTotal: Especialista.count()]
    }

    def create = {
        def especialistaInstance = new Especialista()
        especialistaInstance.properties = params
        return [especialistaInstance: especialistaInstance]
    }

    def save = {
        def especialistaInstance = new Especialista(params)
        especialistaInstance.rol="Especialista"
        def especialidadInstance = Especialidad.get(params.especialidad)
        especialistaInstance.addToEspecialidades(especialidadInstance)
        
        if (especialistaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'especialista.label', default: 'Especialista'), especialistaInstance.id])}"
            redirect(action: "show", id: especialistaInstance.id)
        }
        else {
            render(view: "create", model: [especialistaInstance: especialistaInstance])
        }
    }

    def show = {
        def especialistaInstance = Especialista.get(params.id)
        if (!especialistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialista.label', default: 'Especialista'), params.id])}"
            redirect(action: "list")
        }
        else {
            [especialistaInstance: especialistaInstance]
        }
    }
    
    def ajaxGetEspecialistas = {    
        println "Paso por aqui: "+ params.id

        List li=new ArrayList();
        li.add("0")

        if (params.id){
        //  tengo la instancia de la especialidad que se selecciono en la lista            
            def especialidadInstance = Especialidad.get(params.id)
            
            println "Especialidad nombre:"+especialidadInstance.nombre        
     
            def c = Especialista.createCriteria()
            def esp = c.list {
                especialidades{
                eq("nombre", especialidadInstance.nombre)
                }
            }
            
            def auxiliar = ""
            esp.each{
                auxiliar = auxiliar + """<option value="${it.id}">${it.nombre} ${it.apellido}</option>"""
            }
            render auxiliar            
        }
        else{
            println "NO TIENE NADA"
            
        }
    }

    def edit = {
        def especialistaInstance = Especialista.get(params.id)
        if (!especialistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialista.label', default: 'Especialista'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [especialistaInstance: especialistaInstance]
        }
    }

    def update = {
        def especialistaInstance = Especialista.get(params.id)
        if (especialistaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (especialistaInstance.version > version) {
                    
                    especialistaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'especialista.label', default: 'Especialista')] as Object[], "Another user has updated this Especialista while you were editing")
                    render(view: "edit", model: [especialistaInstance: especialistaInstance])
                    return
                }
            }
            especialistaInstance.properties = params
            if (!especialistaInstance.hasErrors() && especialistaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'especialista.label', default: 'Especialista'), especialistaInstance.id])}"
                redirect(action: "show", id: especialistaInstance.id)
            }
            else {
                render(view: "edit", model: [especialistaInstance: especialistaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialista.label', default: 'Especialista'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def especialistaInstance = Especialista.get(params.id)
        if (especialistaInstance) {
            try {
                especialistaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'especialista.label', default: 'Especialista'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'especialista.label', default: 'Especialista'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'especialista.label', default: 'Especialista'), params.id])}"
            redirect(action: "list")
        }
    }
}
