package caso

import caso.Caso
//import java.text.SimpleDateFormat
//import java.text.DateFormat
import java.util.Date
import especialidad.Especialidad
import medico.Especialista
import medico.Medico
import status.Status
import persona.ActorSistema

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
        def tipoBusqueda = 1
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [historialCasoInstanceList: HistorialCaso.list(params), historialCasoInstanceTotal: HistorialCaso.count(), tipoBusqueda:tipoBusqueda]
    }
    
    def create = {
        def historialCasoInstance = new HistorialCaso()
        historialCasoInstance.properties = params
        return [historialCasoInstance: historialCasoInstance]
    }
    
    def historialModCaso = {
        def CasoInstance = Caso.get(params.id)       
        return [casoInstance: CasoInstance]
    } 
    
    def historial2daOpinion = {
        def CasoInstance = Caso.get(params.id)       
        return [casoInstance: CasoInstance]
    }      

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

    def saveAsignacion = {
        Date date = new Date()
        def casoInstance = Caso.get(params.id)        
        def medicoInstance = Medico.get(params.medico)
            
        def statusN = Status.get(2)  // Asignado

        casoInstance.status = statusN  
        
        def asignacion = new HistorialCaso()
        asignacion.fecha = date
        asignacion.medico = medicoInstance
        asignacion.estadoCaso = "Asignado"
        asignacion.caso = casoInstance

        if (asignacion.save(flush: true)) {
            flash.message = "${message(code: 'asignado', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
            render(view: "showC", model: [casoInstance: casoInstance])     
        }
        else {
            render(view: "historialModCaso", model: [casoInstance: casoInstance])
        }       
        
    }
    
    def saveSegundaOpinion = {
        Date date = new Date()
        def casoInstance = Caso.get(params.id)        
        def medicoInstance = Medico.get(params.medico)

        def statusN = Status.get(4)

        casoInstance.status = statusN

        def asignacion = new HistorialCaso()
        asignacion.fecha = date
        asignacion.medico = medicoInstance
        asignacion.estadoCaso = "Segunda opinion"
        asignacion.caso = casoInstance

        if (asignacion.save(flush: true)) {
                flash.message = "${message(code: 'segundaOpinion', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
                render(view: "showC", model: [casoInstance: casoInstance])
        }
        else {
                render(view: "historial2daOpinion", model: [casoInstance: casoInstance])
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
    
    def verHistorialesPorFecha = {
        def tipoBusqueda = 2
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        def d = params.desde
        def h = params.hasta      
        
            def c = HistorialCaso.createCriteria()
            def HistorialPorFecha = c.list {
                ge("fecha", d)
                le("fecha", h)
            }
        render(view: "listaDeHistorialesT", model: [historialCasoInstanceList: HistorialPorFecha, historialCasoInstanceTotal: HistorialPorFecha.count(), tipoBusqueda:tipoBusqueda])                     
       
    }
}
