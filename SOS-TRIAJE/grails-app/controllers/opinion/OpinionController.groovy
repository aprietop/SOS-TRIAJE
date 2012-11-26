package opinion

import persona.ActorSistema
import caso.Caso
import caso.HistorialCaso
import status.Status

class OpinionController {

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
        [opinionInstanceList: Opinion.list(params), opinionInstanceTotal: Opinion.count()]
    }

    def create = {
        def opinionInstance = new Opinion()
        opinionInstance.properties = params
        return [opinionInstance: opinionInstance]
    }

    def save = {
        def opinionInstance = new Opinion(params)
        if (opinionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'opinion.label', default: 'Opinion'), opinionInstance.id])}"
            redirect(action: "show", id: opinionInstance.id)
        }
        else {
            render(view: "create", model: [opinionInstance: opinionInstance])
        }
    }

    def show = {
        def opinionInstance = Opinion.get(params.id)
        if (!opinionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opinion.label', default: 'Opinion'), params.id])}"
            redirect(action: "list")
        }
        else {
            [opinionInstance: opinionInstance]
        }
    }

//    MUESTRA LAS RESPUESTA QUE HAN REALIZADO TODOS LOS DOCTORES EXCEPTO YO
    def verOtrasRespuestas = {
        def metodo = 2
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
               
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance)  
        
        List misCasos = []
        historialInstance.each{
            misCasos.add(it.caso)
        }

        Set<String> s = new LinkedHashSet<String>(misCasos);
        misCasos.clear();
        misCasos.addAll(s);      
        
        List misOpiniones = []
        misCasos.each{
            if (it.opiniones){
                misOpiniones.add(it.opiniones)
            }
        }
              
        Set<String> o = new LinkedHashSet<String>(misOpiniones);
        misOpiniones.clear();
        misOpiniones.addAll(o);  
        
        render(view: "porMedico", model: [opinionInstanceList: misOpiniones, opinionInstanceTotal: misOpiniones.count(),nMetodo: metodo])  
    } 
    
//    MUESTRA TODAS LAS RESPUESTA, INCLUYENDO LAS MIAS
    def verRespuestasT = {
        def metodo = 1
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        render(view: "porMedico", model: [opinionInstanceList: Opinion.list(params), opinionInstanceTotal: Opinion.count(),nMetodo: metodo])  
    } 
    
//    MUESTRA LAS RESPUESTA QUE COMO DOCTOR HE HECHO
    def verMisRespuestas = {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def c = Opinion.createCriteria()
        def metodo = 3
        
        def opiniones = c.list {
            eq("medico", actorInstance) 
            def campo=params.sort?:"fechaOpinion"
            def orden=params.order?:"asc"
            order(campo, orden)
        }       
        
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        render(view: "porMedico", model: [opinionInstanceList: opiniones, opinionInstanceTotal: Opinion.count(), nMetodo: metodo])  
    }

    def createSolucion = {
        def casoInstance = Caso.get(params.id)
        def opinionInstance = new Opinion()
        opinionInstance.properties = params
        return [opinionInstance: opinionInstance, casoInstance:casoInstance]
    }
    
    def saveSolucion = {        
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        
        Date date = new Date()
        
        def opinionInstance = new Opinion()
        def casoInstance = Caso.get(params.idCaso)        
       
        def status2 = Status.get(2)
        def status3 = Status.get(3)
        def status5 = Status.get(5)
        def status6 = Status.get(6)
        def status7 = Status.get(7)
        
        def hCaso = HistorialCaso.findByCaso(casoInstance)
        
        def asignacion = new HistorialCaso()
        
            if (casoInstance.status==status3){   
                casoInstance.status=status7               
            } 
            if (casoInstance.status==status6){   
                casoInstance.status=status7                   
            }              
            if (casoInstance.status==status5){   
                casoInstance.status=status6   
            }            
                    
        asignacion.fecha = date        
        asignacion.medico = actorInstance
        asignacion.estadoCaso = casoInstance.status.nombre
        asignacion.caso = casoInstance
        asignacion.save()
            
        opinionInstance.fechaOpinion = date
        opinionInstance.nombreOpinion = params.nombreOpinion
        opinionInstance.cuerpoOpinion = params.cuerpoOpinion
        opinionInstance.medico = actorInstance
        opinionInstance.caso = casoInstance
        
        if (opinionInstance.save(flush: true)) {
            flash.message = "${message(code: 'solucion', args: [message(code: 'solucion', default: 'Solucion'), casoInstance.id])}"
            render(view: "showC", model: [casoInstance: casoInstance])
        }
        else {
            render(view: "createSolucion", model: [opinionInstance: opinionInstance])
        }
    }    
    
    def edit = {
        def opinionInstance = Opinion.get(params.id)
        if (!opinionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opinion.label', default: 'Opinion'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [opinionInstance: opinionInstance]
        }
    }

    def update = {
        def opinionInstance = Opinion.get(params.id)
        if (opinionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (opinionInstance.version > version) {
                    
                    opinionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'opinion.label', default: 'Opinion')] as Object[], "Another user has updated this Opinion while you were editing")
                    render(view: "edit", model: [opinionInstance: opinionInstance])
                    return
                }
            }
            opinionInstance.properties = params
            if (!opinionInstance.hasErrors() && opinionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'opinion.label', default: 'Opinion'), opinionInstance.id])}"
                redirect(action: "show", id: opinionInstance.id)
            }
            else {
                render(view: "edit", model: [opinionInstance: opinionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opinion.label', default: 'Opinion'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def opinionInstance = Opinion.get(params.id)
        if (opinionInstance) {
            try {
                opinionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'opinion.label', default: 'Opinion'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'opinion.label', default: 'Opinion'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opinion.label', default: 'Opinion'), params.id])}"
            redirect(action: "list")
        }
    }
}
