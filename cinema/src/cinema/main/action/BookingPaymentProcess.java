package cinema.main.action;

import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.UUID;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.MovieInfo;
import cinema.template.mail.GeneratedTicket;
import cinema.util.CommonMethod;
import cinema.util.Constants;
import cinema.util.GeneratePDFTicket;
import cinema.util.MailService;

public class BookingPaymentProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPaymentProcess.class);
    
    private Booking booking;
    private MovieInfo movieInfo;
    private boolean successFlag;
    
    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingPaymentProcess.class + "]");
	this.setSuccessFlag(false);
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    this.booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
	    
	    if (this.booking != null && BookingManager.isSecureTransKeyActive(booking) && this.booking.getNoOfSeats() > 0)
	    {
		BookingManager.detachSecureTransKey(booking);
		try
		{
		    DBAccess dbObj = new DBAccess();
		    this.booking = dbObj.doTransaction(booking, getServletRequestObject().getSession(false).getId());
		    if (this.booking.getUserId().equals("0"))
		    {
			// TRANSACTION FAILED
			this.setSuccessFlag(false);
		    }
		    else
		    {
			// TRANSACTION SUCCESSFULL
			try
			{
			    setMovieInfo(dbObj);
			    GeneratedTicket template = new GeneratedTicket(getServletContextObject(), this.getTexts("MessageResource"), this.booking, movieInfo);
			    template.setSubject(Constants.MAIL_SUBJECT_TICKET);
			    try
			    {
				GeneratePDFTicket pdfTemplate = new GeneratePDFTicket();
				ByteArrayOutputStream pdfByteArr = pdfTemplate.generatePDFTicketDocumentBytes(getServletContextObject(), this.getTexts("MessageResource"), this.booking, movieInfo);
				// SEND MAIL WITH ATTACHMENT
				System.out.println(this.booking.getEmail());
				MailService.getInstance().send(this.booking.getEmail(), template, pdfByteArr.toByteArray(), "application/pdf", Constants.MAIL_ATT_TICKET_NAME + UUID.randomUUID().toString().replace('-', '0') + ".pdf");
			    }
			    catch (Exception innerEx)
			    {
				logger.error("ERROR OCCURRED WHILE GENERATING PDF TICKET" + innerEx);
				// SEND MAIL WITHOUT ATTACHMENT
				MailService.getInstance().send(this.booking.getEmail(), template);
			    }
			}
			catch (Exception ex)
			{
			    logger.error("ERROR OCCURRED WHILE SENDING NOTIFICATIONS" + ex);
			}
			this.setSuccessFlag(true);
		    }
		}
		catch(Exception ex)
		{
		    logger.error("ERROR OCCURRED WHILE PROCESSING TRANSACTION" + ex);
		    this.setSuccessFlag(false);
		}
		finally
		{
		    BookingManager.invalidateBookingSession(getServletRequestObject().getSession(false));
		}
	    }
	    else
	    {
		BookingManager.invalidateBookingSession(getServletRequestObject().getSession(false));
		this.setSuccessFlag(false);
	    }
	}
	return "step-payment-result";
    }

    public Booking getBooking()
    {
	return booking;
    }

    public void setBooking(Booking booking)
    {
	this.booking = booking;
    }

    public MovieInfo getMovieInfo()
    {
        return movieInfo;
    }

    public void setMovieInfo(DBAccess dbObj)
    {
	this.movieInfo = dbObj.getMovieDetails(this.booking.getSchedule().getMovieId());
    }
    
    public boolean isSuccessFlag()
    {
	return successFlag;
    }

    public void setSuccessFlag(boolean successFlag)
    {
	this.successFlag = successFlag;
    }
}