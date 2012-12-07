package sos.triaje

import java.util.Date
import caso.Caso
import caso.HistorialCaso
import status.Status
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import medico.Medico
import medico.Especialista
import especialidad.Especialidad
import caso.HistorialCaso

class ReasignadoToEnEsperaToReasignadoJob {
    static triggers = {
      //Se ejecuta cada 1 minuto, el primero empieza en el segundo 2
      simple name:'ReasignadoEnEsperaReasignadoTrigger', startDelay:2000, repeatInterval: 60000//1 minuto
    }
    
    def triajeService
    def mailService
    def execute() {
        
//        def status9 = Status.get(9) //Reasignado
//        def status1 = Status.get(1) //En espera
//        def status2 = Status.get(2) //Asignado
//        def status3 = Status.get(3) //En proceso 1er nivel
//        def status5 = Status.get(5) //En proceso 2do nivel        
//        
//        def asignacionReasignar = new HistorialCaso()
//        def asignacionLiberar = new HistorialCaso()
//        
//        List casoInstanceList = []
//        List casosAceptados = []
//        
//        def mapEspCantCasos= [:]  //Mapa de los especialistas y sus cantidades de casos
//        
//        //TODOS LOS CASOS CON ESTADO ASIGNADO
//        casoInstanceList = triajeService.getAllCasosPorStatus(status9)
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
//            def segundos = duration.getSeconds()            
//            
//            String trato = triajeService.getGenero(historialInstance.medico)                     
//            
//            //Si no han pasado 2 minutos, envia notificacion de asignacion de caso segun el trigger (cada 1 minuto)
//            if(segundos <118){ 
//                  try{
//                        mailService.sendMail {
//                            to historialInstance.medico.mail //Email del usuario
//                            subject "Notificación de caso asignado" // Asunto del mensaje
//                            html    "Notificacion: "+trato+" "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le recuerda revisar el caso numero "+historialInstance.caso.id+" que le fue asignado, Gracias."
//                        }
//                    }catch(Exception e){
//                        println "Error de conexion"
//                        e.printStackTrace()
//                    } 
//                
//            }
//            //Si han pasado 2 minutos o mas, envia notificacion de liberacion de caso 1 sola vez            
//            else{            
//                //SI TIENE ESPECIALIDADES SE REASIGNA EL CASO
//                if (it.especialidades){                                                
//                    def especialidad = it.especialidades
//
//                    especialidad.each{                           
//                        it.especialista.each{j->
//
//                        def historialActual = HistorialCaso.findAllByMedico(j)
//
//                            historialActual.each{            
//                            if (((it.estadoCaso==status3.nombre)&&(it.caso.status.nombre==status3.nombre))||
//                                ((it.estadoCaso==status5.nombre)&&(it.caso.status.nombre==status5.nombre))){
//                                      casosAceptados.add(Caso.get(it.caso.id))  
//
//                                      mapEspCantCasos.put(it.medico,casosAceptados.size())
//                            }               
//                           }
//                        }                        
//                    }
//
//                mapEspCantCasos = mapEspCantCasos.sort{
//                    it.value
//                }
//
//                def esp = new ArrayList(mapEspCantCasos.keySet())
//
//                def primero = esp[0] //Especialista con menos casos
//
//                if (primero == historialInstance.medico){
//                    if(esp[1]){
//                      primero = esp[1]  
//                    }else{
//                      primero = primero   
//                    }                            
//                }
//
//                    //SI TIENE ESPECIALIDAD Y PASA EL TIEMPO SE REASIGNA EL CASO
//                    try{
//                        mailService.sendMail {
//                            to historialInstance.medico.mail //Email del usuario
//                            cc "angelica.gomez.ucab@gmail.com" //
//                            subject "Reasignacion de caso" // Asunto del mensaje
//                            html    "Notificacion: "+trato+" "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le informa que el caso numero "+historialInstance.caso.id+" que le fue asignado ha sido reasignado automaticamente debido al atraso en su respuesta, Gracias"
//                        }
//                    }catch(Exception e){
//                        println "Error de conexion"
//                        e.printStackTrace()
//                    }                    
//
//                    Date date = new Date()
//
//                    it.status = status9                    
//                    asignacionReasignar.fecha = date
//                    asignacionReasignar.medico = primero
//                    asignacionReasignar.estadoCaso = it.status.nombre
//                    asignacionReasignar.caso = it
//                    asignacionReasignar.save()                          
//
//                }else{
//                    //SI NO TIENE ESPECIALIDADES SE LIBERA EL CASO A "EN ESPERA"
//                    try{
//                        mailService.sendMail {
//                            to historialInstance.medico.mail //Email del usuario
//                            cc "angelica.gomez.ucab@gmail.com" //
//                            subject "Libaración de caso asignado" // Asunto del mensaje
//                            html    "Notificacion: "+trato+" "+historialInstance.medico.nombre+" "+historialInstance.medico.apellido+", se le informa que el caso numero "+historialInstance.caso.id+" que le fue asignado ha sido liberado automaticamente debido al atraso en su respuesta, Gracias"
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
//                    asignacionLiberar.fecha = date
//                    asignacionLiberar.medico = historialInstance.medico
//                    asignacionLiberar.estadoCaso = it.status.nombre
//                    asignacionLiberar.caso = it
//                    asignacionLiberar.save()       
//
//                }             
//            }
//        }
    }
}
