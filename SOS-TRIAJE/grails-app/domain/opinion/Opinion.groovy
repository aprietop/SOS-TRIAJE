package opinion

import status.*
import medico.*
import caso.*

import java.sql.Time

class Opinion {

//ATRIBUTOS
    Date fechaOpinion    
    String cuerpoOpinion
    String nombreOpinion
    String estadoOpinion
    Medico medico
    //Opinion OpinionPadre
    
    static belongsTo = [caso:Caso]
      
//RELACIONES
    static hasMany = [opiniones:Opinion]

//CONSTRAINTS    
    static constraints = {        
        fechaOpinion(nullable: false)
        cuerpoOpinion(nullable: false)
        estadoOpinion(blank:true, nullable: true)
        medico(nullable: false)
    }
}
