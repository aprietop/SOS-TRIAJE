package sosHme
import triaje.EnviarCasoSosHmeResponse
import triaje.EnviarCasoSosHme
class SosHmeController {
    
    def customSecureServiceClientTriaje

    def index = { 
    
       // render customSecureServiceClientTriaje.servicioPruebaSosHME()    
    
        
        def c = customSecureServiceClientTriaje.enviarCasoSosHme()
         println "HOLA"
            render c.idCasoSOS+" "+c.fechaSolucion+" "+c.responsable
        
        
        
        
        
    }

    
}