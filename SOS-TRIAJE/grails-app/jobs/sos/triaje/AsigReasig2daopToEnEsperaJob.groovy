package sos.triaje

import java.util.Date
import caso.Caso
import caso.HistorialCaso
import status.Status
import groovy.time.TimeCategory
import groovy.time.TimeDuration

class AsigReasig2daopToEnEsperaJob {
    static triggers = {
      //Se ejecuta cada 5 segundos, el primero empieza al 2 segundo
      simple name:'5SecondsTrigger', startDelay:2000, repeatInterval: 60000//1 minuto
    }

    static int contador = 0
//    static int metodo = 0
    
    def execute() {       
        
        def status2 = Status.get(2) //Asignado
        def status1 = Status.get(1) //En espera
        
        def asignacion = new HistorialCaso()
        
        List casoInstanceList = []

        def casoInstance = Caso.findAllByStatus(status2)
        casoInstance.each{
            casoInstanceList.add(it)
        }
        
        TimeCategory tiempo = new TimeCategory()
        TimeDuration duration
       
        casoInstanceList.each{       
            
            def historialInstance = HistorialCaso.findAllByCaso(it, [sort: "fecha", order: "desc"])  
            historialInstance=historialInstance.first()
            
            Date fechaActual = new Date()
            fechaActual = fechaActual.toTimestamp()
            
            duration= tiempo.minus(fechaActual, historialInstance.fecha)            
            def horas = duration.getHours()
            def minutos = duration.getMinutes()
            def segundos = duration.getSeconds()       
            
            if(minutos <2){ 
                contador = contador+1
//                println "Notificacion "+contador+": Recuerde Dr. "+historialInstance.medico.nombre+
//                " "+historialInstance.medico.apellido+", por favor revisar el caso numero "+
//                historialInstance.caso.id+" que le ha sido asignado"
                
                    try{
                        sendMail {
                            to historialInstance.medico.mail //Email del usuario
                            subject "Revisar caso asignado" // Asunto del mensaje
                            body    "Notificacion "+contador+": Recuerde Dr. "+historialInstance.medico.nombre+
                                    " "+historialInstance.medico.apellido+", por favor revisar el caso numero "+
                                    historialInstance.caso.id+" que le ha sido asignado"
                        }
                    }catch(Exception e){
                        println "Error de conexion"
                    }
                
            }else{
//                println "Notificacion "+contador+": Dr. "+historialInstance.medico.nombre+
//                " "+historialInstance.medico.apellido+", se le informa que el caso numero "+
//                historialInstance.caso.id+" que le fue asignado ha sido liberado debido al atrazo en su respuesta"
                    try{
                        sendMail {
                            to historialInstance.medico.mail //Email del usuario
                            subject "Libaración de caso asignado" // Asunto del mensaje
                            body    "Notificacion "+contador+": Dr. "+historialInstance.medico.nombre+
                                    " "+historialInstance.medico.apellido+", se le informa que el caso numero "+
                                    historialInstance.caso.id+" que le fue asignado ha sido liberado debido al atrazo en su respuesta"
                        }
                    }catch(Exception e){
                        println "Error de conexion"
                    }                    
                
                
                    Date date = new Date()
                    
                    it.status = status1                    
                    asignacion.fecha = date
                    asignacion.medico = historialInstance.medico
                    asignacion.estadoCaso = it.status.nombre
                    asignacion.caso = it
                    asignacion.save()
                    
                    println "CASO LIBERADO CON EXITO"
            }
        }
    }
}
