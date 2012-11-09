package persona

class Persona {
    
//ATRIBUTOS
    String nombre
    String apellido
    Integer cedula
    String sexo
    String nacionalidad
    
//MAPEO
    static mapping = {
        tablePerHierarchy false
    }
    
//CONSTRAINTS    
    static constraints = {        
        nombre(nullable: false)
        apellido(nullable: false)
        cedula(nullable: false)
        sexo(nullable: false)
        nacionalidad(blank: true, nullable: true)
    }
}
