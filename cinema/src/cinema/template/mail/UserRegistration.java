package cinema.template.mail;

public class UserRegistration implements IMailTemplate
{
    private StringBuilder content;
    private String subject;
    private String userName;

    public UserRegistration()
    {
	init();
    }

    public void init()
    {
	content = new StringBuilder();
	content.append("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
	content.append("<table width=\"561\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">");
	content.append("<tr><td><a href=\"http://localhost:3500/cinema/home.action?id=000&action=clicks\"><img width=\"205\" height=\"100\" border=\"0\" alt=\"\" src=\"http://localhost:3500/cinema/images/logo.png\" /></a></td></tr>");
	content.append("<tr><td valign=\"top\" bgcolor=\"#FFFFFF\">");
	content.append("<table width=\"500\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family:Arial, Geneva, sans-serif; line-height:21px; font-size:13px;\">");
	content.append("<tr><td valign=\"top\">");
	content.append("<br /> Dear ${user_name}, <br /> <h2 style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 25px;\"><font face=\"Tahoma, Arial, Helvetica, sans-serif\"><span style=\"font-size: 12px;\">CinemaZone</span></font></h2>");
	content.append("<div><ol style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.917969); margin-top: 13px; margin-right: 0px; margin-bottom: 12px; margin-left: 25px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">");
	content.append("<li style=\"margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 6px; font-size: 12px; \"><font face=\"trebuchet ms, sans-serif\">Thank you for subscribing to CinemaZone</font></li>");
	content.append("<li style=\"margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 6px; font-size: 12px; \"><font face=\"trebuchet ms, sans-serif\">Wishing you a wonderful experience using CinemaZone</font></li>");
	// content.append("<li style=\"margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 6px; font-size: 12px; \"><font face=\"trebuchet ms, sans-serif\">????</font></li>");
	content.append("</ol></div>");
	content.append("</td></tr>");
	content.append("</table>");
	content.append("</td></tr>");
	content.append("<tr><td bgcolor=\"#FFFFFF\">&nbsp;</td></tr>");
	content.append("</table>");
	content.append("<table width=\"480\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"padding: 0px; color: rgb(153, 153, 153); font-size: 10px; line-height: 1.5em; border:1px solid #fff; \">");
	content.append("<tr><td style=\"padding: 5px 0px;\"> You have received this mail because you registerd with CinemaZone.<br /> </td></tr>");
	content.append("</table>");
	content.append("<img alt=\"\" src=\"http://localhost:3500/cinema/mailnotification.action?id=000&action=clicks\" height=\"0px\" width=\"0px\" />");
    }

    public String getUserName()
    {
	return userName;
    }

    public void setUserName(String userName)
    {
	this.userName = userName;
    }

    public String getSubject()
    {
	return subject;
    }

    public void setSubject(String subject)
    {
	this.subject = subject;
    }

    public String body()
    {
	return this.content.toString().replace("${user_name}", this.userName);
    }

    public String subject()
    {
	return this.subject;
    }

    @Override
    public String toString()
    {
	return this.content.toString().replace("${user_name}", this.userName);
    }
}