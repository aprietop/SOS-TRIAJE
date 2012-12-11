package triaje;

import javax.jws.WebMethod;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.6.2
 * 2012-12-11T15:00:08.457-04:30
 * Generated source version: 2.6.2
 * 
 */
@WebService(targetNamespace = "http://triaje/", name = "SosTriajeServicePortType")
@XmlSeeAlso({ObjectFactory.class})
public interface SosTriajeServicePortType {

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "servicioPruebaSosHME", targetNamespace = "http://triaje/", className = "triaje.ServicioPruebaSosHME")
    @WebMethod
    @ResponseWrapper(localName = "servicioPruebaSosHMEResponse", targetNamespace = "http://triaje/", className = "triaje.ServicioPruebaSosHMEResponse")
    public java.lang.String servicioPruebaSosHME();

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "enviarCasoSosHme", targetNamespace = "http://triaje/", className = "triaje.EnviarCasoSosHme")
    @WebMethod
    @ResponseWrapper(localName = "enviarCasoSosHmeResponse", targetNamespace = "http://triaje/", className = "triaje.EnviarCasoSosHmeResponse")
    public triaje.PojoCasoResuelto enviarCasoSosHme();
}
