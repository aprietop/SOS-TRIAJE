package sos.triaje

import java.util.Date
import caso.Caso
import caso.HistorialCaso
import status.Status
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import medico.Medico

class EnProcPrimNivelToEnEsperaJob {
    static triggers = {
      //Se ejecuta cada 1 minuto, el primero empieza en el segundo 2
      simple name:'EnProceso1NivelTrigger', startDelay:2000, repeatInterval: 60000//1 minuto
    }

    static int contador = 0
    
    def mailService
    def execute() {

        def status1 = Status.get(1) //En espera
        def status3 = Status.get(3) //En proceso primer nivel
        
        def asignacion = new HistorialCaso()
        
        List casoInstanceList = []
        
        //TODOS LOS CASOS CON ESTADO ASIGNADO
        def casoInstance = Caso.findAllByStatus(status3)
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
            
            //Si no han pasado 2 minutos, envia notificacion de asignacion de caso segun el trigger (cada 1 minuto)
            if(minutos <2){ 
                contador = contador+1
   
                    try{
                        mailService.sendMail {
                            to historialInstance.medico.mail //Email del usuario //"angelica.gomez.ucab@gmail.com"
                            subject "Notificación de caso aceptado" // Asunto del mensaje
                            html    "Notificacion "+contador+": Dr. "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le recuerda revisar el caso numero "+historialInstance.caso.id+" que accedio a dar solución, Gracias."
                        }
                    }catch(Exception e){
                        println "Error de conexion"
                        e.printStackTrace()
                    } 
                
            }
            //Si han pasado 2 minutos o mas, envia notificacion de liberacion de caso 1 sola vez            
            else{            
                    try{
                        mailService.sendMail {
                            to historialInstance.medico.mail//historialInstance.medico.mail //Email del usuario
                            cc "angelica.gomez.ucab@gmail.com" //
                            subject "Libaración de caso aceptado" // Asunto del mensaje
                            html    "Notificacion "+contador+": Dr. "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le informa que el caso numero "+historialInstance.caso.id+" que accedio a dar solución ha sido liberado debido al atraso en su respuesta, Gracias"
                        }
                    }catch(Exception e){
                        println "Error de conexion"
                        e.printStackTrace()
                    }                    
                
                
                    Date date = new Date()
                    
                    it.status = status1                    
                    asignacion.fecha = date
                    asignacion.medico = historialInstance.medico
                    asignacion.estadoCaso = it.status.nombre
                    asignacion.caso = it
                    asignacion.save()
                    
            }
        }
    }
}
