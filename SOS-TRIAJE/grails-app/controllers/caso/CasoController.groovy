package caso

import medico.Triaje
import persona.ActorSistema
import java.util.List
import status.Status
import medico.Medico

import java.util.Date
import grails.converters.JSON

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
        def status1 = Status.get(1)         //En espera        
        def casoInstance = new Caso(params)
        casoInstance.status=status1
        
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
        def tipoBusqueda = 1
        
        if(session?.ActorSistema?.rol == "Triaje" ){
            
        def historialInstance 
        def todosLosCasos = Caso.list(params)
        List medicos = []
  
        def status8 = Status.get(8)         //Cerrado
            
            
        def c = Caso.createCriteria()
        def casosNoCerrados = c.list() {
            ne("status", status8) 
        }
            
          casosNoCerrados.each{
              historialInstance = HistorialCaso.findAllByCaso(it, [sort: "fecha", order: "desc"])   
                if(historialInstance){
                    historialInstance=historialInstance.first()
                    
                    if (historialInstance.estadoCaso==status8.nombre){
                        medicos.add(null)   
                    }else{
                        medicos.add(historialInstance.medico)
                    }                    
                }
                else{
                    medicos.add(null)
                }
          }
            
          render(view: "menuTriaje", model: [casoInstanceList: casosNoCerrados, casoInstanceTotal: casosNoCerrados.count(), medicoList:medicos, tipoBusqueda:tipoBusqueda]) 
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
            render(view: "menuEspecialista", model: [casoInstanceList: results, casoInstanceTotal: Caso.count(), tipoBusqueda:tipoBusqueda])
         }
    }
    
    def mostrarPorMedico = {
        def tipoBusqueda = 1
//      MEDICO QUE INGRESO AL SISTEMA
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)

//      OPERADOR ELVIS - OPERADOR TERNARIO ACORTADO
        def campo=params.sort?:"fecha"
        def orden=params.order?:"asc"
        
