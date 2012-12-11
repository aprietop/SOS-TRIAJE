
package triaje;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the triaje package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _ServicioPruebaSosHMEResponse_QNAME = new QName("http://triaje/", "servicioPruebaSosHMEResponse");
    private final static QName _ServicioPruebaSosHME_QNAME = new QName("http://triaje/", "servicioPruebaSosHME");
    private final static QName _EnviarCasoSosHme_QNAME = new QName("http://triaje/", "enviarCasoSosHme");
    private final static QName _EnviarCasoSosHmeResponse_QNAME = new QName("http://triaje/", "enviarCasoSosHmeResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: triaje
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ServicioPruebaSosHMEResponse }
     * 
     */
    public ServicioPruebaSosHMEResponse createServicioPruebaSosHMEResponse() {
        return new ServicioPruebaSosHMEResponse();
    }

    /**
     * Create an instance of {@link ServicioPruebaSosHME }
     * 
     */
    public ServicioPruebaSosHME createServicioPruebaSosHME() {
        return new ServicioPruebaSosHME();
    }

    /**
     * Create an instance of {@link EnviarCasoSosHmeResponse }
     * 
     */
    public EnviarCasoSosHmeResponse createEnviarCasoSosHmeResponse() {
        return new EnviarCasoSosHmeResponse();
    }

    /**
     * Create an instance of {@link EnviarCasoSosHme }
     * 
     */
    public EnviarCasoSosHme createEnviarCasoSosHme() {
        return new EnviarCasoSosHme();
    }

    /**
     * Create an instance of {@link PojoCasoResuelto }
     * 
     */
    public PojoCasoResuelto createPojoCasoResuelto() {
        return new PojoCasoResuelto();
    }

    /**
     * Create an instance of {@link PojoMedico }
     * 
     */
    public PojoMedico createPojoMedico() {
        return new PojoMedico();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ServicioPruebaSosHMEResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://triaje/", name = "servicioPruebaSosHMEResponse")
    public JAXBElement<ServicioPruebaSosHMEResponse> createServicioPruebaSosHMEResponse(ServicioPruebaSosHMEResponse value) {
        return new JAXBElement<ServicioPruebaSosHMEResponse>(_ServicioPruebaSosHMEResponse_QNAME, ServicioPruebaSosHMEResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ServicioPruebaSosHME }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://triaje/", name = "servicioPruebaSosHME")
    public JAXBElement<ServicioPruebaSosHME> createServicioPruebaSosHME(ServicioPruebaSosHME value) {
        return new JAXBElement<ServicioPruebaSosHME>(_ServicioPruebaSosHME_QNAME, ServicioPruebaSosHME.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link EnviarCasoSosHme }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://triaje/", name = "enviarCasoSosHme")
    public JAXBElement<EnviarCasoSosHme> createEnviarCasoSosHme(EnviarCasoSosHme value) {
        return new JAXBElement<EnviarCasoSosHme>(_EnviarCasoSosHme_QNAME, EnviarCasoSosHme.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link EnviarCasoSosHmeResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://triaje/", name = "enviarCasoSosHmeResponse")
    public JAXBElement<EnviarCasoSosHmeResponse> createEnviarCasoSosHmeResponse(EnviarCasoSosHmeResponse value) {
        return new JAXBElement<EnviarCasoSosHmeResponse>(_EnviarCasoSosHmeResponse_QNAME, EnviarCasoSosHmeResponse.class, null, value);
    }

}
