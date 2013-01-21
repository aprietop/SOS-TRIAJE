package archivo

import caso.*

class Archivo {
    
//ATRIBUTOS
    String nombre
    String descripcion
    byte[] adjunto
    
    static belongsTo = [caso:Caso]
        
//MAPEO
/*
    static mapping = {
         version false
    }*/
    
//CONSTRAINTS    
    static constraints = {        
        nombre(nullable: false)
        descripcion(nullable: false)
        adjunto(nullable: false, maxSize : 1024*1024*10)
    }   
}
