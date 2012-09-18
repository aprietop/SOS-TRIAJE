package opinion

import status.*
import java.sql.Time

class Opinion {

    //ATRIBUTOS
    Status status
    Date fechaOpinion    
    String cuerpoOpinion    
    Time horaOpinion
    //archivo
    //usuarioSolicitante
    //usuarioCreador
    
    //RELACIONES
    static hasMany = [status:Status]
}
