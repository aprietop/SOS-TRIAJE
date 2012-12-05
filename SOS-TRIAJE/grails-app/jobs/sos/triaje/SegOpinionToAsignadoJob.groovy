package sos.triaje

import java.util.Date
import caso.Caso
import caso.HistorialCaso
import status.Status
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import medico.Medico

class SegOpinionToAsignadoJob {
    static triggers = {
      //Se ejecuta cada 1 minuto, el primero empieza en el segundo 2
      simple name:'SegundaOpinionTrigger', startDelay:2000, repeatInterval: 60000//1 minuto
    }

    static int contador = 0
    
    def mailService
    def execute() {

        def status2 = Status.get(2) //Asignado
        def status4 = Status.get(4) //Segunda Opinion
        
        def asignacion = new HistorialCaso()
        
        List casoInstanceList = []
        List histEspAsignado = []
        
        //TODOS LOS CASOS CON ESTADO "SEGUNDA OPINION"
        def casoInstance = Caso.findAllByStatus(status4)
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
            
            def trato
            if(primerHistorial.medico.sexo=="Femenino"){
                trato = "Dra."
            }
            if(primerHistorial.medico.sexo=="Masculino"){
                trato = "Dr."
            }            
     
            //Si no han pasado 2 minutos, envia notificacion de peticion de segunda opinion segun trigger (cada 1 minuto)
            if(minutos <2){ 
                contador = contador+1
           
                try{
                    mailService.sendMail {
                        to primerHistorial.medico.mail //Email del usuario
                        subject "Notificación de solicitud de segunda opinion" // Asunto del mensaje
                        html    "Notificacion "+contador+": "+trato+" "+primerHistorial.medico.nombre+" "+primerHistorial.medico.apellido+", se le recuerda revisar el caso numero "+primerHistorial.caso.id+" que le fue asignado como solicitud de segunda opinion, Gracias."
                    }
                }catch(Exception e){
                    println "Error de conexion"
                    e.printStackTrace()
                } 
                
            }
            //Si han pasado 2 minutos o mas, envia notificacion de devolucion del caso a su especialista asignado
            else{            
                 try{
                    mailService.sendMail {
                        to primerHistorial.medico.mail //Email del usuario
                        cc "angelica.gomez.ucab@gmail.com" //
                        subject "Libaración de solicitud de segunda opinion" // Asunto del mensaje
                        html    "Notificacion "+contador+": "+trato+" "+primerHistorial.medico.nombre+" "+primerHistorial.medico.apellido+", se le informa que el caso numero "+primerHistorial.caso.id+" que le fue asignado como peticion de segunda opinion ha sido devuelto automaticamente a su especialista asignado debido al atraso en su respuesta, Gracias"
                    }
                }catch(Exception e){
                    println "Error de conexion"
                    e.printStackTrace()
                }     

                def historialAsignado

                historialInstance.each{                 
                    if (it.estadoCaso==status2.nombre){
                    histEspAsignado.add(it)
                    }
                }
                    
                historialAsignado = histEspAsignado.first()

                Date date = new Date()

                it.status = status2                    
                asignacion.fecha = date
                asignacion.medico = historialAsignado.medico
                asignacion.estadoCaso = it.status.nombre
                asignacion.caso = it
                asignacion.save()                    
            }
        }
    }
}
