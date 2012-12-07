package webService
import pojos.PojoPrueba

class TriajeService {

    static transactional = true
     static expose=['cxf']
    
    
    PojoPrueba serviceHolaMundo(){
        println "Esto es todo amigos"
        
        PojoPrueba p = new PojoPrueba()
        return p
    }
    
}
