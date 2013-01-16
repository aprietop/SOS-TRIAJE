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
        
        if (params.nacionalidad=="V") {
            if(params.sexo=="Femenino"){
                especialistaInstance.nacionalidad = "Venezolana"
            }else{
                especialistaInstance.nacionalidad = "Venezolano"
            }            
        }else{
            if(params.sexo=="Femenino"){
                especialistaInstance.nacionalidad = "Extranjera"
            }else{
                especialistaInstance.nacionalidad = "Extranjero"
            }               
        }
        
        if(params.especialidad){
        def especialidadInstance = Especialidad.get(params.especialidad)
        especialistaInstance.addToEspecialidades(especialidadInstance)
        }
        
        if(params.especialidad2){
        def especialidadInstance2 = Especialidad.get(params.especialidad2)
        especialistaInstance.addToEspecialidades(especialidadInstance2)            
        }

        if(params.especialidad3){
        def especialidadInstance3 = Especialidad.get(params.especialidad3)
        especialistaInstance.addToEspecialidades(especialidadInstance3)            
        }
        
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
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        List li=new ArrayList();
        li.add("0")

        if (params.id){
        //  tengo la instancia de la especialidad que se selecciono en la lista            
            def especialidadInstance = Especialidad.get(params.id)     
     
            def c = Especialista.createCriteria()
            def esp = c.list {
                ne("cedula",actorInstance.cedula)
                especialidades{
                eq("nombre", especialidadInstance.nombre)
                }
            }
            
            def auxiliar = "<option value=0>Seleccione</option>"
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
            
            if (params.nacionalidad=="V") {
                if(params.sexo=="Femenino"){
                    especialistaInstance.nacionalidad = "Venezolana"
                }else{
                    especialistaInstance.nacionalidad = "Venezolano"
                }            
            }else{
                if(params.sexo=="Femenino"){
                    especialistaInstance.nacionalidad = "Extranjera"
                }else{
                    especialistaInstance.nacionalidad = "Extranjero"
                }               
            }
        
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
  
    def cargarOtraEspecialidad = {
        def nuevoTipo = "visible"

        render(view: "create", model: [tipo: nuevoTipo])         
        
    }
    
}
