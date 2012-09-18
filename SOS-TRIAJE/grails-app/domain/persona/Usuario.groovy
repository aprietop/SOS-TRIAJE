package persona
import rol.*

class Usuario {
    
    //ATRIBUTOS
    String usuario
    String password
   //String rolUsuario
   
    //RELACIONES        
    //static hasMany = [rolUsuario: Rol]
    
    
    //MAPEO
    static mapping = {
        table = 'usuario'
    }
}
