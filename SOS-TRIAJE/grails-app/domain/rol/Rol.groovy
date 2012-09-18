package rol

class Rol {
    
    static String TRIAJE            = 'triaje'
    static String ADMINISTRADOR     = 'administador'
    static String ESPECIALISTA      = 'especialista'
    
        static List getRoleCodes()
    {
    	return [TRIAJE, ADMINISTRADOR, ESPECIALISTA]
    }
    /*
    static constraints = {
    } */
}
