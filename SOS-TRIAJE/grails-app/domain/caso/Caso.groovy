package caso

import especialidad.*
import status.*
import archivo.*
import java.sql.Time

class Caso {
    //ATRIBUTOS
    Especialidad especialidad //viene de SOS-HME
    String descripcion
    Date fechaCreacion
    String datosDelPaciente
    Date fechaRespuesta
    Time horaRespuesta
    String cuerpoRespuesta
    //archivo
    
    //RELACIONES
    static hasMany = [status:Status, archivos:Archivo]

}
