package persona

import especialidad.*

class Especialista extends Persona{
    
    //ATRIBUTOS
    String horarioDeTrabajo
    Integer numColegioMedico
    Integer numMinisterioSalud
    
    //RELACIIONES
    Especialidad especialidad
        
    //MAPEO
        static mapping = {
        table = 'especialista'
    }
}
