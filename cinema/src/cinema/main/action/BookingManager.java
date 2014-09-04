package cinema.main.action;

import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import cinema.domain.pojo.AUserInfo;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.UserInfo;
import cinema.util.Constants;

public class BookingManager implements Constants
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingManager.class);

    public static void startBookingSession(HttpSession currentSession, Booking bookingObj)
    {
	if (currentSession != null && bookingObj != null)
	{
	    currentSession.setAttribute(BOOKING_HANDLE, bookingObj);
	    logger.info("Booking session started");
	}
    }
    
    public static void attachNewSecureTransKey(Booking bookingObj)
    {
	if (bookingObj != null)
	{
	    String key = UUID.randomUUID().toString();
	    bookingObj.setSecureTransKey(key);
	    bookingObj.setKeyActive(true);
	    logger.info("NEW SECURE KEY ATTACHED " + key);
	}
    }
    
    public static void detachSecureTransKey(Booking bookingObj)
    {
	if (bookingObj != null)
	{
	    bookingObj.setSecureTransKey(null);
	    bookingObj.setKeyActive(false);
	    logger.info("SECURE KEY DETTACHED ");
	}
    }
    
    public static boolean isSecureTransKeyActive(Booking bookingObj, String secureTransKey)
    {
	if (bookingObj != null)
	{
	    if (bookingObj.isKeyActive())
	    {
		if (bookingObj.getSecureTransKey().equals(secureTransKey))
		{
		    return true;
		}
		else
		{
		    return false;
		}
	    }
	    else
	    {
		return false;
	    }
	}
	else
	{
	    return false;
	}
    }
    
    public static boolean isSecureTransKeyActive(Booking bookingObj)
    {
	if (bookingObj != null)
	{
	    if (bookingObj.isKeyActive())
	    {
		return true;
	    }
	    else
	    {
		return false;
	    }
	}
	else
	{
	    return false;
	}
    }

    public static void invalidateBookingSession(HttpSession currentSession)
    {
	if (currentSession != null)
	{
	    currentSession.removeAttribute(BOOKING_HANDLE);
	    
	    // ALSO REMOVE ANONYMOUS USER SESSION
	    currentSession.removeAttribute(A_USER_HANDLE);
	    logger.info("Booking session invalidated");
	}
    }

    public static boolean isBookingSession(HttpSession currentSession)
    {
	if (currentSession != null)
	{
	    Object bookingObj = currentSession.getAttribute(BOOKING_HANDLE);
	    if (bookingObj != null && bookingObj instanceof Booking)
	    {
		return true;
	    }
	    else
	    {
		return false;
	    }
	}
	else
	{
	    return false;
	}
    }

    public static Booking getBookingSessionObject(HttpSession currentSession)
    {
	if (currentSession != null)
	{
	    Object bookingObj = currentSession.getAttribute(BOOKING_HANDLE);
	    if (bookingObj != null && bookingObj instanceof Booking)
	    {
		return (Booking) bookingObj;
	    }
	    else
	    {
		return null;
	    }
	}
	else
	{
	    return null;
	}
    }

    public static String getTargetPage(HttpSession currentSession)
    {
	// CHECK USER LOGIN
	if (currentSession.getAttribute(cinema.util.Constants.USER_HANDLE) != null)
	{
	    Object uInfo = currentSession.getAttribute(cinema.util.Constants.USER_HANDLE);
	    if (uInfo != null && uInfo instanceof UserInfo)
	    {
		// LOGGED IN USER
		logger.info("LOGGED IN USER");
		return "step-details";
	    }
	    else
	    {
		// GUEST USER
		logger.info("GUEST USER");
		return "step-get-user";
	    }
	}
	else if(currentSession.getAttribute(cinema.util.Constants.A_USER_HANDLE) != null)
	{
	    Object aUInfo = currentSession.getAttribute(cinema.util.Constants.A_USER_HANDLE);
	    if (aUInfo != null && aUInfo instanceof AUserInfo)
	    {
		// ANONYMOUS USER
		logger.info("ANONYMOUS USER");
		return "step-details";
	    }
	    else
	    {
		// GUEST USER
		logger.info("GUEST USER");
		return "step-get-user";
	    }
	}
	else
	{
	    // GUEST USER
	    logger.info("GUEST USER");
	    return "step-get-user";
	}
    }
}
