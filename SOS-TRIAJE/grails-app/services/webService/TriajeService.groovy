package webService

class TriajeService {

    static transactional = true
     static expose=['cxf']
    
    def serviceMethod() {

    }
    
    def serviceHolaMundo(){
        println "Esto es todo amigos"
        return "Esto es todo amigos"
    }
    
}
