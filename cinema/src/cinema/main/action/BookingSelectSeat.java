package cinema.main.action;

import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.MovieInfo;
import cinema.domain.pojo.SeatRow;
import cinema.util.CommonMethod;

public class BookingSelectSeat extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingSelectSeat.class);

    private List<SeatRow> seatrows;
    private List<String> seattypes;
    private MovieInfo movieInfo;
    private Booking booking;
    private Date dateName;

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingSelectSeat.class + "]");
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    // BOOKING SESSION STARTED
	    DBAccess dbObj = new DBAccess();
	    // GET BOOKING INFO
	    booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
	    if (booking.getNoOfSeats() > 0)
	    {
		setMovieInfo(dbObj);
		setDateName(booking.getSchedule().getDate());

		// GET SEATS BOOKING STATUS
		seatrows = dbObj.getCurrentSeatStatus(booking);
		seattypes = dbObj.getSeatTypeDetailsBySchedule(booking.getSchedule());
	    }
	    else
	    {
		logger.error("NO OF SEATS NOT FOUND IN BOOKING SESSION");
		return "step-input";
	    }
	}
	else
	{
	    logger.error("BOOKING SESSION NOT STARTED");
	    return "step-input";
	}
	return "step-select-seats";
    }

    public List<SeatRow> getSeatrows()
    {
	return seatrows;
    }

    public void setSeatrows(List<SeatRow> seatrows)
    {
	this.seatrows = seatrows;
    }

    public List<String> getSeattypes()
    {
	return seattypes;
    }

    public void setSeattypes(List<String> seattypes)
    {
	this.seattypes = seattypes;
    }

    public MovieInfo getMovieInfo()
    {
	return movieInfo;
    }

    public void setMovieInfo(DBAccess dbObj)
    {
	this.movieInfo = dbObj.getMovieDetails(this.booking.getSchedule().getMovieId());
    }

    public Booking getBooking()
    {
	return booking;
    }

    public void setBooking(Booking booking)
    {
	this.booking = booking;
    }
    
    public Date getDateName()
    {
	return dateName;
    }

    public void setDateName(String dateNameStr)
    {
	this.dateName = CommonMethod.customeStringToUtilDate(dateNameStr, "yyyy-MM-dd");
    }
}
