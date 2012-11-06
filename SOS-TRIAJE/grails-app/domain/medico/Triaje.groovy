package medico

import medico.*

class Triaje extends Medico{
    
//ATRIBUTOS
    Integer numColegioMedico
    Integer numMinisterioSalud
 
    //CONSTRAINTS    
    static constraints = {       
        
        nombre(blank: false, nullable: false)
        apellido(blank: false, nullable: false)
        cedula(blank: false, nullable: false, unique: true, number:true)
        sexo(blank: false, nullable: false)
        mail(blank: true, nullable: true, email: true, unique: true)
        login(blank: false, nullable: false, unique: true)
        password(blank: false, nullable: false, size: 6..10)
    }
}