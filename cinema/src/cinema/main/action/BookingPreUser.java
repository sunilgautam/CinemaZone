package cinema.main.action;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.Transaction;
import cinema.domain.pojo.UserInfo;

public class BookingPreUser extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPreUser.class);

    private String seatsSelected;
    private Booking booking;
    private Transaction transaction;

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingPreUser.class + "]");
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    if (this.seatsSelected == null || this.seatsSelected.equals(""))
	    {
		return "step-select-seats";
	    }
	    else
	    {
		// GET SELECTED SEAT LIST
		List<String> seats = new ArrayList<String>();
		while (this.seatsSelected.startsWith("$"))
		{
		    this.seatsSelected = this.seatsSelected.substring(1);
		}

		while (seatsSelected.endsWith("$"))
		{
		    this.seatsSelected = this.seatsSelected.substring(0, this.seatsSelected.length() - 1);
		}

		String[] tempArr = this.seatsSelected.split("\\$\\$");

		for (int i = 0; i < tempArr.length; i++)
		{
		    seats.add(tempArr[i]);
		}

		if (seats.size() > 0)
		{
		    // UPDATE BOOKING SESSION WITH SEAT NO
		    booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
		    if (seats.size() == booking.getNoOfSeats())
		    {
			booking.setSeats(seats);
			setTransaction(booking);
			logger.info("BOOKING SESSION UPDATED");
			String target = BookingManager.getTargetPage(getServletRequestObject().getSession(false));
			if (target.equals("step-details"))
			{
			    // IF LOGGED IN USER THEN UPDATE BOOKING SESSION WITH ID, EMAIL AND MOB NO
			    Object uInfo = getServletRequestObject().getSession(false).getAttribute(USER_HANDLE);
			    if (uInfo != null && uInfo instanceof UserInfo)
			    {
				UserInfo uInfo_1 = (UserInfo)uInfo;
				booking.setUserType("R");
				booking.setUserId(uInfo_1.getUserId());
				booking.setEmail(uInfo_1.getEmail());
				booking.setMobileNo(uInfo_1.getMobileNo());
				logger.info("BOOKING SESSION UPDATED WITH LOGGED IN USER DETAILS");
			    }
			}
			return target;
		    }
		    else
		    {
			logger.info("NO OF SEATS ARE MIS-MATCHED FROM BOOKING SESSION NO OF SHEETS");
			return "step-select-seats";
		    }
		}
		else
		{
		    logger.info("SEATS NOT FOUND");
		    return "step-select-seats";
		}
	    }
	}
	else
	{
	    // BOOKING SESSION NOT STARTED
	    logger.info("BOOKING SESSION NOT STARTED");
	    return "step-schedule";
	}
    }

    public String getSeatsSelected()
    {
	return seatsSelected;
    }

    public void setSeatsSelected(String seatsSelected)
    {
	this.seatsSelected = seatsSelected;
    }

    public Booking getBooking()
    {
	return booking;
    }

    public void setBooking(Booking booking)
    {
	this.booking = booking;
    }

    public Transaction getTransaction()
    {
        return transaction;
    }
    
    public void setTransaction(Booking booking) throws Exception
    {
	try
	{
	    if (booking != null)
	    {
		this.transaction = new Transaction(booking.getNoOfSeats(), Double.parseDouble(booking.getSeatType().getBasePrice()));
		this.booking.setTransaction(this.transaction);
	    }
	}
	catch (Exception ex)
	{
	    logger.error("EXCEPTION WHILE PARSING SEAT BASE PRICE " + ex);
	    throw ex;
	}
    }
}
