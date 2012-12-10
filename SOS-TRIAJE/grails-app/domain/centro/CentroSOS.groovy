package centro

class CentroSOS {

//ATRIBUTOS
    String nombre
    String url
    String uuid

////CONSTRAINTS    
    static constraints = {
        nombre(nullable: false, blank:false)
        url(nullable: false, blank:false)
        uuid(nullable: true, blank:true)  
    }

    transient beforeInsert = {
        uuid = java.util.UUID.randomUUID().toString()
    }
}
