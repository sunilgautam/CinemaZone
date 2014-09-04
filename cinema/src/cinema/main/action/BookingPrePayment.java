package cinema.main.action;

import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.MovieInfo;
import cinema.domain.pojo.PaymentDetail;
import cinema.util.CommonMethod;

public class BookingPrePayment extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPrePayment.class);
    
    private MovieInfo movieInfo;
    private Booking booking;
    private PaymentDetail paymentDetail;
    private Date dateName;
    private String seatNames = "";

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingPrePayment.class + "]");
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
	    if (booking != null && booking.getNoOfSeats() > 0)
	    {
		logger.info("BOOKING SESSION UPDATED");
		paymentDetail = new PaymentDetail();
		booking.setPaymentDetail(paymentDetail);
		
		DBAccess dbObj = new DBAccess();
		setMovieInfo(dbObj);
		setDateName(booking.getSchedule().getDate());
		setSeatNames(booking.getSeats());
		
		return "step-payment";
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

    public PaymentDetail getPaymentDetail()
    {
	return paymentDetail;
    }

    public void setPaymentDetail(PaymentDetail paymentDetail)
    {
	this.paymentDetail = paymentDetail;
    }

    public Date getDateName()
    {
        return dateName;
    }

    public void setDateName(String dateNameStr)
    {
	this.dateName = CommonMethod.customeStringToUtilDate(dateNameStr, "yyyy-MM-dd");
    }

    public String getSeatNames()
    {
	return seatNames;
    }

    public void setSeatNames(List<String> seats)
    {
	for(String item : seats)
	{
	    this.seatNames += "[" + item.replace(':', '-') + "]";
	}
    }
}
