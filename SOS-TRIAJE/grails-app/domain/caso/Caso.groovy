package caso

import especialidad.*
import status.*
import archivo.*
import persona.*
import opinion.*
import java.util.Date

class Caso {
//ATRIBUTOS
    String descripcion
    Date fechaInicio
    Date fechaSolucion 
    Status status    
    Paciente paciente //Datos del paciente
   
//RELACIONES
    static hasMany = [especialidades:Especialidad, opiniones:Opinion, archivos:Archivo, historialCasos: HistorialCaso]
    
//CONSTRAINTS    
    static constraints = {
        descripcion(nullable: false)
        fechaInicio(nullable: false)
        paciente(nullable: false)  
        fechaSolucion(blank:true, nullable: true)
        status(nullable: false)
        paciente(nullable: false)
        especialidades(blank:true, nullable: true)
    }
}
