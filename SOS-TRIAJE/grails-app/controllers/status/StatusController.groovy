package status

import java.text.SimpleDateFormat
import pojos.PojoEspecialidad
import pojos.PojoArchivo
import caso.Caso
import archivo.Archivo

class StatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
        
        Status estado = new Status()
        estado.nombre = "En espera"
        estado.decripcion = "Una vez llega el caso a triage"
        
        def date = new Date()  
        sdf = new SimpleDateFormat("MM/dd/yyyy")  
    
        estado.fechaStatus = sdf.format(date)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [statusInstanceList: Status.list(params), statusInstanceTotal: Status.count()]
    }

    def create = {
        def statusInstance = new Status()
        statusInstance.properties = params
        return [statusInstance: statusInstance]
    }

    def save = {
        def statusInstance = new Status(params)
        if (statusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'status.label', default: 'Status'), statusInstance.id])}"
            redirect(action: "show", id: statusInstance.id)
        }
        else {
            render(view: "create", model: [statusInstance: statusInstance])
        }
    }

    def show = {
        def statusInstance = Status.get(params.id)
        if (!statusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])}"
            redirect(action: "list")
        }
        else {
            [statusInstance: statusInstance]
        }
    }

    def edit = {
        def statusInstance = Status.get(params.id)
        if (!statusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [statusInstance: statusInstance]
        }
    }

    def update = {
        def statusInstance = Status.get(params.id)
        if (statusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (statusInstance.version > version) {
                    
                    statusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'status.label', default: 'Status')] as Object[], "Another user has updated this Status while you were editing")
                    render(view: "edit", model: [statusInstance: statusInstance])
                    return
                }
            }
            statusInstance.properties = params
            if (!statusInstance.hasErrors() && statusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'status.label', default: 'Status'), statusInstance.id])}"
                redirect(action: "show", id: statusInstance.id)
            }
            else {
                render(view: "edit", model: [statusInstance: statusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def statusInstance = Status.get(params.id)
        if (statusInstance) {
            try {
                statusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'status.label', default: 'Status'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'status.label', default: 'Status'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'status.label', default: 'Status'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def pruebaPojos = {
        PojoEspecialidad pp = new PojoEspecialidad()
        pp.nombre = "prueba de muestra S"
        
        
        println "pp: "+pp
        println "pp.nombre :"+pp.nombre
        
        
        def casoInstance = Caso.findByIdCasoSOS(8)
        
        //----------------------  agregadas
        List<PojoArchivo> archivosDelCaso = new ArrayList<PojoArchivo>();
        
        def archivos = Archivo.findAllByCaso(casoInstance)
        if(archivos){
            archivos.each{
                
                PojoArchivo archivoEnviado = new PojoArchivo()
                archivoEnviado.nombre = it.nombre
                archivoEnviado.descripcion = it.descripcion
                archivoEnviado.adjunto = it.adjunto                   
                
                archivosDelCaso.add(archivoEnviado)
                
                println "PojoArchivo: "+archivoEnviado
                println "archivosDelCaso: "+archivosDelCaso
            }
        }        
        
    }
}
