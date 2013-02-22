package webService
import pojos.PojoCaso
import pojos.PojoCasoResuelto
import pojos.PojoMedico
import persona.Paciente
import pojos.PojoArchivo
import pojos.PojoEspecialidad
import pojos.PojoPaciente
import pojos.PojoSeguimientoCaso
import pojos.PojoOpinion
import pojos.PojoObservacion

import java.util.List

import archivo.Archivo
import caso.Caso
import opinion.Opinion
import caso.HistorialCaso
import centro.CentroSOS
import especialidad.Especialidad
import persona.Persona
import persona.Paciente
import especialidad.Especialidad
import status.Status
import java.text.SimpleDateFormat
import observacion.Observacion


class ServicioWebTriajeService {

    static transactional = true
    static expose=['cxf']

    def triajeService

    public PojoCaso thisCaso
    public List<PojoArchivo> thisArchivos
    public List<PojoEspecialidad> thisEspecialidades
    public PojoPaciente thisPaciente
    public String thisUuid

    //SERVICIO PARA ENVIAR EL CASO A SOS-TRIAJE DESDE SOS-HME Y OPERAR SOS-TRIAJE
    boolean enviarCasoTriaje(PojoCaso caso, String uuid){
    boolean flag = false
    
        if(caso){
            def centroInstance = CentroSOS.findByUuid(uuid)
            if (centroInstance){
                def casoNuevo = new Caso()
                println "centro encontrado"
                flag = true

                //OPERACIONES PARA GUARDAR TODO EN LA BASE DE DATOS
                this.thisCaso = caso
                this.thisArchivos = thisCaso.archivos
                this.thisEspecialidades = thisCaso.especialidad
                this.thisPaciente = thisCaso.paciente
                this.thisUuid = uuid
                
                def status = Status.get(1) //En espera

                Date today = new Date()
                
                def pacienteNuevo = new Paciente()
                pacienteNuevo.nombre = thisPaciente.nombre
                pacienteNuevo.apellido = thisPaciente.apellido
                pacienteNuevo.cedula = Integer.parseInt(thisPaciente.cedula)
                pacienteNuevo.sexo = thisPaciente.sexo
                pacienteNuevo.fechaNacimiento = new Date().parse("yyyy-MM-dd",thisPaciente.fechaNacimiento)
                
                def pacienteInstance = Paciente.findByCedula(Integer.parseInt(thisPaciente.cedula))
                if(pacienteInstance){
                    println "Paciente encontrado"
                    casoNuevo.paciente = pacienteInstance
                }else{
                    if (!pacienteNuevo.save()) println "Error al guardar el paciente: "+paciente.errors
                    casoNuevo.paciente = pacienteNuevo
                }
                
                casoNuevo.descripcion = thisCaso.descripcion
                casoNuevo.fechaInicio = today
                casoNuevo.status = status
                casoNuevo.idCasoSOS = thisCaso.idCasoSOS
                casoNuevo.centro = centroInstance

                if (thisEspecialidades){
                    int i=0;
                    while (i< thisEspecialidades.size())
                    {
                        def especialidad = Especialidad.findByNombre(thisEspecialidades.get(i).nombre)
                        casoNuevo.addToEspecialidades(especialidad)
                        i++;
                    }
                }
                if (thisArchivos){
                    int j=0;
                    while (j< thisArchivos.size())
                    {
                        def archivo = new Archivo()
                        archivo.nombre = thisArchivos.get(j).nombre
                        archivo.descripcion = thisArchivos.get(j).descripcion
                        archivo.adjunto = thisArchivos.get(j).adjunto
                        archivo.save()
                        casoNuevo.addToArchivos(archivo)
                        
                        j++;
                    }
                }
                
                def casoInstance = Caso.findByIdCasoSOSAndCentro(thisCaso.idCasoSOS, centroInstance)
                if (casoInstance){
                    println "Caso ya existente"
                }else{
                    if (!casoNuevo.save()) println "Error al guardar el caso: "+casoNuevo.errors
                }
            }
        }

        return flag
    }

    //SERVICIO PARA OBTENER EL STATUS DEL CASO, SI ES "CERRADO" LLAMAR AL SERVICIO SIGUIENTE
    List<String> getIdCasoCerrado(String uuid){
        List<String> IdCasosCerrados = new ArrayList<String>();
           
        def centroInstance = CentroSOS.findByUuid(uuid)
        def status8 = Status.get(8)         //Cerrado
        def casosCerrados

        if(centroInstance){
            def a = Caso.findByCentro(centroInstance)
            if (a){
                def c = a.createCriteria()
                casosCerrados = c.list {
                    eq("status", status8) 
                }

                casosCerrados.each{
                    IdCasosCerrados.add(it.idCasoSOS)
                }     
            }
        }
        return IdCasosCerrados
    }
    
