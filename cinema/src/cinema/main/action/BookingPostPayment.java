package cinema.main.action;

import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.PaymentDetail;

public class BookingPostPayment extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingPostPayment.class);
    
    private Booking booking;
    private PaymentDetail paymentDetail;
    private String cardType;
    private String cardNo;
    private String expiryMonth;
    private String expiryYear;
    private String cvv;
    private String cardName;
    private String secureTransKey;
    
    public boolean validatePaymentDetails()
    {
	logger.info("[Validating::" + BookingPostPayment.class + "]");
	boolean isOk = true;
	if (this.getCardType() == null || this.getCardType().equals(""))
	{
	    isOk = false;
	}
	
	if (this.getCardNo() == null || this.getCardNo().equals(""))
	{
	    isOk = false;
	}
	
	if (this.getExpiryMonth() == null || this.getExpiryMonth().equals(""))
	{
	    isOk = false;
	}
	
	if (this.getExpiryYear() == null || this.getExpiryYear().equals(""))
	{
	    isOk = false;
	}
	
	if (this.getCvv() == null || this.getCvv().equals(""))
	{
	    isOk = false;
	}
	
	if (this.getCardName() == null || this.getCardName().equals(""))
	{
	    isOk = false;
	}
	
	return isOk;
    }

    @Override
    public String execute() throws Exception
    {
	logger.info("[STEP-1-Executing::" + BookingPostPayment.class + "]");
	if (BookingManager.isBookingSession(getServletRequestObject().getSession(false)))
	{
	    if (validatePaymentDetails())
	    {
		logger.info("[STEP-2-Executing::" + BookingPostPayment.class + "]");
		this.booking = BookingManager.getBookingSessionObject(getServletRequestObject().getSession(false));
    	    	if (this.booking != null && this.booking.getNoOfSeats() > 0)
    	    	{
    	    	    BookingManager.attachNewSecureTransKey(booking);
    	    	    paymentDetail = this.booking.getPaymentDetail();
    	    	    if (paymentDetail != null)
    	    	    {
    	    		paymentDetail.setCardType(this.getCardType());
    	    	    	paymentDetail.setCardNo(this.getCardNo());
    	    	    	paymentDetail.setExpiryMonth(this.getExpiryMonth());
    	    	    	paymentDetail.setExpiryYear(this.getExpiryYear());
    	    	    	paymentDetail.setCvv(this.getCvv());
    	    	    	paymentDetail.setCardName(this.getCardName());
    	    	    	logger.info("BOOKING SESSION UPDATED");
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
	    else
	    {
		return "step-payment-error";
	    }
	}
	else
	{
	    // BOOKING SESSION NOT STARTED
	    logger.info("BOOKING SESSION NOT STARTED");
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
    
    public PaymentDetail getPaymentDetail()
    {
	return paymentDetail;
    }

    public void setPaymentDetail(PaymentDetail paymentDetail)
    {
	this.paymentDetail = paymentDetail;
    }

    public String getCardType()
    {
        return cardType;
    }

    public void setCardType(String cardType)
    {
        this.cardType = cardType;
    }

    public String getCardNo()
    {
        return cardNo;
    }

    public void setCardNo(String cardNo)
    {
        this.cardNo = cardNo;
    }

    public String getExpiryMonth()
    {
        return expiryMonth;
    }

    public void setExpiryMonth(String expiryMonth)
    {
        this.expiryMonth = expiryMonth;
    }

    public String getExpiryYear()
    {
        return expiryYear;
    }

    public void setExpiryYear(String expiryYear)
    {
        this.expiryYear = expiryYear;
    }

    public String getCvv()
    {
        return cvv;
    }

    public void setCvv(String cvv)
    {
        this.cvv = cvv;
    }

    public String getCardName()
    {
        return cardName;
    }

    public void setCardName(String cardName)
    {
        this.cardName = cardName;
    }

    public String getSecureTransKey()
    {
        return secureTransKey;
    }

    public void setSecureTransKey(String secureTransKey)
    {
        this.secureTransKey = secureTransKey;
    }
}
