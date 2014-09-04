package cinema.main.action;

import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.Schedule;
import cinema.domain.pojo.SeatType;

public class BookingPreSelectSeat extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPreSelectSeat.class);

    private Schedule schedule;
    private String scheduleId;
    private boolean isScheduleOk;
    private String screenAndShows;
    private String showClass;
    private SeatType seatType;
    private String noOfSeats;
    private String screenId;
    private Booking booking;

    public void checkScheduleParameters()
    {
	logger.info("[Validating::" + BookingPreSelectSeat.class + "]");

	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    // BOOKING SESSION STARTED
	    setScheduleOk(true);
	}
	else
	{
	    if (this.getScheduleId() == null || this.getScheduleId().equals(""))
	    {
		addActionError("NO SCHEDULE");
	    }

	    if (this.getScreenAndShows() == null || this.getScreenAndShows().equals(""))
	    {
		addActionError("NO SCREEN_SHOWS");
	    }

	    if (this.getShowClass() == null || this.getShowClass().equals(""))
	    {
		addActionError("NO SHOW_CLASS");
	    }

	    if (this.getNoOfSeats() == null || this.getNoOfSeats().equals(""))
	    {
		addActionError("NO NO_OF_SEATS");
	    }

	    // GET SCHEDULE ID
	    if (this.getScreenAndShows() != null && !this.getScreenAndShows().equals(""))
	    {
		String[] strArr = this.getScreenAndShows().split(":");
		if (strArr.length == 2)
		{
		    setScreenId(strArr[0]);
		    setScheduleId(strArr[1]);
		}
		else
		{
		    addActionError("NO SCHEDULE:SCREEN");
		}
	    }

	    setScheduleOk(!hasActionErrors());
	}
    }

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingPreSelectSeat.class + "]");
	if (getServletRequestObject().getMethod().equals("POST"))
	{
	    checkScheduleParameters();
	    if (isScheduleOk())
	    {
		DBAccess dbObj = new DBAccess();
		// GET SCHEDULE INFO
		this.schedule = dbObj.getScheduleById(scheduleId);
		if (this.schedule != null)
		{
		    // CREATE BOOKING OBJECT
		    booking = new Booking();
		    booking.setSchedule(schedule);
		    booking.setNoOfSeats(Integer.parseInt(noOfSeats));
		    seatType = dbObj.getSeatType(showClass, booking.getSchedule().getMovieId());
		    if(seatType != null)
		    {
			booking.setSeatType(seatType);
			//booking.setShowClass(showClass);

			// START BOOKING SESSION
			BookingManager.startBookingSession(getServletRequestObject().getSession(false), booking);
		    }
		    else
		    {
			setScheduleOk(false);
			logger.error("SEAT CLASS NOT FOUND");
			return "step-input";
		    }
		}
		else
		{
		    setScheduleOk(false);
		    logger.error("NO SCHEDULE FOUND");
		    addActionError(getText("booking.no.scheduleid"));
		    return "step-input";
		}
	    }
	    else
	    {
		clearActionErrors();
		addActionError(getText("booking.no.scheduleid"));
		return "step-input";
	    }
	}
	else
	{
	    setScheduleOk(false);
	    logger.error("ONLY POST METHOD ALLOWED");
	    return "step-input";
	}
	return "step-select-seats";
    }

    public Schedule getSchedule()
    {
	return schedule;
    }

    public void setSchedule(Schedule schedule)
    {
	this.schedule = schedule;
    }

    public String getScheduleId()
    {
	return scheduleId;
    }

    public void setScheduleId(String scheduleId)
    {
	this.scheduleId = scheduleId;
    }

    public boolean isScheduleOk()
    {
	return isScheduleOk;
    }

    public void setScheduleOk(boolean isScheduleOk)
    {
	this.isScheduleOk = isScheduleOk;
    }

    public String getScreenAndShows()
    {
	return screenAndShows;
    }

    public void setScreenAndShows(String screenAndShows)
    {
	this.screenAndShows = screenAndShows;
    }

    public String getShowClass()
    {
	return showClass;
    }

    public void setShowClass(String showClass)
    {
	this.showClass = showClass;
    }

    public SeatType getSeatType()
    {
	return seatType;
    }

    public void setSeatType(SeatType seatType)
    {
	this.seatType = seatType;
    }

    public String getNoOfSeats()
    {
	return noOfSeats;
    }

    public void setNoOfSeats(String noOfSeats)
    {
	this.noOfSeats = noOfSeats;
    }

    public String getScreenId()
    {
	return screenId;
    }

    public void setScreenId(String screenId)
    {
	this.screenId = screenId;
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
