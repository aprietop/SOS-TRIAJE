package archivo

import javax.activation.MimetypesFileTypeMap
class ArchivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [archivoInstanceList: Archivo.list(params), archivoInstanceTotal: Archivo.count()]
    }

    def create = {
        def archivoInstance = new Archivo()
        archivoInstance.properties = params
        return [archivoInstance: archivoInstance]
    }

    def save = {
        def archivoInstance = new Archivo(params)
        if (archivoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])}"
            redirect(action: "show", id: archivoInstance.id)
        }
        else {
            render(view: "create", model: [archivoInstance: archivoInstance])
        }
    }

    def show = {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [archivoInstance: archivoInstance]
        }
    }

    def edit = {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [archivoInstance: archivoInstance]
        }
    }

    def importar = {}
    
    def update = {
        def archivoInstance = Archivo.get(params.id)
        if (archivoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (archivoInstance.version > version) {
                    
                    archivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'archivo.label', default: 'Archivo')] as Object[], "Another user has updated this Archivo while you were editing")
                    render(view: "edit", model: [archivoInstance: archivoInstance])
                    return
                }
            }
            archivoInstance.properties = params
            if (!archivoInstance.hasErrors() && archivoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])}"
                redirect(action: "show", id: archivoInstance.id)
            }
            else {
                render(view: "edit", model: [archivoInstance: archivoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def archivoInstance = Archivo.get(params.id)
        if (archivoInstance) {
            try {
                archivoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def importarArchivosOld = {
        // se recupera el archivo en la varible archivo (fileName), que es el nombre del imput file del gsp
        def archivo= request.getFile('fileName')
          // se crea el directorio en la ruta donde esta la aplicacion y se agrega la carpeta cargarArchivos
        def webRootDir = servletContext.getRealPath("/")        
        def userDir = new File(webRootDir, "/cargarArchivos")
        userDir.mkdirs()
        // se guarda el archivo en esa carpeta
        archivo.transferTo( new File( userDir, archivo.originalFilename))
        // para obtener el apth del archivo
        String file=userDir.toString()+ File.separator + archivo.originalFilename
        // se agrega el nombre del archivo a una lista en caso de querer imprimir el nombre
        ArrayList nomArchivo=new ArrayList()
        nomArchivo.add(archivo.originalFilename)
        // se regresa la lista a un gsp
    render (view:'importar', model:[nomArchivo:nomArchivo])
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

            //lleno el mapa con el id del episodio y el nombre del archivo
            mapArchivoPorCasos.put(archivo.originalFilename, params.episodioId)
    
            render (view:'importar', model:[nomArchivo:nomArchivo, episodioId:params.episodioId])            
        }else{
            flash.message = 'default.no.archive.message'
            redirect(controller: 'triaje', action: 'importar', id:params.episodeId)
        }
    }    
    
    
    def mostrarArchivo = {
       def webRootDir = servletContext.getRealPath("/")        

       File f = new File(webRootDir+"/cargarArchivos/"+"TDC 25-Jun-12.png")
        
       response.setContentType(new MimetypesFileTypeMap().getContentType(f).toString())
       response.setContentLength(f.getBytes().size())
//       println "tamaño forma1: "+f.getBytes().size()
       OutputStream out = response.getOutputStream()
       out.write(f.getBytes())
       out.close()        
    }  
    
    def showArchivoCargado = {
        def archivoInstance = Archivo.findByNombre("TDC 25-Jun-12.png") 
        response.setContentLength(archivoInstance.adjunto.size())
        OutputStream out = response.getOutputStream()
        out.write(archivoInstance.adjunto)
        out.close()   
    }
    
    def showArchivoSeleccionado = {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            response.setContentLength(archivoInstance.adjunto.size())
            OutputStream out = response.getOutputStream()
            out.write(archivoInstance.adjunto)
            out.close()
        }     
    }
}