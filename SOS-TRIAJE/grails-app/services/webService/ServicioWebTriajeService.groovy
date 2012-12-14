package webService
import pojos.PojoPrueba
import pojos.PojoCaso
import triaje.PojoCasoResuelto
import persona.Paciente
import persona.Paciente
import pojos.PojoArchivo
import pojos.PojoEspecialidad
import pojos.PojoPaciente

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

    //    PojoPrueba serviceHolaMundo(){
    //        println "Esto es todo amigos"
    //
    //        PojoPrueba p = new PojoPrueba()
    //        return p
    //    }

    //SERVICIO PARA ENVIAR EL CASO A SOS-TRIAJE DESDE SOS-HME Y OPERAR SOS-TRIAJE
    boolean enviarCasoTriaje(PojoCaso caso, String uuid){
        boolean flag = false

        if(caso){
            //                flag = true
            //                    boolean exist = triajeService.getCentroPorUuid(uuid)
            def centroInstance = CentroSOS.findByUuid(uuid)
            if (centroInstance){
                println "centro encontrado"
                flag = true

                //OPERACIONES PARA GUARDAR TODO EN LA BASE DE DATOS
                this.thisCaso = caso
                this.thisArchivos = thisCaso.archivos
                this.thisEspecialidades = thisCaso.especialidad
                this.thisPaciente = thisCaso.paciente
                this.thisUuid = uuid

                println "especialidades: "+thisEspecialidades
                def status = Status.get(1)         //En espera

                Date today = new Date()

                def paciente = new Paciente()
                paciente.nombre = thisPaciente.nombre
                paciente.apellido = thisPaciente.apellido
                paciente.cedula = Integer.parseInt(thisPaciente.cedula)
                paciente.sexo = thisPaciente.sexo
                paciente.fechaNacimiento = new Date().parse("yyyy-MM-dd",thisPaciente.fechaNacimiento)
                if (!paciente.save()) println "Error al guardar el paciente: "+paciente.errors

                def casoNuevo = new Caso()
                casoNuevo.descripcion = thisCaso.descripcion
                casoNuevo.fechaInicio = today
                casoNuevo.paciente = paciente
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

                if (!casoNuevo.save()) println "Error al guardar el caso: "+casoNuevo.errors
            }
        }

        return flag
    }

    //SERVICIO PARA OBTENER EL STATUS DEL CASO, SI ES "CERRADO" LLAMAR AL SERVICIO SIGUIENTE
    String getStatusCaso(String uuid){

        String status = ""


        //OPERACIONES PARA OBTENER EL STATUS DEL CASO

        return status
    }


    PojoCasoResuelto getCasoResuelto(PojoCaso caso){
        //OPERACIONES PARA OBTENER EL CASO RESUELTO


        PojoCasoResuelto casoResuelto = new PojoCasoResuelto()

        return casoResuelto
    }

}
