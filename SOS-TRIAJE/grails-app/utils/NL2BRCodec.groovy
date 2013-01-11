/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.security.MessageDigest
import sun.misc.BASE64Encoder
import sun.misc.CharacterEncoder
/**
 *
 * @author Angelica Gomez
 */
class NL2BRCodec {
        
        static encode = { string ->
           string.trim().replaceAll("\n","<br>")
        }
}

