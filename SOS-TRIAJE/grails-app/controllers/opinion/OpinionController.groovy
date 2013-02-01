package opinion

import persona.ActorSistema
import caso.Caso
import caso.HistorialCaso
import status.Status
import archivo.Archivo

class OpinionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static def mapArchivoPorCasos= [:]
    
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
        
        List<String> nombresDeArchivos = new ArrayList<String>()
        
        //guardado de archivos cargados       
        mapArchivoPorCasos.each{
            if(it.value==opinionInstance.caso.id){
                nombresDeArchivos.add(it.key)
            }
        }
//        println "archivos a guardar: "+mapArchivoPorCasos+" clase: "+mapArchivoPorCasos.class
//        println "archivos a guardados: "+nombresDeArchivos+" clase: "+nombresDeArchivos.class
            def webRootDir = servletContext.getRealPath("/")  
            
            int i=0;
            while (i< nombresDeArchivos.size())
            {
                File txt = new File(webRootDir+"/cargarArchivosSosTriaje/"+nombresDeArchivos.get(i)) 
            
                def archivoInstance = new Archivo()
//                println "clase nombre: "+nombresDeArchivos.get(i).class
                archivoInstance.nombre = nombresDeArchivos.get(i)
                archivoInstance.descripcion = "Archivo del caso: "+casoInstance.idCasoSOS+" , paciente: "+casoInstance.paciente.nombre+" "+casoInstance.paciente.apellido
                archivoInstance.adjunto = txt.getBytes()                      
                archivoInstance.save() 
                casoInstance.addToArchivos(archivoInstance)
                i++;
            }        
            
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
    
    //METODO PARA IMPORTAR ARCHIVOS
    def importarArchivos = {
        // se recupera el archivo en la varible archivo (fileName), que es el nombre del imput file del gsp
        def archivo= request.getFile('fileName')
        if (archivo.originalFilename){
            // se crea el directorio en la ruta donde esta la aplicacion y se agrega la carpeta cargarArchivos
            def webRootDir = servletContext.getRealPath("/")        
            def userDir = new File(webRootDir, "/cargarArchivosSosTriaje")
            userDir.mkdirs()
            // se guarda el archivo en esa carpeta
            archivo.transferTo( new File( userDir, archivo.originalFilename))
            // para obtener el apth del archivo
            String file=userDir.toString()+ File.separator + archivo.originalFilename
            // se agrega el nombre del archivo a una lista en caso de querer imprimir el nombre
            ArrayList nomArchivo=new ArrayList()
            nomArchivo.add(archivo.originalFilename)

        if (params.idCaso){
            def casoInstance = Caso.get(params.idCaso)
            mapArchivoPorCasos.put(archivo.originalFilename, casoInstance.id)
            render (view:'createSolucion', model:[nomArchivo:nomArchivo, casoInstance:casoInstance])
        }        
            
        }else{
        if (params.idCaso){
//            println "params.idCaso "+params.idCaso+" xlase "+params.idCaso.class
            def casoInstance = Caso.get(params.idCaso)
                flash.message = 'Por favor cargue un archivo e intente nuevamente.'
                render (view:'createSolucion', model:[casoInstance:casoInstance])
        }
      }
    }    
}
