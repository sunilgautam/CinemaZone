package cinema.main.action;

import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.domain.pojo.Booking;

public class BookingUser extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingUser.class);

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingUser.class + "]");
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    Booking booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
	    if (booking != null && booking.getNoOfSeats() > 0)
	    {
		return BookingManager.getTargetPage(getServletRequestObject().getSession(false));
	    }
	    else
	    {
		return "step-select-seats";
	    }
	}
	else
	{
	    // BOOKING SESSION NOT STARTED
	    logger.info("BOOKING SESSION NOT STARTED");
	    return "step-schedule";
	}
    }
}
