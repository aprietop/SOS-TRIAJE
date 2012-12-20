package webService
import pojos.PojoPrueba
import pojos.PojoCaso
import triaje.PojoCasoResuelto
import persona.Paciente
import persona.Paciente
import pojos.PojoArchivo
import pojos.PojoEspecialidad
import pojos.PojoPaciente

import java.util.List

import archivo.Archivo
import caso.Caso
import centro.CentroSOS
import especialidad.Especialidad
import persona.Persona
import persona.Paciente
import status.Status


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

                def status = Status.get(1)         //En espera

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
                
                def casoInstance = Caso.findByIdCasoSOS(thisCaso.idCasoSOS)
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
            
            def c = Caso.findByCentro(centroInstance).createCriteria()
            casosCerrados = c.list {
                eq("status", status8) 
            }
                
            casosCerrados.each{
//                println "caso cerrado: "+it.idCasoSOS
                IdCasosCerrados.add(it.idCasoSOS)
            }
        }

        return IdCasosCerrados
    }


    PojoCasoResuelto getCasoResuelto(PojoCaso caso){
        //OPERACIONES PARA OBTENER EL CASO RESUELTO


        PojoCasoResuelto casoResuelto = new PojoCasoResuelto()

        return casoResuelto
    }

}
