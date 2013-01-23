package persona

class ActorSistema extends Persona{
//ATRIBUTOS
    String mail
    String login
    String password
    String rol
    String idReset
    boolean bandera = false
    static transients = ['pass2', 'bandera']    
    
    
//MAPEO
    static mapping = {
        tablePerHierarchy false
    }

//CONSTRAINTS  
static constraints = {
    login(nullable: false, unique:true)
    password(nullable: false, password:true)
    mail(nullable: true, unique:true, email: true)
    rol(nullable: false)
    idReset(nullable:true, blank:true)
  }
  
public static ActorSistema existIdReset(String idReset){
        if(idReset){
            def ActorSistema = ActorSistema.withCriteria{
                eq("idReset", idReset)
            }
            if(ActorSistema){
                return ActorSistema[0]
            }else{
                return null
            }
        }else{
            return null
        }
    }
    
    
    public createIdReset(){
        //CREAR UN UUID
        this.idReset = java.util.UUID.randomUUID().toString()
    }    
  
}
