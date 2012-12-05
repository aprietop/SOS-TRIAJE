package sos.triaje

import java.util.Date
import caso.Caso
import caso.HistorialCaso
import status.Status
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import medico.Medico

class ResSegNivelToResPrimNivelJob {
    static triggers = {
      //Se ejecuta cada 1 minuto, el primero empieza en el segundo 2
      simple name:'Resuelto2doNivelTrigger', startDelay:2000, repeatInterval: 60000//1 minuto
    }

    static int contador = 0
    
    def mailService
    def execute() {
       
        def status2 = Status.get(2) //Asignado
        def status6 = Status.get(6) //Resuelto segundo nivel
        def status7 = Status.get(7) //Resuelto primer nivel
        
        def asignacion = new HistorialCaso()
        
        List casoInstanceList = []
        List histEspAsignado = []
        
        //TODOS LOS CASOS CON ESTADO ASIGNADO
        def casoInstance = Caso.findAllByStatus(status6)
        casoInstance.each{
            casoInstanceList.add(it)
        }
        
        TimeCategory tiempo = new TimeCategory()
        TimeDuration duration
       
        casoInstanceList.each{       
            
            def historialInstance = HistorialCaso.findAllByCaso(it, [sort: "fecha", order: "desc"])  
            def primerHistorial=historialInstance.first()
            
            Date fechaActual = new Date()
            fechaActual = fechaActual.toTimestamp()
            
            duration= tiempo.minus(fechaActual, primerHistorial.fecha)            
            def horas = duration.getHours()
            def minutos = duration.getMinutes()
            def segundos = duration.getSeconds()       
            
                def historialAsignado

                historialInstance.each{                 
                    if (it.estadoCaso==status2.nombre){
                    histEspAsignado.add(it)
                    }
                }
                
                historialAsignado = histEspAsignado.first()
                
            def trato
            if(historialAsignado.medico.sexo=="Femenino"){
                trato = "Dra."
            }
            if(historialAsignado.medico.sexo=="Masculino"){
                trato = "Dr."
            }  
            
            //Si no han pasado 2 minutos, envia notificacion de asignacion de caso, 
            //segun el trigger (cada 1 minuto)
            if(minutos <2){ 
                contador = contador+1
   
                    try{
                        mailService.sendMail {
                            to historialAsignado.medico.mail //Email del usuario
                            subject "Notificación de revision de segunda opinion" // Asunto del mensaje
                            html    "Notificacion "+contador+": "+trato+" "+historialAsignado.medico.nombre+" "+historialAsignado.medico.apellido+", se le recuerda revisar la solucion de segunda opinion dada al caso numero "+primerHistorial.caso.id+" , Gracias."
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
                            to historialAsignado.medico.mail //Email del usuario
                            cc "angelica.gomez.ucab@gmail.com" //
                            subject "Envio de solucion a Triaje" // Asunto del mensaje
                            html    "Notificacion "+contador+": "+trato+" "+historialAsignado.medico.nombre+" "+historialAsignado.medico.apellido+", se le informa que el caso numero "+primerHistorial.caso.id+" fue enviado a Triaje automaticamente con la solucion de la segunda opinion solicitada sin su revison, debido al atraso en su respuesta, Gracias"
                        }
                    }catch(Exception e){
                        println "Error de conexion"
                        e.printStackTrace()
                    }                    
                
                
                    Date date = new Date()
                    
                    it.status = status7                    
                    asignacion.fecha = date
                    asignacion.medico = primerHistorial.medico
                    asignacion.estadoCaso = it.status.nombre
                    asignacion.caso = it
                    asignacion.save()
                    
            }
        }
    }
}