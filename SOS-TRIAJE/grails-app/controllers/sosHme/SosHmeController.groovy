package sosHme
import triaje.EnviarCasoSosHmeResponse
import triaje.EnviarCasoSosHme
import triaje.PojoCasoResuelto
import triaje.PojoMedico
class SosHmeController {
    
    def customSecureServiceClientTriaje

    def index = { 
    
       // render customSecureServiceClientTriaje.servicioPruebaSosHME()    
    
      PojoMedico medico = new PojoMedico()
            medico.setNombre("Pepe")
            medico.setApellido("Perez")
            medico.setColegioDeMedico(133)
            medico.setMinisterioDeSalud(343)
               
      PojoCasoResuelto caso = new PojoCasoResuelto()
            caso.setIdCasoSOS("abc")
            caso.setResponsable(medico)
            caso.setOpinion("ddd")
            caso.setFechaSolucion("Alguna fecha1")
                
        def c = customSecureServiceClientTriaje.enviarCasoSosHme(caso)
        
            render c.idCasoSOS +" "+c.responsable.nombre

                
    }   
}