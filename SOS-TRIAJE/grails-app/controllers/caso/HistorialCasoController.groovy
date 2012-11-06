package caso

import caso.Caso
import java.text.SimpleDateFormat
import java.text.DateFormat
import java.util.Date
import especialidad.Especialidad
import medico.Especialista

class HistorialCasoController {

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
        [historialCasoInstanceList: HistorialCaso.list(params), historialCasoInstanceTotal: HistorialCaso.count()]
    }

    def listaDeHistorialesT = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [historialCasoInstanceList: HistorialCaso.list(params), historialCasoInstanceTotal: HistorialCaso.count()]
    }
    
    def create = {
        def historialCasoInstance = new HistorialCaso()
        historialCasoInstance.properties = params
        return [historialCasoInstance: historialCasoInstance]
    }
    
    def historialModCaso = {
        def CasoInstance = Caso.get(params.id)         
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss.ms");
        Date date = new Date();
        System.out.println(dateFormat.format(date));
        
        def especialidadInstance = Especialidad.getAll()
        
        return [CasoInstance: CasoInstance, fechaActual:dateFormat.format(date), especialidadList:especialidadInstance]
    }    

//    def ajaxGetEspecialistas = {    
//        println "Paso por aqui"
//        //tengo la instancia de la especialidad que se selecciono en la lista
//        def especialidadInstance = Especialidad.get(params.id)
//        
//        println "Especialidad nombre:"+especialidadInstance.nombre
//        
//            def c = especialidad.createCriteria()
//            def especialistas = c.list {
//                eq("nombre", especialidadInstance.nombre) 
//            }
//            
//        println "Especialidad id:"+params.id
//        println "Especialista nombre:"+especialistas.nombre
////        def especialidadInstance = Especialidad.get(params.especialidad)
////        especialistaInstance.addToEspecialidades(especialidadInstance)        
//    }

    def save = {
        def historialCasoInstance = new HistorialCaso(params)
        
        def CasoInstance = Caso.get(params.caso.id)
        historialCasoInstance.estadoCaso = CasoInstance.status.nombre    
        
        if (historialCasoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), historialCasoInstance.id])}"
            redirect(action: "show", id: historialCasoInstance.id)
        }
        else {
            render(view: "create", model: [historialCasoInstance: historialCasoInstance])
        }
    }

    def show = {
        def historialCasoInstance = HistorialCaso.get(params.id)
        if (!historialCasoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), params.id])}"
            redirect(action: "list")
        }
        else {
            [historialCasoInstance: historialCasoInstance]
        }
    }

    def edit = {
        def historialCasoInstance = HistorialCaso.get(params.id)
        if (!historialCasoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [historialCasoInstance: historialCasoInstance]
        }
    }

    def update = {
        def historialCasoInstance = HistorialCaso.get(params.id)
        if (historialCasoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (historialCasoInstance.version > version) {
                    
                    historialCasoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'historialCaso.label', default: 'HistorialCaso')] as Object[], "Another user has updated this HistorialCaso while you were editing")
                    render(view: "edit", model: [historialCasoInstance: historialCasoInstance])
                    return
                }
            }
            historialCasoInstance.properties = params
            if (!historialCasoInstance.hasErrors() && historialCasoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), historialCasoInstance.id])}"
                redirect(action: "show", id: historialCasoInstance.id)
            }
            else {
                render(view: "edit", model: [historialCasoInstance: historialCasoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def historialCasoInstance = HistorialCaso.get(params.id)
        if (historialCasoInstance) {
            try {
                historialCasoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'historialCaso.label', default: 'HistorialCaso'), params.id])}"
            redirect(action: "list")
        }
    }
}
