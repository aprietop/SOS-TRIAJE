package persona

class ActorSistema extends Persona{
//ATRIBUTOS
    String mail
    String login
    String password
    String rol
    
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
  }
  
}
