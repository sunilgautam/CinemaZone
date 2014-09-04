package cinema.template.mail;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.ServletContext;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.MovieInfo;
import cinema.util.CommonMethod;

public class GeneratedTicket implements IMailTemplate
{
    private static final SimpleDateFormat dateFormate = new SimpleDateFormat("EEEE dd/MM/yyyy");
    private StringBuilder content;
    private String subject;
    private ServletContext context;
    private ResourceBundle resource;
    private Booking booking;
    private MovieInfo movieInfo;

    public GeneratedTicket(ServletContext context, ResourceBundle resource, Booking booking, MovieInfo movieInfo)
    {
	this.resource = resource;
	this.booking = booking;
	this.movieInfo = movieInfo;
	this.context = context;
	init();
    }

    public void init()
    {
	content = new StringBuilder();
	content.append("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
	content.append("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"left\">");
	content.append("<tr>");
	content.append("<td>");
	content.append("<table width=\"670px\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"left\" style=\"\">");
	content.append("<tr>");
	content.append("<td>");
	content.append("<img width=\"205\" height=\"100\" border=\"0\" alt=\"\" src=\"");
	content.append(this.context.getInitParameter("domain"));
	content.append("images/logo.png\" />");
	content.append("</td>");
	content.append("<td>");
	content.append("</td>");
	content.append("</tr>");
	content.append("</table>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td>");
	content.append("<table width=\"670px\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"left\" style=\"border: solid 1px #dcdcdc;\">");
	content.append("<tr>");
	content.append("<td colspan=\"2\" style=\"padding: 5px; background-color: #EFEFEF; border-bottom: solid 1px #dcdcdc;\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(resource.getString("booking.ticket.ticket"));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.ticket.transcode"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(booking.getTransaction().getCode());
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.selection.movie"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(movieInfo.getMovieName() + "&nbsp;" + movieInfo.getCbRating());
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.selection.seats"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(String.valueOf(booking.getNoOfSeats()));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.selection.show"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(dateFormate.format(CommonMethod.customeStringToUtilDate(booking.getSchedule().getDate(), "yyyy-MM-dd")));
	content.append("&nbsp;&nbsp;&nbsp;&nbsp;");
	content.append(booking.getSchedule().getScheduleTime());
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.selection.screen"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(booking.getSchedule().getScreenName());
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.selection.class"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(booking.getSeatType().getSeatType() + " - " + getSeatNames(booking.getSeats()));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.total.tickets"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(String.valueOf(booking.getTransaction().getAmount()));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.total.conv"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:12px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(String.valueOf(booking.getTransaction().getConvenienceFees()));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("<tr>");
	content.append("<td width=\"30%\">");
	content.append("<label style=\"font-size:13px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222; margin-left: 10px;\">");
	content.append(resource.getString("booking.details.total.grand"));
	content.append("</label>");
	content.append("</td>");
	content.append("<td>");
	content.append("<label style=\"font-size:13px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(String.valueOf(booking.getTransaction().getGrandTotal()));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("</table>");
	content.append("</td>");
	content.append("</tr>");
	
	content.append("<tr>");
	content.append("<td>");
	content.append("<label style=\"font-size:8px; font-weight:bold; display:block; line-height:25px; letter-spacing: normal; word-spacing: normal; text-transform: none; direction: ltr; color:#222222;\">");
	content.append(resource.getString("booking.ticket.notice"));
	content.append("</label>");
	content.append("</td>");
	content.append("</tr>");
	content.append("</table>");
	content.append("<img alt=\"\" src=\"http://localhost:3500/cinema/mailnotification.action?id=000&action=clicks\" height=\"0px\" width=\"0px\" />");
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
	return this.content.toString();
    }

    public String subject()
    {
	return this.subject;
    }

    @Override
    public String toString()
    {
	return this.content.toString();
    }
    
    public String getSeatNames(List<String> seats)
    {
	String seatNames = "";
	for(String item : seats)
	{
	    seatNames += "[" + item.replace(':', '-') + "]";
	}
	return seatNames;
    }

    public ServletContext getContext()
    {
        return context;
    }

    public void setContext(ServletContext context)
    {
        this.context = context;
    }
}
