package webService
import pojos.PojoPrueba
import caso.Caso
import pojos.PojoCaso
import triaje.PojoCasoResuelto

class ServicioWebTriajeService {

    static transactional = true
    static expose=['cxf']
    
    def triajeService
    
    PojoPrueba serviceHolaMundo(){
        println "Esto es todo amigos"
        
        PojoPrueba p = new PojoPrueba()
        return p
    }
    
        //SERVICIO PARA ENVIAR EL CASO A SOS-TRIAJE DESDE SOS-HME Y OPERAR SOS-TRIAJE
        boolean enviarCasoTriaje(PojoCaso caso, String uuid){            
            boolean flag = false

                if(caso){
                flag = true
                }

//            
//            boolean exist = triajeService.getCentroPorUuid(uuid)
//            if (exist){
//                printl "centro encontrado"
//            }
//                

            //OPERACIONES PARA GUARDAR TODO EN LA BASE DE DATOS

            return flag
        }    

        //SERVICIO PARA OBTENER EL STATUS DEL CASO, SI ES "CERRADO" LLAMAR AL SERVICIO SIGUIENTE
        String getStatusCaso(String uuid){

            String status = ""


            //OPERACIONES PARA OBTENER EL STATUS DEL CASO

            return status
        } 
        
    
        PojoCasoResuelto getCasoResuelto(PojoCaso caso){
               //OPERACIONES PARA OBTENER EL CASO RESUELTO
               
        
            PojoCasoResuelto casoResuelto = new PojoCasoResuelto()
            
            return casoResuelto    
        } 

}
