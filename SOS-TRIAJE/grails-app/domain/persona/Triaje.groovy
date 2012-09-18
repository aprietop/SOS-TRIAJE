package persona

class Triaje extends Persona{
    
    //ATRIBUTOS
    Integer numColegioMedico
    Integer numMinisterioSalud
    /*
    static constraints = {
    } */
    
    //MAPEO
    static mapping = {
        table = 'triaje'
    }
    
}