//      HISTORIALES EN LOS CUALES HA SIDO ACTOR EL MEDICO QUE INGRESO EL SISTEMA        
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance, [sort:campo, order:orden]) 
        
        render(view: "mostrarPorMedico", model: [historialCasoInstanceList: historialInstance, historialCasoInstanceTotal: HistorialCaso.count(), tipoBusqueda:tipoBusqueda]) 
} 

    def miHistorial = {
        def tipoBusqueda = 1
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance)
        
        def campo=params.sort?:"fecha"
        def orden=params.order?:"asc"
             
        List casoInstanceList = []
        
        historialInstance.each{
            casoInstanceList.add(HistorialCaso.findAllByCaso(it.caso))          
        }
        
        Set<String> s = new LinkedHashSet<String>(casoInstanceList);
        casoInstanceList.clear();
        casoInstanceList.addAll(s);
        
     render(view: "mostrarPorMedicoP", model: [historialCasoInstanceList: casoInstanceList, historialCasoInstanceTotal: casoInstanceList.count(), tipoBusqueda:tipoBusqueda]) 
    }
    
    def casosAsociados = {
        def tipoBusqueda = 1
//      MEDICO QUE INGRESO AL SISTEMA
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        
        def status8 = Status.get(8)         //Cerrado
        
//      CRITERIA PARA LISTAR LOS CASOS DISTINTOS DEL MEDICO ACTOR DEL SISTEMA        
        def c = HistorialCaso.createCriteria()
        def results = c.list {
            eq("medico", actorInstance) 
                caso{
                    ne("status", status8)
                }
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
        render(view: "casosAsociados", model: [CasoInstanceList: results, casoInstanceTotal: results.count(), tipoBusqueda:tipoBusqueda])
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

            render(view: "modificarCaso", model: [casoInstanceList: results, casoInstanceTotal: results.count(), tipoBusqueda:tipoBusqueda]) 
        }       
    }

    def casosSinAsignar = {
        if(session?.ActorSistema?.rol == "Triaje" ){        
            
            def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
            def historialInstance = HistorialCaso.getAll()

            def status1 = Status.get(1)         //En espera
            def status2 = Status.get(2)         //Asignado
            def status10 = Status.get(10)       //Rechazado 1er nivel

            List casoInstanceList = []
            
            def casoInstance = Caso.findAllByStatus(status1)
            casoInstance.each{
                casoInstanceList.add(it)
            }

            historialInstance.each{            
                if ((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status10.nombre)){  
                    
                        casoInstanceList.add(Caso.get(it.caso.id))  
                }               
            }
            
            Set<String> a = new LinkedHashSet<String>(casoInstanceList);
            casoInstanceList.clear();
            casoInstanceList.addAll(a);             
            
            render(view: "asignarCaso", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()]) 
        }

        if(session?.ActorSistema?.rol == "Especialista" ){

            def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
            def historialInstance = HistorialCaso.findAllByMedico(actorInstance)

            def status2 = Status.get(2)     //Asignado
            def status3 = Status.get(3)     //En proceso 1er nivel
            def status4 = Status.get(4)     //Segunda Opinion
            def status5 = Status.get(5)     //En proceso 2do nivel

            List casoInstanceList = []

            historialInstance.each{            
                if (((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status2.nombre))||
                    ((it.estadoCaso==status4.nombre)&&(it.caso.status.nombre==status4.nombre))||
                    ((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status3.nombre))||
                    ((it.estadoCaso==status4.nombre)&&(it.caso.status.nombre==status5.nombre))){                    
                
                casoInstanceList.add(Caso.get(it.caso.id))  
                }               
            }            

            Set<String> e = new LinkedHashSet<String>(casoInstanceList);
            casoInstanceList.clear();
            casoInstanceList.addAll(e); 
            
            render(view: "segundaOpinion", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()]) 
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
    
    def vResolverCaso = {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance)
        List casoInstanceList = []
        
        if(session?.ActorSistema?.rol == "Especialista" ){
            def status2 = Status.get(2)     //Asignado
            def status3 = Status.get(3)     //En proceso 1er nivel
            def status4 = Status.get(4)     //Segunda Opinion
            def status5 = Status.get(5)     //En proceso 2do nivel
            def status6 = Status.get(6)     //Resuelto 2do nivel

            historialInstance.each{            
                if (((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status3.nombre))||
                    ((it.estadoCaso==status4.nombre)&&(it.caso.status.nombre==status5.nombre))||
                    ((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status6.nombre))){

                            casoInstanceList.add(Caso.get(it.caso.id))  
                    }               
                }

            Set<String> o = new LinkedHashSet<String>(casoInstanceList);
            casoInstanceList.clear();
            casoInstanceList.addAll(o);  

            render(view: "resolverCaso", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()]) 
        }
        
        if(session?.ActorSistema?.rol == "Triaje" ){     
            def status3 = Status.get(3)     //En proceso 1er nivel
            
            historialInstance.each{            
                if ((it.estadoCaso==status3.nombre)&&(it.caso.status.nombre==status3.nombre)){

                            casoInstanceList.add(Caso.get(it.caso.id))  
                    }               
                }

            Set<String> o = new LinkedHashSet<String>(casoInstanceList);
            casoInstanceList.clear();
            casoInstanceList.addAll(o);  

            render(view: "resolverCaso", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()])             
        }   
    }    
    
    def aceptarCaso = {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance)
        
        List casoInstanceList = []        
        
        if(session?.ActorSistema?.rol == "Especialista" ){
            def status2 = Status.get(2)     //Asignado
            def status4 = Status.get(4)     //Segunda Opinion
            def status11 = Status.get(11)       //Rechazado 2do nivel

            historialInstance.each{
                if((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status2.nombre)||
                   (it.estadoCaso==status4.nombre)&&(it.caso.status.nombre==status4.nombre)||
                   (it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status11.nombre)){

                    casoInstanceList.add(Caso.get(it.caso.id))  
                }
            }
            
            Set<String> a = new LinkedHashSet<String>(casoInstanceList);
            casoInstanceList.clear();
            casoInstanceList.addAll(a); 
            
            render(view: "aceptarCaso", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()]) 
        }
        
        if(session?.ActorSistema?.rol == "Triaje" ){            

            def historialInstanceTodos = HistorialCaso.getAll()

            def status1 = Status.get(1)         //En espera
            def status2 = Status.get(2)         //Asignado
            def status10 = Status.get(10)       //Rechazado 1er nivel

            List casoInstanceListTriaje = []
            
            def casoInstance = Caso.findAllByStatus(status1)
            casoInstance.each{
                casoInstanceListTriaje.add(it)
            }

            historialInstanceTodos.each{            
                if ((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status10.nombre)){  
                    
                        casoInstanceListTriaje.add(Caso.get(it.caso.id))  
                }               
            }
            
            Set<String> e = new LinkedHashSet<String>(casoInstanceListTriaje);
            casoInstanceListTriaje.clear();
            casoInstanceListTriaje.addAll(e);              
            
            render(view: "aceptarCaso", model: [casoInstanceList: casoInstanceListTriaje, casoInstanceTotal: casoInstanceListTriaje.count()])             
        }
    }    
    
    def saveAceptarCaso= {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        Date date = new Date()
        def casoInstance = Caso.get(params.id)        
        def medicoInstance = Medico.get(actorInstance.id)

        if(session?.ActorSistema?.rol == "Especialista" ){        
            def status2 = Status.get(2)     //Asignado
            def status3 = Status.get(3)     //En proceso 1er nivel
            def status4 = Status.get(4)     //Segunda Opinion
            def status5 = Status.get(5)     //En proceso 2do nivel
            def status10 = Status.get(10)       //Rechazado 1er nivel
            def status11 = Status.get(11)       //Rechazado 2do nivel

            if ((casoInstance.status==status2)||(casoInstance.status==status11)||(casoInstance.status==status10)){
              casoInstance.status = status3   
            }
            if (casoInstance.status==status4){
              casoInstance.status = status5   
            }            

            def asignacion = new HistorialCaso()
            asignacion.fecha = date
            asignacion.medico = medicoInstance
            asignacion.estadoCaso = casoInstance.status.nombre
            asignacion.caso = casoInstance

            if (asignacion.save(flush: true)) {
                    flash.message = "${message(code: 'aceptado', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
                    render(view: "showC", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
            }
            else {
                    render(view: "aceptarCaso", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
            } 
        }
        
        if(session?.ActorSistema?.rol == "Triaje" ){ 
            def status1 = Status.get(1)     //En espera
            def status3 = Status.get(3)     //En proceso 1er nivel
            
            if (casoInstance.status==status1){
              casoInstance.status = status3   
            } 
            
            def asignacion = new HistorialCaso()
            asignacion.fecha = date
            asignacion.medico = medicoInstance
            asignacion.estadoCaso = casoInstance.status.nombre
            asignacion.caso = casoInstance

            if (asignacion.save(flush: true)) {
                    flash.message = "${message(code: 'aceptado', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
                    render(view: "showC", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
            }
            else {
                    render(view: "aceptarCaso", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
            }             
            
        }  
    }
    
    def rechazarCaso = {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance)

        def status2 = Status.get(2)     //Asignado
        def status4 = Status.get(4)     //Segunda Opinion
        def status11 = Status.get(11)       //Rechazado 2do nivel

        List casoInstanceList = []
        
        historialInstance.each{
            if((it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status2.nombre)||
               (it.estadoCaso==status4.nombre)&&(it.caso.status.nombre==status4.nombre)||
               (it.estadoCaso==status2.nombre)&&(it.caso.status.nombre==status11.nombre)){
               
                casoInstanceList.add(Caso.get(it.caso.id))  
            }
        }
        
        Set<String> o = new LinkedHashSet<String>(casoInstanceList);
        casoInstanceList.clear();
        casoInstanceList.addAll(o);      

        render(view: "rechazarCaso", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()]) 
    }     
    
    def saveRechazarCaso= {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        Date date = new Date()
        def casoInstance = Caso.get(params.id)        
        def medicoInstance = Medico.get(actorInstance.id)
        
        def status2 = Status.get(2)         //Asignado
        def status4 = Status.get(4)         //Segunda Opinion
        def status10 = Status.get(10)       //Rechazado 1er nivel
        def status11 = Status.get(11)       //Rechazado 2do nivel

        if ((casoInstance.status==status2)||(casoInstance.status==status11)){
          casoInstance.status = status10   
        }        
        if (casoInstance.status==status4){
          casoInstance.status = status11   
        }        

        def asignacion = new HistorialCaso()
        asignacion.fecha = date
        asignacion.medico = medicoInstance
        asignacion.estadoCaso = casoInstance.status.nombre
        asignacion.caso = casoInstance

        if (asignacion.save(flush: true)) {
                flash.message = "${message(code: 'rechazado', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
                render(view: "showC", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
        }
        else {
                render(view: "rechazarCaso", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
        }       
    }

    def verPorFechaT = {
        def tipoBusqueda = 2
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
                
        if(session?.ActorSistema?.rol == "Triaje" ){   
            
            def d = params.desde
            def h = params.hasta            
            def status8 = Status.get(8)         //Cerrado

            def historialInstance 
            def todosLosCasos = Caso.list(params)
            List medicos = []

            def c = Caso.createCriteria()
            def casosNoCerrados = c.list {
                ne("status", status8) 
                ge("fechaInicio", d)
                le("fechaInicio", h)
            }

              casosNoCerrados.each{
                  historialInstance = HistorialCaso.findAllByCaso(it, [sort: "fecha", order: "desc"])   
                    if(historialInstance){
                        historialInstance=historialInstance.first()

                        if (historialInstance.estadoCaso==status8.nombre){
                            medicos.add(null)   
                        }else{
                            medicos.add(historialInstance.medico)
                        }                    
                    }
                    else{
                        medicos.add(null)
                    }
              }

              render(view: "menuTriaje", model: [casoInstanceList: casosNoCerrados, casoInstanceTotal: casosNoCerrados.count(), medicoList:medicos, tipoBusqueda:tipoBusqueda])         
        
        }        
    }
    
    def cerrarCaso = {
	def status7 = Status.get(7) //Resuelto 1er nivel
        def historialInstance = HistorialCaso.findAllByEstadoCaso(status7.nombre)
                
        List casoInstanceList = []
        historialInstance.each{
            if (it.caso.status==status7){
                casoInstanceList.add(Caso.get(it.caso.id)) 
            }                 
        }
        
        Set<String> o = new LinkedHashSet<String>(casoInstanceList);
        casoInstanceList.clear();
        casoInstanceList.addAll(o); 
        
        render(view: "cerrarCaso", model: [casoInstanceList: casoInstanceList, casoInstanceTotal: casoInstanceList.count()]) 
    }      
    
    def saveCerrarCaso= {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        Date date = new Date()
        def casoInstance = Caso.get(params.id)        
        def medicoInstance = Medico.get(actorInstance.id)
        
        def status8 = Status.get(8)         //Cerrado
        casoInstance.status = status8 
        casoInstance.fechaSolucion = date
     
        def asignacion = new HistorialCaso()
        asignacion.fecha = casoInstance.fechaSolucion
        asignacion.medico = medicoInstance
        asignacion.estadoCaso = casoInstance.status.nombre
        asignacion.caso = casoInstance

        if (asignacion.save(flush: true)) {
                flash.message = "${message(code: 'cerrado', args: [message(code: 'caso.label', default: 'Caso'), casoInstance.id])}"
                render(view: "showC", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
        }
        else {
                render(view: "cerrarCaso", model: [casoInstance: casoInstance, casoInstanceTotal: casoInstance.count()])
        }       
    }    
    
    def verPorFecha = {
        def tipoBusqueda = 2
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def c = HistorialCaso.createCriteria()
        
        if(session?.ActorSistema?.rol == "Especialista" ){
            def d = params.desde
            def h = params.hasta

            def casos = c.list {
                eq("medico", actorInstance) 
                caso{
                    ge("fechaInicio", d)
                    le("fechaInicio", h)
                }
                projections { 
                   distinct("caso")            
                }
            }
           render (view:'menuEspecialista', model:[casoInstanceList:casos, casoInstanceTotal: casos.count(), tipoBusqueda:tipoBusqueda])
        }
        if(session?.ActorSistema?.rol == "Triaje" ){   
            
            def d = params.desde
            def h = params.hasta           
            def status8 = Status.get(8)         //Cerrado

    //      CRITERIA PARA LISTAR LOS CASOS DISTINTOS DEL MEDICO ACTOR DEL SISTEMA 
            def results = c.list {
                eq("medico", actorInstance) 
                    caso{
                        ne("status", status8)
                        ge("fechaInicio", d)
                        le("fechaInicio", h)
                    }
                projections { 
                   distinct("caso")            
                }       
            }          
            render(view: "casosAsociados", model: [CasoInstanceList: results, casoInstanceTotal: results.count(), tipoBusqueda:tipoBusqueda])            
//            render (view:'casosAsociadosP', model:[casoInstanceList:casos, casoInstanceTotal: casos.count()])
        }        
    }
    
    def verHistorialesPorFecha = {
        def actorInstance = ActorSistema.get(session?.ActorSistema?.id)
        def historialInstance = HistorialCaso.findAllByMedico(actorInstance)
        
        List casoInstanceList = []
        
        def tipoBusqueda = 2
                
        def d = params.desde
        def h = params.hasta      
        
            def c = HistorialCaso.createCriteria()
            def HistorialPorFecha = c.list {
                ge("fecha", d)
                le("fecha", h)
                eq("medico",actorInstance)
            }
            
        HistorialPorFecha.each{
            casoInstanceList.add(HistorialCaso.findAllByCaso(it.caso))
        }
        
        Set<String> s = new LinkedHashSet<String>(casoInstanceList);
        casoInstanceList.clear();
        casoInstanceList.addAll(s);

        render(view: "mostrarPorMedicoP", model: [historialCasoInstanceList: casoInstanceList, historialCasoInstanceTotal: casoInstanceList.count(), tipoBusqueda:tipoBusqueda])                     
    }  
    
}