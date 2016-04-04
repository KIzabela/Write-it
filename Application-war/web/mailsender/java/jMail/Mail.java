
package jMail;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
/**
 *
 * @author iza
 */
public class Mail {
    
    private String to;
private String messagee;


    
    public String getTo() {
        return to;
    }

   
    public void setTo(String to) {
        this.to = to;
    }

    
   


    
    public String getMessage() {
        return messagee;
    }

    
    public void setMessage(String message) {
        this.messagee = message;
    }

   
    
    public int sendMail(){
           final String username = "writeit.application@gmail.com";
		final String password = "***";
		
		Properties props = new Properties();
		
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
              protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(username, password);
              }
            });
                
 session.setDebug(true);
	   
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));
			message.setSubject("Przypomnienie o jutrzejszym wydarzeniu");
			message.setText(messagee);

			Transport.send(message);

		} catch (MessagingException e) {
                    
			throw new RuntimeException(e);
                        
		}
		
		return 0;
     }
}



