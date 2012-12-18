import java.util.Date
import caso.Caso
import caso.HistorialCaso

import especialidad.Especialidad

import medico.Especialista
import medico.Medico
import medico.Triaje

import opinion.Opinion

import persona.Persona
import persona.Administrador
import persona.Paciente
import persona.ActorSistema

import status.Status
import centro.CentroSOS

class BootStrap {

    def init = { servletContext ->

        println ""
        println "=========== ++++++++++++++++++++ ==========="
        println "=========== BOOTSTRAP SOS-TRIAJE ==========="
        println "=========== ++++++++++++++++++++ ===========" 
        
        environments {
        cargarData{

/************************** DATA INICIAL SOS-TRIAJE ****************************/   
        println ""
        println "=========== ++++++++++++++++++++ ==========="
        println "===========     CARGA DE DATA    ==========="
        println "=========== ++++++++++++++++++++ ==========="
        println ""    
        
/*************************** ADMINISTRADOR SOS-TRIAJE *************************/      
//      
        def administrador = new Administrador()
            administrador.nombre = "Carlos"
            administrador.apellido = "Torrealba"
            administrador.cedula = 20768657
            administrador.sexo = "Masculino"
            administrador.nacionalidad = ""
            administrador.rol = "Administrador"
            administrador.mail = "angel_428_m@hotmail.com"
            administrador.login = "admin"
            administrador.password = "admin1"
            administrador.mail = ""
            if (!administrador.save()) println administrador.errors 

/****************************** TRIAJE SOS-TRIAJE *****************************/   
//
        def triaje1 = new Triaje()
            triaje1.nombre = "Angelica"
            triaje1.apellido = "Gomez"
            triaje1.cedula = 19768657
            triaje1.sexo = "Femenino"
            triaje1.nacionalidad = "Venezolana"            
            triaje1.rol = "Triaje"
            triaje1.mail = "angelica.gomez.ucab@gmail.com"
            triaje1.login = "angiita"
            triaje1.password = "angiita1"
            triaje1.numColegioMedico = 234
            if (!triaje1.save()) println triaje1.errors     
       
        def triaje2 = new Triaje()
            triaje2.nombre = "Marcos"
            triaje2.apellido = "Perez"
            triaje2.cedula = 31454676
            triaje2.sexo = "Masculino"
            triaje2.rol = "Triaje"
            triaje2.mail = "luiscarlos_toto@hotmail.com"            
            triaje2.login = "marcos"
            triaje2.password = "marcos1"
            triaje1.mail = "luiscarlos_toto@hotmail.com"
            triaje2.numMinisterioSalud = 5667
            if (!triaje2.save()) println triaje2.errors      

/************************** ESPECIALIDAD SOS-TRIAJE ***************************/     
//
        def especialidad1 = new Especialidad()
            especialidad1.nombre = "Oftalmologia"
            especialidad1.descripcion = "se encarga del tratamiento de las enfermedades de los ojos"
            if (!especialidad1.save()) println especialidad1.errors 
            
        def especialidad2 = new Especialidad()
            especialidad2.nombre = "Dermatologia"
            especialidad2.descripcion = "se encarga del estudio de la estructura y función de la piel"
            if (!especialidad2.save()) println especialidad2.errors 
            
        def especialidad3 = new Especialidad()
            especialidad3.nombre = "Odontologia"
            especialidad3.descripcion = "se encarga del diagnóstico, tratamiento y prevención de las enfermedades del aparato estomatognático"        
            if (!especialidad3.save()) println especialidad3.errors

/************************** ESPECIALISTA SOS-TRIAJE ***************************/        
//
        def especialista1 = new Especialista()
            especialista1.nombre = "Karla"
            especialista1.apellido = "Ruiz"
            especialista1.cedula = 34546761
            especialista1.sexo = "Femenino"
            especialista1.nacionalidad = "Venezolana"
            especialista1.rol = "Especialista"
            especialista1.mail = "angelica.gomez@outlook.com"
            especialista1.login = "karlita"
            especialista1.password = "karlita1"
            especialista1.numColegioMedico = 23412
            especialista1.addToEspecialidades(especialidad1)
            especialista1.addToEspecialidades(especialidad2)
            if (!especialista1.save()) println especialista1.errors           
        
        def especialista2 = new Especialista()
            especialista2.nombre = "Ana Maria"
            especialista2.apellido = "Chacon"
            especialista2.cedula = 24546762
            especialista2.sexo = "Femenino"
            especialista2.rol = "Especialista"
            especialista2.login = "maria"
            especialista2.password = "maria1"
            especialista2.addToEspecialidades(especialidad3)
            if (!especialista2.save()) println especialista2.errors

        def especialista3 = new Especialista()
            especialista3.nombre = "Pedro"
            especialista3.apellido = "Perez"
            especialista3.cedula = 21768657
            especialista3.sexo = "Masculino"
            especialista3.nacionalidad = "Venezolano"
            especialista3.mail = "angelthebest@gmail.com"
            especialista3.rol = "Especialista"
            especialista3.login = "pedro"
            especialista3.password = "pedro1"
            especialista3.addToEspecialidades(especialidad2)
            if (!especialista3.save()) println especialista3.errors       
            
/**************************** PACIENTE SOS-TRIAJE *****************************/        
//        
       def paciente1 = new Paciente()
            paciente1.nombre = "Prieto"
            paciente1.apellido = "Prieto"
            paciente1.cedula = 23768657
            paciente1.sexo = "Masculino"
            paciente1.nacionalidad = "Venezolano"
            paciente1.fechaNacimiento = new Date(96, 10, 23)
            if (!paciente1.save()) println paciente1.errors  
            
        def paciente2 = new Paciente()
            paciente2.nombre = "Nancy"
            paciente2.apellido = "Urbina"
            paciente2.cedula = 45454676
            paciente2.sexo = "Femenino"
            paciente2.nacionalidad = "Venezolana"
            paciente2.fechaNacimiento = new Date(86, 10, 23)            
            if (!paciente2.save()) println paciente2.errors  

        def paciente3 = new Paciente()
            paciente3.nombre = "Fedra"
            paciente3.apellido = "Lopez"
            paciente3.cedula = 17454676
            paciente3.sexo = "Femenino"
            paciente3.fechaNacimiento = new Date(86, 9, 13)            
            if (!paciente3.save()) println paciente3.errors  

        def paciente4 = new Paciente()
            paciente4.nombre = "Fermin"
            paciente4.apellido = "Toro"
            paciente4.cedula = 15454676
            paciente4.sexo = "Masculino"
            paciente4.fechaNacimiento = new Date(67, 11, 17)            
            if (!paciente4.save()) println paciente4.errors         

/****************************** STATUS SOS-TRIAJE *****************************/        
//  
        def status1 = new Status()
            status1.nombre = "En espera"
            status1.decripcion = "Indica que el caso se encuentra en espera de asignacion y/o resolución"
            if (!status1.save()) println status1.errors  

        def status2 = new Status()
            status2.nombre = "Asignado"
            status2.decripcion = "Indica que el caso ha sido asignado a un especialista"
            if (!status2.save()) println status2.errors    

        def status3 = new Status()
            status3.nombre = "En proceso 1er nivel"
            status3.decripcion = "Indica que el caso fue aceptado por el especialista para su soluciónespecialista"
            if (!status3.save()) println status3.errors   

        def status4 = new Status()
            status4.nombre = "Segunda opinion"
            status4.decripcion = "Indica que el especialista solicitó una segunda opinion"
            if (!status4.save()) println status4.errors  
      
        def status5 = new Status()
            status5.nombre = "En proceso 2do nivel"
            status5.decripcion = "Indica que la solicitud de segunda opinion ha sido aceptada para responder"
            if (!status5.save()) println status5.errors  

        def status6 = new Status()
            status6.nombre = "Resuelto 2do nivel"
            status6.decripcion = "Indica que la segunda opinion fue resuelta"
            if (!status6.save()) println status6.errors  
            
        def status7 = new Status()
            status7.nombre = "Resuelto 1er nivel"
            status7.decripcion = "Indica que el caso ha sido resuelto"
            if (!status7.save()) println status7.errors   

        def status8 = new Status()
            status8.nombre = "Cerrado"
            status8.decripcion = "Indica que el caso ha sido cerrado y se enviara respuesta a HME"
            if (!status8.save()) println status8.errors  

        def status9 = new Status()
            status9.nombre = "Reasignado"
            status9.decripcion = "Indica que el caso ha sido reasignado por limite de tiempo en espera"
            if (!status9.save()) println status9.errors  
            
        def status10 = new Status()
            status10.nombre = "Rechazado 1er nivel"
            status10.decripcion = "Indica que ha sido rechazada la asignacion del caso"
            if (!status10.save()) println status10.errors  

        def status11 = new Status()
            status11.nombre = "Rechazado 2do nivel"
            status11.decripcion = "Indica que ha sido rechazada la solicitud de segunda opinion"
            if (!status11.save()) println status11.errors  
            
//**************************** CENTROS SOS-TRIAJE ****************************/
//
        def centro1 = new CentroSOS()
        centro1.nombre = "Ambulatorio prueba SOS"
        centro1.url = "www.ambulatorio.sos.com"
        if (!centro1.save()) println centro1.errors 
        
/****************************** CASOS SOS-TRIAJE ******************************/
//
        def caso1 = new Caso()
            caso1.descripcion = "Caso prueba 1"
            caso1.fechaInicio = new Date(112, 2, 3)
            caso1.paciente = paciente1
            caso1.status = status7
            caso1.centro = centro1
            if (!caso1.save()) println caso1.errors
                    
        def caso2 = new Caso()
            caso2.descripcion = "Caso prueba 2"
            caso2.fechaInicio = new Date(112, 3, 3)
            caso2.paciente = paciente2
            caso2.status = status1
            caso2.centro = centro1
            if (!caso2.save()) println caso2.errors

        def caso3 = new Caso()
            caso3.descripcion = "Caso prueba 3"
            caso3.fechaInicio = new Date(112, 4, 13)
            caso3.paciente = paciente3
            caso3.status = status7
            caso3.centro = centro1
            if (!caso3.save()) println caso3.errors
            
        def caso4 = new Caso()
            caso4.descripcion = "Caso prueba 4"
            caso4.fechaInicio = new Date(112, 7, 19)
            caso4.paciente = paciente4
            caso4.status = status1
            caso4.addToEspecialidades(especialidad2)
            caso4.centro = centro1
            if (!caso4.save()) println caso4.errors
                
        def caso5 = new Caso()
            caso5.descripcion = "Caso prueba 5"
            caso5.fechaInicio = new Date(112, 06, 25)
            caso5.paciente = paciente1
            caso5.status = status1
            caso5.centro = centro1
            if (!caso5.save()) println caso5.errors

        def caso6 = new Caso()
            caso6.descripcion = "Caso prueba 6"
            caso6.fechaInicio = new Date(112, 05, 22)
            caso6.paciente = paciente2
            caso6.status = status1
            caso6.centro = centro1
            if (!caso6.save()) println caso6.errors

/************************** HISTORIAL CASO SOS-TRIAJE *************************/
//        
        def historialCaso1 = new HistorialCaso()
            historialCaso1.fecha = new Date(112, 5, 22)
            historialCaso1.estadoCaso = "Asignado"
            historialCaso1.medico = especialista2
            historialCaso1.caso = caso1
            if (!historialCaso1.save()) println historialCaso1.errors
        
        def historialCaso2 = new HistorialCaso()
            historialCaso2.fecha = new Date(112, 5, 23)
            historialCaso2.estadoCaso = "En proceso 1er nivel"
            historialCaso2.medico = especialista2
            historialCaso2.caso = caso1
            if (!historialCaso2.save()) println historialCaso2.errors
            
        def historialCaso3 = new HistorialCaso()
            historialCaso3.fecha = new Date(112, 5, 27)
            historialCaso3.estadoCaso = "Resuelto 1er nivel"
            historialCaso3.medico = especialista2
            historialCaso3.caso = caso1        
            if (!historialCaso3.save()) println historialCaso3.errors
            
        def historialCaso4 = new HistorialCaso()
            historialCaso4.fecha = new Date(112, 10, 21)
            historialCaso4.estadoCaso = "Asignado"
            historialCaso4.medico = triaje1
            historialCaso4.caso = caso3
            if (!historialCaso4.save()) println historialCaso4.errors
            
        def historialCaso5 = new HistorialCaso()
            historialCaso5.fecha = new Date(112, 10, 22)
            historialCaso5.estadoCaso = "En proceso 1er nivel"
            historialCaso5.medico = triaje1
            historialCaso5.caso = caso3         
            if (!historialCaso5.save()) println historialCaso5.errors
            
        def historialCaso6 = new HistorialCaso()
            historialCaso6.fecha = new Date(112, 10, 22)
            historialCaso6.estadoCaso = "Segunda opinion"
            historialCaso6.medico = especialista3
            historialCaso6.caso = caso3
            if (!historialCaso6.save()) println historialCaso6.errors
            
        def historialCaso7 = new HistorialCaso()
            historialCaso7.fecha = new Date(112, 10, 26)
            historialCaso7.estadoCaso = "Resuelto 2do nivel"
            historialCaso7.medico = especialista3
            historialCaso7.caso = caso3         
            if (!historialCaso7.save()) println historialCaso7.errors    
            
        def historialCaso8 = new HistorialCaso()
            historialCaso8.fecha = new Date(112, 10, 27)
            historialCaso8.estadoCaso = "Resuelto 1er nivel"
            historialCaso8.medico = triaje1
            historialCaso8.caso = caso3         
            if (!historialCaso8.save()) println historialCaso8.errors  
        
/**************************** OPINIONES SOS-TRIAJE ****************************/
//           
        def opinion1 = new Opinion()
            opinion1.nombreOpinion = "Opinion 1 caso 1"
            opinion1.cuerpoOpinion = "Se resuleve el caso, diagnosticando gripe comun"
            opinion1.medico = especialista2
            opinion1.fechaOpinion = new Date(112, 5, 27)
            opinion1.caso = caso1
            if (!opinion1.save()) println opinion1.errors 
            
        def opinion2 = new Opinion()
            opinion2.nombreOpinion = "Opinion 1 caso 3"
            opinion2.cuerpoOpinion = "Se diagnostica pulmonia, se solicita segunda opinion"
            opinion2.medico = triaje1
            opinion2.fechaOpinion = new Date(112, 10, 22)
            opinion2.caso = caso3     
            if (!opinion2.save()) println opinion2.errors 
            
        def opinion3 = new Opinion()
            opinion3.nombreOpinion = "Opinion 2 caso 3"
            opinion3.cuerpoOpinion = "Se confirma diagnostico de pulmonia"
            opinion3.medico = especialista3
            opinion3.fechaOpinion = new Date(112, 10, 26)
            opinion3.caso = caso3            
            if (!opinion3.save()) println opinion3.errors 
            
        def opinion4 = new Opinion()
            opinion4.nombreOpinion = "Opinion 3 caso 3"
            opinion4.cuerpoOpinion = "Se diagnostica pulmonia"
            opinion4.medico = triaje1
            opinion4.fechaOpinion = new Date(112, 10, 27)
            opinion4.caso = caso3         
            if (!opinion4.save()) println opinion4.errors          
          
        
////////////////////////////////////////////////////////////////////////////////                
           
        println ""
        println "=========== ++++++++++++++++++++ ==========="
        println "=========== FIN DE CARGA DE DATA ==========="
        println "=========== ++++++++++++++++++++ ==========="
        
        }
        }   

        println ""
        println "========= ++++++++++++++++++++++++ ========="
        println "========= FIN BOOTSTRAP SOS-TRIAJE ========="
        println "========= ++++++++++++++++++++++++ =========" 

    }
    
    def destroy = {
    }
}