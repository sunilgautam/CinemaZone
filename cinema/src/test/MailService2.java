package test;

import java.io.File;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import cinema.template.mail.IMailTemplate;
import cinema.util.Constants;

public class MailService2 implements Constants
{
    private static final Logger logger = Logger.getLogger(MailService2.class);
    private static final MailService2 mailService = new MailService2();
    private static Properties props;
    private boolean invoked;
    private Authenticator auth;
    private Session session;

    public class MailAuthenticator extends javax.mail.Authenticator
    {
	private String username;
	private String password;

	public MailAuthenticator(String username, String password)
	{
	    this.username = username;
	    this.password = password;
	}

	public PasswordAuthentication getPasswordAuthentication()
	{
	    return new PasswordAuthentication(this.username, this.password);
	}
    }

    public static MailService2 getInstance()
    {
	return mailService;
    }

    private MailService2()
    {
	init();
    }

    private void init()
    {
	try
	{
	    if (Constants.MAIL_SERVICE_ACTIVE)
	    {
		props = System.getProperties();
		this.auth = new MailAuthenticator(Constants.MAIL_AUTH_USERNAME, Constants.MAIL_AUTH_PASSWORD);
		props.put("mail.smtp.host", Constants.MAIL_SERVER_HOST_ADDRESS);
		props.put("mail.smtp.port", Constants.MAIL_SERVER_PORT_NUMBER);
		props.put("mail.smtp.auth", "true");
		// props.put("mail.from",
		// Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.protocol", Constants.MAIL_PROTOCOL);
		session = Session.getInstance(props, this.auth);
		this.invoked = true;
	    }
	    else
	    {
		logger.warn("Mail Service not active, unable to initialize <session>.");
	    }
	}
	catch (Exception ex)
	{
	    this.invoked = false;
	    logger.error("Exception in init()" + ex);
	}
    }

    public void send(String[] toAddresses, IMailTemplate template, String fromAddress, String personalName) throws MessagingException
    {
	try
	{
	    if (invoked)
	    {
		if (Constants.MAIL_SERVICE_ACTIVE)
		{
		    Message message = new MimeMessage(this.session);
		    if (fromAddress == null)
		    {
			message.setFrom(new InternetAddress(Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS, Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS_PERSONAL_NAME));
		    }
		    else
		    {
			message.setFrom(new InternetAddress(fromAddress, personalName));
		    }
		    InternetAddress[] toIntAdds = new InternetAddress[toAddresses.length];
		    for (int i = 0; i < toAddresses.length; i++)
		    {
			toIntAdds[i] = new InternetAddress(toAddresses[i]);
		    }

		    message.setRecipients(Message.RecipientType.TO, toIntAdds);
		    message.setSubject(template.subject());
		    message.setContent(template.body(), "text/html");
		    logger.info("Sending message ....");
		    logger.info(message.getContent());
		    Transport.send(message);
		}
		else
		{
		    logger.warn("Mail Service not active, unable to send email.");
		}
	    }
	    else
	    {
		logger.warn("<Session> is not initialized, unable to send email.");
	    }
	}
	catch (MessagingException me)
	{
	    logger.error("MessagingException in send(String[], IMailTemplate, String, String)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String[], IMailTemplate, String, String)" + ex);
	}
    }

