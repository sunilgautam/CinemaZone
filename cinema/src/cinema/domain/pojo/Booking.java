package cinema.domain.pojo;

import java.util.List;

public class Booking
{
    private Schedule schedule;
    private int noOfSeats;
    private List<String> seats;
    private SeatType seatType;
    private Transaction transaction;
    private PaymentDetail paymentDetail;
    private String userType;
    private String userId;
    private String email;
    private String mobileNo;
    private String secureTransKey;
    private boolean keyActive;
    
    public Booking()
    {
	
    }

    public Schedule getSchedule()
    {
	return schedule;
    }

    public void setSchedule(Schedule schedule)
    {
	this.schedule = schedule;
    }

    public int getNoOfSeats()
    {
	return noOfSeats;
    }

    public void setNoOfSeats(int noOfSeats)
    {
	this.noOfSeats = noOfSeats;
    }

    public List<String> getSeats()
    {
	return seats;
    }

    public void setSeats(List<String> seats)
    {
	this.seats = seats;
    }
    
    public SeatType getSeatType()
    {
	return seatType;
    }

    public void setSeatType(SeatType seatType)
    {
	this.seatType = seatType;
    }

    public Transaction getTransaction()
    {
        return transaction;
    }

    public void setTransaction(Transaction transaction)
    {
        this.transaction = transaction;
    }

    public PaymentDetail getPaymentDetail()
    {
        return paymentDetail;
    }

    public void setPaymentDetail(PaymentDetail paymentDetail)
    {
        this.paymentDetail = paymentDetail;
    }

    public String getUserType()
    {
        return userType;
    }

    public void setUserType(String userType)
    {
        this.userType = userType;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getMobileNo()
    {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo)
    {
        this.mobileNo = mobileNo;
    }

    public String getSecureTransKey()
    {
	return secureTransKey;
    }

    public void setSecureTransKey(String secureTransKey)
    {
	this.secureTransKey = secureTransKey;
    }

    public boolean isKeyActive()
    {
	return keyActive;
    }

    public void setKeyActive(boolean keyActive)
    {
	this.keyActive = keyActive;
    }
}
