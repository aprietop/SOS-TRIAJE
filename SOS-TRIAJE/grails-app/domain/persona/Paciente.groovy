package persona

import caso.*
import java.sql.Time

class Paciente extends Persona{
//ATRIBUTOS
    Date fechaNacimiento
//    static belongsTo = [caso:Caso]
       
//CONSTRAINTS    
    static constraints = {        
        fechaNacimiento(nullable: false)     
    }
}