    public void send(String toAddresses, IMailTemplate template, String fromAddress, String personalName) throws MessagingException
    {
	try
	{
	    if (invoked)
	    {
		if (Constants.MAIL_SERVICE_ACTIVE)
		{
		    Message message = new MimeMessage(this.session);
		    if (fromAddress == null)
		    {
			message.setFrom(new InternetAddress(Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS, Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS_PERSONAL_NAME));
		    }
		    else
		    {
			message.setFrom(new InternetAddress(fromAddress, personalName));
		    }

		    message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddresses));
		    message.setSubject(template.subject());
		    message.setContent(template.body(), "text/html");
		    logger.info("Sending message ....");
		    logger.info(message.getContent());
		    Transport.send(message);
		}
		else
		{
		    logger.warn("Mail Service not active, unable to send email.");
		}
	    }
	    else
	    {
		logger.warn("<Session> is not initialized, unable to send email.");
	    }
	}
	catch (MessagingException me)
	{
	    logger.error("MessagingException in send(String, IMailTemplate, String, String)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String, IMailTemplate, String, String)" + ex);
	}
    }

    public void send(String[] toAddresses, IMailTemplate template) throws MessagingException
    {
	try
	{
	    if (invoked)
	    {
		if (Constants.MAIL_SERVICE_ACTIVE)
		{
		    Message message = new MimeMessage(this.session);
		    message.setFrom(new InternetAddress(Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS, Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS_PERSONAL_NAME));
		    InternetAddress[] toIntAdds = new InternetAddress[toAddresses.length];
		    for (int i = 0; i < toAddresses.length; i++)
		    {
			toIntAdds[i] = new InternetAddress(toAddresses[i]);
		    }

		    message.setRecipients(Message.RecipientType.TO, toIntAdds);
		    message.setSubject(template.subject());
		    message.setContent(template.body(), "text/html");
		    logger.info("Sending message ....");
		    logger.info(message.getContent());
		    Transport.send(message);
		}
		else
		{
		    logger.warn("Mail Service not active, unable to send email.");
		}
	    }
	    else
	    {
		logger.warn("<Session> is not initialized, unable to send email.");
	    }
	}
	catch (MessagingException me)
	{
	    logger.error("MessagingException in send(String[], IMailTemplate)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String[], IMailTemplate)" + ex);
	}
    }

    public void send(String toAddresses) throws MessagingException
    {
	try
	{
	    if (invoked)
	    {
		if (Constants.MAIL_SERVICE_ACTIVE)
		{
		    Message message = new MimeMessage(this.session);
		    message.setFrom(new InternetAddress(Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS, Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS_PERSONAL_NAME));

		    message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddresses));
		    message.setSubject("TESTING");
		    // Create the message part 
		    BodyPart messageBodyPart = new MimeBodyPart();

		    // Fill the message
		    //messageBodyPart.setText("TESTING BODY ATT ... TESTING BODY ATT ... TESTING BODY ATT ...");
		    messageBodyPart.setContent("TESTING BODY ATT ... TESTING BODY ATT ... TESTING BODY ATT ...", "text/html");
		         
		    // Create a multipar message
		    Multipart multipart = new MimeMultipart();

		    // Set text message part
		    multipart.addBodyPart(messageBodyPart);

		    // Part two is attachment
		    messageBodyPart = new MimeBodyPart();
		    String filename = "C:/001.pdf";
//		    DataSource source = new FileDataSource(filename);
//		    messageBodyPart.setDataHandler(new DataHandler(source));
//		    messageBodyPart.setFileName(filename);
		    
		    ByteArrayDataSource ds = new ByteArrayDataSource(FileUtils.readFileToByteArray(new File(filename)), "application/pdf"); 
		    messageBodyPart.setDataHandler(new DataHandler(ds)); 
		    messageBodyPart.setFileName("REPORTS.pdf");
		    
		    multipart.addBodyPart(messageBodyPart);
		    //message.setContent("TESTING BODY ... TESTING BODY ... TESTING BODY ...", "text/html");
		    message.setContent(multipart);
		    logger.info("Sending message ....");
		    logger.info(message.getContent());
		    Transport.send(message);
		}
		else
		{
		    logger.warn("Mail Service not active, unable to send email.");
		}
	    }
	    else
	    {
		logger.warn("<Session> is not initialized, unable to send email.");
	    }
	}
	catch (MessagingException me)
	{
	    logger.error("MessagingException in send(String, IMailTemplate)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String, IMailTemplate)" + ex);
	}
    }
    
    public void send(String toAddresses, byte[] fileBytes, String mimeType) throws MessagingException
    {
	try
	{
	    if (invoked)
	    {
		if (Constants.MAIL_SERVICE_ACTIVE)
		{
		    Message message = new MimeMessage(this.session);
		    message.setFrom(new InternetAddress(Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS, Constants.MAIL_DEFAULT_FROM_EMAIL_ADDRESS_PERSONAL_NAME));

		    message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddresses));
		    message.setSubject("TESTING");
		    // Create the message part 
		    BodyPart messageBodyPart = new MimeBodyPart();

		    // Fill the message
		    //messageBodyPart.setText("TESTING BODY ATT ... TESTING BODY ATT ... TESTING BODY ATT ...");
		    messageBodyPart.setContent("TESTING BODY ATT1 ... TESTING BODY ATT1 ... TESTING BODY ATT1 ...", "text/html");
		         
		    // Create a multipar message
		    Multipart multipart = new MimeMultipart();

		    // Set text message part
		    multipart.addBodyPart(messageBodyPart);

		    // Part two is attachment
		    messageBodyPart = new MimeBodyPart();
		    String filename = "C:/001.pdf";
//		    DataSource source = new FileDataSource(filename);
//		    messageBodyPart.setDataHandler(new DataHandler(source));
//		    messageBodyPart.setFileName(filename);
		    
		    ByteArrayDataSource ds = new ByteArrayDataSource(fileBytes, mimeType); 
		    messageBodyPart.setDataHandler(new DataHandler(ds)); 
		    messageBodyPart.setFileName("TICKET.pdf");
		    
		    multipart.addBodyPart(messageBodyPart);
		    //message.setContent("TESTING BODY ... TESTING BODY ... TESTING BODY ...", "text/html");
		    message.setContent(multipart);
		    logger.info("Sending message ....");
		    logger.info(message.getContent());
		    Transport.send(message);
		}
		else
		{
		    logger.warn("Mail Service not active, unable to send email.");
		}
	    }
	    else
	    {
		logger.warn("<Session> is not initialized, unable to send email.");
	    }
	}
	catch (MessagingException me)
	{
	    logger.error("MessagingException in send(String, IMailTemplate)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String, IMailTemplate)" + ex);
	}
    }
}