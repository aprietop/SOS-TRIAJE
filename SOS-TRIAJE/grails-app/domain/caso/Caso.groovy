package caso

import especialidad.*
import status.*
import archivo.*
import persona.*
import opinion.*
import java.util.Date
import centro.CentroSOS

class Caso {
//ATRIBUTOS
    String descripcion
    Date fechaInicio
    Date fechaSolucion 
    Status status    
    Paciente paciente //Datos del paciente
    String idCasoSOS  //ID del caso en SOS-HME
    CentroSOS centro
   
//RELACIONES
    static hasMany = [especialidades:Especialidad, opiniones:Opinion, archivos:Archivo, historialCasos: HistorialCaso]
    
//CONSTRAINTS    
    static constraints = {
        descripcion(nullable: false, maxSize : 200000)
        fechaInicio(nullable: false)
        paciente(nullable: false)  
        fechaSolucion(blank:true, nullable: true)
        status(nullable: false)
        paciente(nullable: false)
        especialidades(blank:true, nullable: true)
        idCasoSOS(nullable: true, blank:true)
        centro(nullable: true, blank:true)
    }
}
