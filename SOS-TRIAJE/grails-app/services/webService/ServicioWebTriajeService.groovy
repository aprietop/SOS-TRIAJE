package webService
import pojos.PojoPrueba
import caso.Caso
import pojos.PojoCaso

class ServicioWebTriajeService {

    static transactional = true
    static expose=['cxf']
    
    PojoPrueba serviceHolaMundo(){
        println "Esto es todo amigos"
        
        PojoPrueba p = new PojoPrueba()
        return p
    }
    
       boolean enviarCasoTriaje(PojoCaso caso, String uuid){
        boolean flag = false
        
        if(caso){
            flag = true
        }
        
        
        //OPERACIONES PARA GUARDAR TODO EN LA BASE DE DATOS
        
        return flag
    }    

}
