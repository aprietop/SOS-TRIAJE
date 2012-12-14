package services

import medico.Medico
import caso.Caso
import status.Status
import caso.HistorialCaso
import centro.CentroSOS

class TriajeService {

    static transactional = true

    def getGenero(Medico medico) {

           def trato
            if(medico.sexo=="Femenino"){
                trato = "Dra."
            }
            if(medico.sexo=="Masculino"){
                trato = "Dr."
            }   
            
        return trato
    }
    
    def getAllCasosPorStatus(Status status){
        
        List casoInstanceList = [] 
        def casoInstance = Caso.findAllByStatus(status)
        casoInstance.each{
            casoInstanceList.add(it)
        }

        return casoInstanceList
    }
    
    boolean getCentroPorUuid(String uuid){
        boolean encontrado = false
        
        def centroInstance = CentroSOS.findByUuid(uuid)
        
        if (centroInstance){
            encontrado = true
        }
        
        return encontrado        
    }
    
}
