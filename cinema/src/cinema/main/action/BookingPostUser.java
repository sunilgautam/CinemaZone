package cinema.main.action;

import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.AUserInfo;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.UserInfo;
import cinema.util.CommonMethod;

public class BookingPostUser extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPostUser.class);

    private Booking booking;
    private String email;
    private String pWord;
    private String mobileNo;
    private String userType;
    private UserInfo uInfo;
    private AUserInfo aUInfo;

    public void validateUserDetails()
    {
	logger.info("[Validating::" + BookingPostUser.class + "]");
	if (this.getEmail() == null || this.getEmail().equals(""))
	{
	    addActionError(getText("booking.blank.email"));
	}
	else if (!CommonMethod.isEmailValidator(this.getEmail()))
	{
	    addActionError(getText("booking.invalid.email"));
	}

	if (this.getUserType() == null || this.getUserType().equals(""))
	{
	    addActionError(getText("booking.invalid.user"));
	}
	else
	{
	    if (this.getUserType().equals("R"))
	    {
		if (this.getPWord() == null || this.getPWord().equals(""))
		{
		    addActionError(getText("booking.blank.password"));
		}
	    }
	    else if (this.getUserType().equals("A"))
	    {
		if (this.getMobileNo() == null || this.getMobileNo().equals(""))
		{
		    addActionError(getText("booking.blank.mobile"));
		}
		else if (this.getMobileNo().length() != 10 || !CommonMethod.isFloating(this.getMobileNo()))
		{
		    addActionError(getText("booking.invalid.mobile"));
		}
	    }
	}
    }

    @Override
    public String execute() throws Exception
    {
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    validateUserDetails();
	    if (hasActionErrors())
	    {
		return "step-get-user";
	    }

	    logger.info("[Executing::" + BookingPostUser.class + "]");
	    if (this.getUserType().equals("R"))
	    {
		// REGISTERED USER
		DBAccess dbObj = new DBAccess();
		this.uInfo = dbObj.checkUserLogin(this.email, this.pWord);
		if (this.uInfo == null)
		{
		    // INVALID USER DETAILS
		    addActionError(getText("booking.invalid.emailpass"));
		    return "step-get-user";
		}
		else
		{
		    // VALID USER DETAILS
		    // SET USER SESSION
		    HttpSession sessionObj = getServletRequestObject().getSession(true);
		    sessionObj.setMaxInactiveInterval(USER_SESSION_TIMEOUT);
		    sessionObj.setAttribute(USER_HANDLE, this.uInfo);

		    // CHECK SESSION
		    if (this.getSession().get(USER_HANDLE) != null)
		    {
			logger.info("[USER SESSION DETAILS => " + sessionObj.getAttribute(USER_HANDLE) + " SID => " + sessionObj.getId() + " TIMEOUT => " + sessionObj.getMaxInactiveInterval() + "]");
			booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
			booking.setUserType("R");
			booking.setUserId(this.uInfo.getUserId());
			booking.setEmail(this.uInfo.getEmail());
			booking.setMobileNo(this.uInfo.getMobileNo());
			return "step-details";
		    }
		    else
		    {
			return "step-get-user";
		    }
		}
	    }
	    else if (this.getUserType().equals("A"))
	    {
		// ANONYMOUS USER
		aUInfo = new AUserInfo();
		aUInfo.setEmail(this.email);
		aUInfo.setMobileNo(this.mobileNo);

		// SET ANONYMOUS USER SESSION
		HttpSession sessionObj = getServletRequestObject().getSession(true);
		sessionObj.setMaxInactiveInterval(A_USER_SESSION_TIMEOUT);
		sessionObj.setAttribute(A_USER_HANDLE, this.aUInfo);

		// CHECK SESSION
		if (this.getSession().get(A_USER_HANDLE) != null)
		{
		    logger.info("[ANONYMOUS USER SESSION DETAILS => " + sessionObj.getAttribute(A_USER_HANDLE) + " SID => " + sessionObj.getId() + " TIMEOUT => " + sessionObj.getMaxInactiveInterval() + "]");
		    booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
		    booking.setUserType("A");
		    booking.setUserId("0");
		    booking.setEmail(this.aUInfo.getEmail());
		    booking.setMobileNo(this.aUInfo.getMobileNo());
		    return "step-details";
		}
		else
		{
		    return "step-get-user";
		}
	    }
	    else
	    {
		return "step-get-user";
	    }
	}
	else
	{
	    // BOOKING SESSION NOT STARTED
	    logger.info("BOOKING SESSION NOT STARTED");
	    return "step-schedule";
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

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    public String getPWord()
    {
        return pWord;
    }

    public void setPWord(String pWord)
    {
        this.pWord = pWord;
    }

    public String getMobileNo()
    {
	return mobileNo;
    }

    public void setMobileNo(String mobileNo)
    {
	this.mobileNo = mobileNo;
    }

    public String getUserType()
    {
	return userType;
    }

    public void setUserType(String userType)
    {
	this.userType = userType;
    }

    public UserInfo getuInfo()
    {
	return uInfo;
    }

    public void setuInfo(UserInfo uInfo)
    {
	this.uInfo = uInfo;
    }

    public AUserInfo getaUInfo()
    {
	return aUInfo;
    }

    public void setaUInfo(AUserInfo aUInfo)
    {
	this.aUInfo = aUInfo;
    }
}
