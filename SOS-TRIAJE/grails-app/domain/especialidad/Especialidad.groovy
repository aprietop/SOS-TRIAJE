package especialidad

import medico.*

class Especialidad {
    
//ATRIBUTOS
    String nombre
    String descripcion
    static belongsTo = Especialista

//RELACIIONES
    static hasMany = [especialista:Especialista]
    
//CONSTRAINTS    
    static constraints = {        
        nombre(blank:false, nullable: false, unique: true)
        descripcion(blank:false, nullable: false, unique: true)
        especialista(nullable: true)
    }
}