    //SERVICIO PARA OBTENER LA LISTA DE TODOS LOS CASOS ENVIADOS POR EL CENTRO
    List<String> getIdCasosEnviados(String uuid){
        List<String> IdCasosEnviados = new ArrayList<String>();
           
        def centroInstance = CentroSOS.findByUuid(uuid)

        if(centroInstance){
            def casos = Caso.findAllByCentro(centroInstance, [sort: "fechaInicio", order: "desc"])
            if (casos){
                casos.each{
                        if (it.opiniones){
                            IdCasosEnviados.add(it.idCasoSOS)
                        }   
                }   
            }
        }
        return IdCasosEnviados
    }    
    
    
    //SERVICIO PARA MOSTRAR EN SOS-HME LAS ESPECIALIDADES SEGUN ESPECIALISTAS DISPONIBLES EN SOS-TRIAJE
    List<String> getEspecialidades(String uuid){
        List<String> especialidadList = new ArrayList<String>();
           
        def especialidadInstance = Especialidad.findAll()

            especialidadInstance.each{
                especialidadList.add(it.nombre)                
            }
       
        return especialidadList
    }       
  
        
    //SERVICIO PARA ENVIAR EL CASO RESUELTO A SOS-HME
    PojoCasoResuelto getCasoResuelto(String idCasoSOS){
        //OPERACIONES PARA OBTENER EL CASO RESUELTO
        def casoInstance = Caso.findByIdCasoSOS(idCasoSOS)

            List<PojoArchivo> archivosCasoResuelto = new ArrayList<PojoArchivo>();
                def archivos = Archivo.findAllByCaso(casoInstance)
                
//                println "archivos: "+archivos+" clase "+archivos.class
                
                if(archivos){
                    archivos.each{          
                        PojoArchivo archivosAEnviar = new PojoArchivo()  
                            archivosAEnviar.nombre = it.nombre
                            archivosAEnviar.descripcion = it.descripcion
                            archivosAEnviar.adjunto = it.adjunto
                            archivosCasoResuelto.add(archivosAEnviar)   
                            
//                            println "archivosCasoResuelto "+archivosCasoResuelto+" clase "+archivosCasoResuelto.class
                    }
                }                
        
        //Ultima opinion del caso, tiene consigo el medico quien emitio la opinion
        def opinionInstance = Opinion.findAllByCaso(casoInstance, [sort: "fechaOpinion", order: "desc"])
            opinionInstance=opinionInstance.first()            
            String Opinion = opinionInstance.cuerpoOpinion
        
        SimpleDateFormat fecha = new SimpleDateFormat("yyyy-MM-dd")
        String fechaSolucion = fecha.format(casoInstance.fechaSolucion)
        
            //Medico que emitio la solucion al caso   
            PojoMedico medicoCaso = new PojoMedico()
                medicoCaso.nombre=opinionInstance.medico.nombre
                medicoCaso.apellido=opinionInstance.medico.apellido
                
                if (opinionInstance.medico.numColegioMedico){
                    medicoCaso.colegioDeMedico=opinionInstance.medico.numColegioMedico
                }   
                if (opinionInstance.medico.numMinisterioSalud){
                    medicoCaso.ministerioDeSalud=opinionInstance.medico.numMinisterioSalud
                }
            
        PojoCasoResuelto casoResuelto = new PojoCasoResuelto()
                    casoResuelto.idCasoSOS = idCasoSOS
                    casoResuelto.opinion = Opinion
                    casoResuelto.responsable = medicoCaso         
                    casoResuelto.fechaSolucion = fechaSolucion
                    casoResuelto.archivos = archivosCasoResuelto
        
        return casoResuelto
    }  
    
    
    //SERVICIO PARA VERIFICAR SI EL CASO QUE SE INTENTA ENVIAR A SOS-TRIAJE YA HA SIDO ENVIADO
    boolean ifCaseSent(String idCasoSOS, String uuid){
    boolean flag = false
    
        def centroInstance = CentroSOS.findByUuid(uuid)
        
        if(centroInstance){
            def casoInstance = Caso.findByIdCasoSOSAndCentro(idCasoSOS, centroInstance)
            
            if (casoInstance){
                flag = true
            }            
        }
        return flag
    }   
    
