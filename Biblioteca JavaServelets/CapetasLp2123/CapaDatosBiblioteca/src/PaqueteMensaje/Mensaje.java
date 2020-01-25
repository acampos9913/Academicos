/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package PaqueteMensaje;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class Mensaje {
    
    String usuarioCorreo;
    String password;
    
    String rutaArchivo;
    String nombreArchivo;
    
    String destinatario;
    String asunto;
    String mensaje;
    
    public Mensaje(String usuarioCorreo, String password, String rutaArchivo, String nombreArchivo, String destinatario, String asunto,String mensaje) {
        this.usuarioCorreo = usuarioCorreo;
        this.password = password;
        this.rutaArchivo = rutaArchivo;
        this.nombreArchivo = nombreArchivo;
        this.destinatario = destinatario;
        this.asunto = asunto;
        this.mensaje = mensaje;
    }
    
    public Mensaje(String usuarioCorre,String password,String destinatario,String mensaje){
        this(usuarioCorre,password,"","",destinatario,"",mensaje);
    }
    
    public Mensaje(String usuarioCorre,String password,String destinatario,String asunto,String mensaje){
        this(usuarioCorre,password,"","",destinatario,asunto,mensaje);
    }    

    public boolean sendMail(){
        try
        {
            Properties props = new Properties();
            //tipo de envio + nombre del servidor
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            //puerto
            props.setProperty("mail.smtp.port", "587");     
            props.setProperty("mail.smtp.user", usuarioCorreo);
            props.setProperty("mail.smtp.auth", "true");

            Session session = Session.getDefaultInstance(props, null);
            //para enviar mensaje
            BodyPart texto = new MimeBodyPart();
            texto.setText(mensaje);
            //adjuntar el archivo
            BodyPart adjunto = new MimeBodyPart();
            if (!rutaArchivo.equals("")){
                 adjunto.setDataHandler(
                         //direccion donde saca el archivo
                    new DataHandler(new FileDataSource(rutaArchivo)));
                adjunto.setFileName(nombreArchivo);                
            }
            
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            //el archivo se sube en partes
            if (!rutaArchivo.equals("")){
                multiParte.addBodyPart(adjunto);
            }

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuarioCorreo));
            message.addRecipient(
                Message.RecipientType.TO,
                new InternetAddress(destinatario));
                message.setSubject(asunto);
                //el archivo particionano se agrega al mensaje en uno solo 
            message.setContent(multiParte);
            
           //se conecta primero tipo de conexion smtp
            Transport t = session.getTransport("smtp");
            t.connect(usuarioCorreo, password);
             //envia el mensaje  al correo del usuario
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }        
    }
    
    /*public static void main(String[] args){
        String clave = "vjwoweojfhiwyoka"; 
        Email e = new Email("isaacsanlegas@gmail.com",clave,"C:\\uno.jpg","adjunto.jpg","sanlegas@yopmail.com","Adjunto","Prueba del tutorial para mandar un email");
        if (e.sendMail()){
            JOptionPane.showMessageDialog(null,"El email se mandó correctamente");
        }else{
            JOptionPane.showMessageDialog(null,"El email no se mandó correctamente");
        }
    }*/

}
