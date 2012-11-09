package medico

import especialidad.*
import medico.*

class Especialista extends Medico{
    
//ATRIBUTOS
    String horarioDeTrabajo
    
//RELACIIONES
    static hasMany = [especialidades:Especialidad]
    
//CONSTRAINTS    
    static constraints = {        
        horarioDeTrabajo(blank: true, nullable: true)
        especialidades(nullable: false)
        nombre(blank: false, nullable: false)
        apellido(blank: false, nullable: false)
        cedula(blank: false, nullable: false, unique: true, number:true)
        sexo(blank: false, nullable: false)
        mail(blank: true, nullable: true, email: true, unique: true)
        login(blank: false, nullable: false, unique: true)
        password(blank: false, nullable: false, size: 6..10)
    }
}
