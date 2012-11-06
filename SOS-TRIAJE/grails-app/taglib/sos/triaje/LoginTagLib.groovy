package sos.triaje

class LoginTagLib {
    def loginControl = {
        
        if(session.ActorSistema){
//          out << "Bienvenido: ${session.ActorSistema.login} "
          out << "Bienvenido: ${session.ActorSistema.nombre} ${session.ActorSistema.apellido}"
          out << " | "
          out << """${link(action:"logout", controller:"actorSistema"){"Cerrar Sesión"}}"""
        } else {
          out << """[${link(action:"login", controller:"actorSistema"){"Login"}}]"""      
        }
      }
}
