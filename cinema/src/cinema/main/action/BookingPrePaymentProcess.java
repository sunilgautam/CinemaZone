package cinema.main.action;

import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.domain.pojo.Booking;

public class BookingPrePaymentProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPrePaymentProcess.class);
    
    private Booking booking;
    
    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingPrePaymentProcess.class + "]");
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    this.booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
	    
	    if (this.booking != null && BookingManager.isSecureTransKeyActive(booking) && this.booking.getNoOfSeats() > 0)
	    {
		return "step-payment-process";
	    }
	    else
	    {
		return "step-payment-error";
	    }
	}
	else
	{
	    return "step-payment-error";
	}
    }

    public Booking getBooking()
    {
	return booking;
    }

    public void setBooking(Booking booking)
    {
	this.booking = booking;
    }
}
