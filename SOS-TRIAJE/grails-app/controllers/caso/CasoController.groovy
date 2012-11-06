package caso

import medico.Triaje
import persona.ActorSistema
import java.util.List

class CasoController {

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
        [casoInstanceList: Caso.list(params), casoInstanceTotal: Caso.count()]
    }

    def create = {
        def casoInstance = new Caso()
        casoInstance.properties = params
        return [casoInstance: casoInstance]
    }

    def save = {
        def casoInstance = new Caso(params)
        if (casoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
            redirect(action: "show", id: casoInstance.id)
        }
        else {
            render(view: "create", model: [casoInstance: casoInstance])
        }
    }

    def show = {
        def casoInstance = Caso.get(params.id)
        if (!casoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])}"
            redirect(action: "list")
        }
        else {
            [casoInstance: casoInstance]
        }
    }
        
    def listaDeCasosT = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        if(session?.ActorSistema?.rol == "Triaje" ){
            
            def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
            
            def c = HistorialCaso.createCriteria()
            def results = c.list {
                projections { 
                   distinct("caso")            
                }            
                    if ((params.sort=="fechaInicio")||(params.sort=="fechaSolucion")||(params.sort=="status")||(params.sort=="descripcion")){
                       caso{//OPERADOR ELVIS
                            def campo=params.sort?:"fecha"
                            def orden=params.order?:"asc"
                            order(campo, orden)
                        }
                    }

                    if ((params.sort=="nombre")||(params.sort=="cedula")){
                        caso{
                            paciente{
                                def campo=params.sort?:"nombre"
                                def orden=params.order?:"asc"
                                order(campo, orden)  
                            }
                        }
                    }                
                maxResults(10)        
            }
            
            render(view: "menuTriaje", model: [casoInstanceList: results, casoInstanceTotal: Caso.count()]) 
        }
        
        if(session?.ActorSistema?.rol == "Especialista" ){
            
            def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
            
            def c = HistorialCaso.createCriteria()
            def results = c.list {
                eq("medico", actorInstance) 
                projections { 
                   distinct("caso")            
                }            
    //      CONDICIONALES PARA EL ORDENAMIENTO
                    if ((params.sort=="fechaInicio")||(params.sort=="fechaSolucion")||(params.sort=="status")||(params.sort=="descripcion")){
                       caso{//OPERADOR ELVIS
                            def campo=params.sort?:"fecha"
                            def orden=params.order?:"asc"
                            order(campo, orden)
                        }
                    }

                    if ((params.sort=="nombre")||(params.sort=="cedula")){
                        caso{
                            paciente{
                                def campo=params.sort?:"nombre"
                                def orden=params.order?:"asc"
                                order(campo, orden)  
                            }
                        }
                    }                
                maxResults(10)        
            }    
            render(view: "menuEspecialista", model: [casoInstanceList: results, casoInstanceTotal: Caso.count()])
         }
    }
    
    def mostrarPorMedico = {
//      MEDICO QUE INGRESO AL SISTEMA
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)

//      OPERADOR ELVIS - OPERADOR TERNARIO ACORTADO
        def campo=params.sort?:"fecha"
        def orden=params.order?:"asc"
        
//      HISTORIALES EN LOS CUALES HA SIDO ACTOR EL MEDICO QUE INGRESO EL SISTEMA        
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance, [sort:campo, order:orden])        

        render(view: "mostrarPorMedico", model: [historialCasoInstanceList: historialInstance, historialCasoInstanceTotal: HistorialCaso.count()]) 
} 

    def casosAsociados = {
//      MEDICO QUE INGRESO AL SISTEMA
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)

//      CRITERIA PARA LISTAR LOS CASOS DISTINTOS DEL MEDICO ACTOR DEL SISTEMA        
        def c = HistorialCaso.createCriteria()
        def results = c.list {
            eq("medico", actorInstance) 
            projections { 
               distinct("caso")            
            }            
//      CONDICIONALES PARA EL ORDENAMIENTO
                if ((params.sort=="fechaInicio")||(params.sort=="fechaSolucion")||(params.sort=="status")||(params.sort=="descripcion")){
                   caso{
                        def campo=params.sort?:"fecha"
                        def orden=params.order?:"asc"
                        order(campo, orden)
                    }
                }

                if ((params.sort=="nombre")||(params.sort=="cedula")){
                    caso{
                        paciente{
                            def campo=params.sort?:"nombre"
                            def orden=params.order?:"asc"
                            order(campo, orden)  
                        }
                    }
                }                
            maxResults(10)        
        }          
        render(view: "casosAsociados", model: [CasoInstanceList: results])
} 
    
    def modificarCasos = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        if(session?.ActorSistema?.rol == "Triaje" ){
            
            def c = HistorialCaso.createCriteria()
            def results = c.list {
                projections { 
                   distinct("caso")            
                }            
                    if ((params.sort=="fechaInicio")||(params.sort=="fechaSolucion")||(params.sort=="status")||(params.sort=="descripcion")){
                       caso{//OPERADOR ELVIS
                            def campo=params.sort?:"fecha"
                            def orden=params.order?:"asc"
                            order(campo, orden)
                        }
                    }

                    if ((params.sort=="nombre")||(params.sort=="cedula")){
                        caso{
                            paciente{
                                def campo=params.sort?:"nombre"
                                def orden=params.order?:"asc"
                                order(campo, orden)  
                            }
                        }
                    }                
                maxResults(10)        
            }

            render(view: "modificarCaso", model: [casoInstanceList: results, casoInstanceTotal: Caso.count()]) 
        }       
    }
    
    def edit = {
        def casoInstance = Caso.get(params.id)
        if (!casoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [casoInstance: casoInstance]
        }
    }

    def update = {
        def casoInstance = Caso.get(params.id)
        if (casoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (casoInstance.version > version) {
                    
                    casoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'caso.label', default: 'Caso')] as Object[], "Another user has updated this Caso while you were editing")
                    render(view: "edit", model: [casoInstance: casoInstance])
                    return
                }
            }
            casoInstance.properties = params
            if (!casoInstance.hasErrors() && casoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
                redirect(action: "show", id: casoInstance.id)
            }
            else {
                render(view: "edit", model: [casoInstance: casoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def casoInstance = Caso.get(params.id)
        if (casoInstance) {
            try {
                casoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])}"
            redirect(action: "list")
        }
    }
}