    //SERVICIO PARA MOSTRAR EL SEGUIMIENTO DEL CASO EN SOS-HME
    PojoSeguimientoCaso getSeguimientoDelCaso(String idCasoSOS){
   
        List<PojoArchivo> archivosCaso = new ArrayList<PojoArchivo>(); 
        List<PojoOpinion> opinionesDelCaso = new ArrayList<PojoOpinion>();  
                
        def casoInstance = Caso.findByIdCasoSOS(idCasoSOS)
            List<PojoArchivo> archivosCasoResuelto = new ArrayList<PojoArchivo>();
                
                def archivos = Archivo.findAllByCaso(casoInstance)
                if(archivos){
                    archivos.each{          
                        PojoArchivo archivosAEnviar = new PojoArchivo()  
                            archivosAEnviar.nombre = it.nombre
                            archivosAEnviar.descripcion = it.descripcion
                            archivosAEnviar.adjunto = it.adjunto
                            archivosCasoResuelto.add(archivosAEnviar)   
                      }
                }                
                def opiniones = Opinion.findAllByCaso(casoInstance, [sort: "fechaOpinion", order: "desc"])
                if (opiniones){
                    opiniones.each{                                        
                        PojoOpinion opinionesAEnviar = new PojoOpinion()
                            opinionesAEnviar.cuerpoOpinion = it.cuerpoOpinion
                            SimpleDateFormat fecha = new SimpleDateFormat("dd-MM-yyyy HH:mm a")
                            String fechaDeOpinion = fecha.format(it.fechaOpinion)                            
                            opinionesAEnviar.fechaOpinion = fechaDeOpinion
                
                        PojoMedico medicoCaso = new PojoMedico()
                            medicoCaso.nombre=it.medico.nombre
                            medicoCaso.apellido=it.medico.apellido

                            if (it.medico.numColegioMedico){
                                medicoCaso.colegioDeMedico=it.medico.numColegioMedico
                            }   
                            if (it.medico.numMinisterioSalud){
                                medicoCaso.ministerioDeSalud=it.medico.numMinisterioSalud
                            }           
                            
                            opinionesAEnviar.medicoOpinion =  medicoCaso
                            opinionesDelCaso.add(opinionesAEnviar)
                    }
                }            
    
                        PojoSeguimientoCaso casoSeguimiento = new PojoSeguimientoCaso()
                            casoSeguimiento.idCasoSOS = idCasoSOS
                            casoSeguimiento.archivos = archivosCasoResuelto
                            casoSeguimiento.opiniones = opinionesDelCaso
        
        return casoSeguimiento
    }  
    
    //SERVICIO PARA ENVIAR LA OBSERVACION DEL CASO A SOS-TRIAJE DESDE SOS-HME
    boolean enviarObservacionTriaje(PojoObservacion observacion, String uuid){
    boolean flag = false
//    println "llego hasta aqui "
        
    PojoObservacion thisObservacionCaso        
    String thisIdCaso
    String thisObservacion
    
        if(observacion){
            
            def centroInstance = CentroSOS.findByUuid(uuid)
            if (centroInstance){                    
                thisObservacionCaso = observacion
                thisIdCaso = thisObservacionCaso.idCasoObservacion
                thisObservacion = thisObservacionCaso.observacion            

                def observacionCaso = new Observacion()
                    observacionCaso.idCasoObservacion = thisObservacionCaso.idCasoObservacion
                    observacionCaso.observacion = thisObservacionCaso.observacion
                    observacionCaso.save()

                def statusN = Status.get(2)  // Asignado
                def casoDueñoDeLaObservacion = Caso.findByIdCasoSOSAndCentro(thisIdCaso, centroInstance)
                    casoDueñoDeLaObservacion.descripcion = casoDueñoDeLaObservacion.descripcion+"\n"+"Observacion: "+"\n"+thisObservacion+"\n"+"\n" 
                    casoDueñoDeLaObservacion.status = statusN  
                    
                //Ultima opinion del caso, tiene consigo el medico quien emitio la opinion
                def opinionInstance = Opinion.findAllByCaso(casoDueñoDeLaObservacion, [sort: "fechaOpinion", order: "desc"])
                    opinionInstance=opinionInstance.first()                           
               
                Date date = new Date()
                def asignacion = new HistorialCaso()
                    asignacion.fecha = date
                    asignacion.medico = opinionInstance.medico
                    asignacion.estadoCaso = casoDueñoDeLaObservacion.status.nombre
                    asignacion.caso = casoDueñoDeLaObservacion
                    asignacion.save()         
                
                flag = true
            }
        }
        
    }
    
}