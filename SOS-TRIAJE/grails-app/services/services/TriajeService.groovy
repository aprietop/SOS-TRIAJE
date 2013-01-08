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
    
    List<String> mostrarCaso (List<String> newLista){
        //Lista que acumulara por centros los casos que han sido impresos
        List<String> casosImpresos = new ArrayList<String>() 
        //Lista que contendra los casos que deberan ser impresos
        List<String> casosAImprimir = new ArrayList<String>()
        
            int k=0;
            while (k< newLista.size())
            {
                casosImpresos.add(newLista.get(k))
            }
            
            int i=0;
            while (i< newLista.size())
            {
                int j=0;
                while (j< casosImpresos.size()){
                    if((casosImpresos.get(j))!=(newLista.get(i))){
                        casosAImprimir.add(newLista.get(i))    
                    }
                j++;
                }
            i++;
            }
            
        return casosAImprimir
    }
    
}
