package persona

class Administrador extends ActorSistema{
   
    //CONSTRAINTS    
    static constraints = {       
        
        nombre(blank: false, nullable: false)
        apellido(blank: false, nullable: false)
        cedula(blank: false, nullable: false, unique: true)
        sexo(blank: false, nullable: false)
        mail(blank: true, nullable: true, email: true, unique: true)
        login(blank: false, nullable: false, unique: true)
        password(blank: false, nullable: false, size: 6..10)
    }
}