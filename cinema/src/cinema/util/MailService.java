package cinema.util;

import java.util.Properties;
import javax.activation.DataHandler;
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
import org.apache.log4j.Logger;
import cinema.template.mail.IMailTemplate;

public class MailService
{
    private static final Logger logger = Logger.getLogger(MailService.class);
    private static final MailService mailService = new MailService();
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

    public static MailService getInstance()
    {
	return mailService;
    }

    private MailService()
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

    public void send(String toAddresses, IMailTemplate template) throws MessagingException
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
	    logger.error("MessagingException in send(String, IMailTemplate)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String, IMailTemplate)" + ex);
	}
    }
    
    public void send(String[] toAddresses, IMailTemplate template, byte[] attachmentBytes, String attachmentMimeType, String attachmentName) throws MessagingException
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
		    
		    Multipart multipart = new MimeMultipart();
		    BodyPart messageBodyPart = new MimeBodyPart();
		    messageBodyPart.setContent(template.body(), "text/html");
		    multipart.addBodyPart(messageBodyPart);
		    
		    BodyPart messageAttachmentPart = new MimeBodyPart();		    
		    ByteArrayDataSource ds = new ByteArrayDataSource(attachmentBytes, attachmentMimeType); 
		    messageAttachmentPart.setDataHandler(new DataHandler(ds)); 
		    messageAttachmentPart.setFileName(attachmentName);
		    multipart.addBodyPart(messageAttachmentPart);
		    
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
	    logger.error("MessagingException in send(String[], IMailTemplate)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String[], IMailTemplate)" + ex);
	}
    }
    
    public void send(String toAddresses, IMailTemplate template, byte[] attachmentBytes, String attachmentMimeType, String attachmentName) throws MessagingException
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
		    message.setSubject(template.subject());
		    
		    Multipart multipart = new MimeMultipart();
		    BodyPart messageBodyPart = new MimeBodyPart();
		    messageBodyPart.setContent(template.body(), "text/html");
		    multipart.addBodyPart(messageBodyPart);
		    
		    BodyPart messageAttachmentPart = new MimeBodyPart();		    
		    ByteArrayDataSource ds = new ByteArrayDataSource(attachmentBytes, attachmentMimeType); 
		    messageAttachmentPart.setDataHandler(new DataHandler(ds)); 
		    messageAttachmentPart.setFileName(attachmentName);
		    multipart.addBodyPart(messageAttachmentPart);
		    
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
	    logger.error("MessagingException in send(String toAddresses, IMailTemplate template, byte[] attachmentBytes, String attachmentMimeType, String attachmentName)" + me);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in send(String toAddresses, IMailTemplate template, byte[] attachmentBytes, String attachmentMimeType, String attachmentName)" + ex);
	}
    }
}