package sos.triaje

import java.util.Date
import caso.Caso
import caso.HistorialCaso
import status.Status
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import medico.Medico
import medico.Triaje

class ResPrimNivelToCerradoJob {
    static triggers = {
      //Se ejecuta cada 1 minuto, el primero empieza en el segundo 2
      simple name:'Resuelto1erNivelTrigger', startDelay:2000, repeatInterval: 60000//1 minuto
    }
    
    def triajeService    
    def mailService
    def execute() {
        
//        def status7 = Status.get(7) //Resuelto primer nivel
//        def status8 = Status.get(8) //Cerrado
//        
//        def asignacion = new HistorialCaso()
//        
//        List casoInstanceList = []
//        List correoTriajeList = []
//        
//        //TODOS LOS CASOS CON ESTADO ASIGNADO
//        casoInstanceList = triajeService.getAllCasosPorStatus(status7)
//        
//        def triajeInstance = Triaje.findAll()
//        triajeInstance.each{
//            correoTriajeList.add(it.mail)
//        }
//        
//        TimeCategory tiempo = new TimeCategory()
//        TimeDuration duration
//       
//        casoInstanceList.each{       
//            
//            def historialInstance = HistorialCaso.findAllByCaso(it, [sort: "fecha", order: "desc"])  
//            def primerHistorial=historialInstance.first()
//            
//            Date fechaActual = new Date()
//            fechaActual = fechaActual.toTimestamp()
//            
//            duration= tiempo.minus(fechaActual, primerHistorial.fecha)            
//            def horas = duration.getHours()
//            def minutos = duration.getMinutes()     
//            
// 
//            //Si no han pasado 2 minutos, envia notificacion de asignacion de caso segun el trigger (cada 1 minuto)
//            if(minutos <4){ 
//                    try{
//                        mailService.sendMail {
//                            to correoTriajeList.toArray() //Email de los encargados de Triaje
//                            subject "Notificación de cierre de caso" // Asunto del mensaje
//                            html    "Notificacion: Dr. Encargado de Triaje, se le recuerda revisar el caso numero "+primerHistorial.caso.id+" para concluir con su cierre, Gracias."
//                        }
//                    }catch(Exception e){
//                        println "Error de conexion 1"
//                        e.printStackTrace()
//                    } 
//                
//            }
//            //Si han pasado 2 minutos o mas, envia notificacion de liberacion de caso 1 sola vez            
//            else{            
//                    try{
//                        mailService.sendMail {
//                            to correoTriajeList.toArray()//Email de los encargados de Triaje
//                            subject "Notificacion de cierre de caso" // Asunto del mensaje
//                            html    "Notificacion: Dr. Encargado de Triaje, se le informa que el caso numero "+primerHistorial.caso.id+" fue cerrado automaticamente debido al atraso en su respuesta para su cierre, Gracias"
//                        }
//                    }catch(Exception e){
//                        println "Error de conexion 2"
//                        e.printStackTrace()
//                    }                    
//                                
//                    Date date = new Date()
//                    
//                    it.status = status8                    
//                    asignacion.fecha = date
//                    asignacion.medico = primerHistorial.medico
//                    asignacion.estadoCaso = it.status.nombre
//                    asignacion.caso = it
//                    asignacion.save()                    
//            }
//        }        
    }
}
