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
      //Se ejecuta cada 6 horas, el primero empieza en el segundo 2
      simple name:'EnProceso1NivelTrigger', startDelay:2000, repeatInterval: 21600000//cada 6 horas
    }
    
    def triajeService    
    def mailService
    def execute() {

//        def status1 = Status.get(1) //En espera
//        def status3 = Status.get(3) //En proceso primer nivel
//        
//        def asignacion = new HistorialCaso()
//        
//        List casoInstanceList = []
//        
//        //TODOS LOS CASOS CON ESTADO ASIGNADO
//        casoInstanceList = triajeService.getAllCasosPorStatus(status3)
//        
//        TimeCategory tiempo = new TimeCategory()
//        TimeDuration duration
//       
//        casoInstanceList.each{       
//            
//            def historialInstance = HistorialCaso.findAllByCaso(it, [sort: "fecha", order: "desc"])  
//            historialInstance=historialInstance.first()
//            
//            Date fechaActual = new Date()
//            fechaActual = fechaActual.toTimestamp()
//            
//            duration= tiempo.minus(fechaActual, historialInstance.fecha)            
//            def horas = duration.getHours()
//            def minutos = duration.getMinutes()     
//            
//            String trato = triajeService.getGenero(historialInstance.medico)            
//            
//            //Si no han pasado 24 horas, envia notificacion de asignacion de caso segun el trigger (cada 6 horas)
//            if(horas <24){ 
//                    try{
//                        mailService.sendMail {
//                            to historialInstance.medico.mail //Email del usuario
//                            subject "Notificación de caso aceptado" // Asunto del mensaje
//                            html    "Notificacion: "+trato+" "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le recuerda revisar el caso numero "+historialInstance.caso.id+" que accedio a dar solución, Gracias."
//                        }
//                    }catch(Exception e){
//                        println "Error de conexion"
//                        e.printStackTrace()
//                    } 
//                
//            }
//            //Si han pasado 2 minutos o mas, envia notificacion de liberacion de caso 1 sola vez            
//            else{            
//                    try{
//                        mailService.sendMail {
//                            to historialInstance.medico.mail //Email del usuario
//                            cc "angelica.gomez.ucab@gmail.com" //
//                            subject "Libaración de caso aceptado" // Asunto del mensaje
//                            html    "Notificacion: "+trato+" "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le informa que el caso numero "+historialInstance.caso.id+" que accedio a dar solución ha sido liberado automaticamente debido al atraso en su respuesta, Gracias"
//                        }
//                    }catch(Exception e){
//                        println "Error de conexion"
//                        e.printStackTrace()
//                    }                    
//                
//                
//                    Date date = new Date()
//                    
//                    it.status = status1                    
//                    asignacion.fecha = date
//                    asignacion.medico = historialInstance.medico
//                    asignacion.estadoCaso = it.status.nombre
//                    asignacion.caso = it
//                    asignacion.save()
//                    
//            }
//        }
    }
}