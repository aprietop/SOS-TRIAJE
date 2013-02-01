package observacion

class Observacion {
    String idCasoObservacion
    String observacion
    
    static constraints = {
        idCasoObservacion(nullable: true, blank: false)
        observacion(nullable: true, blank: false, maxSize : 200000)
    }
}
