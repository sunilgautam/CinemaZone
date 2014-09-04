package cinema.domain.pojo;

public class SeatType
{
    private String seatTypeId;
    private String seatType;
    private String basePrice;

    public SeatType()
    {

    }

    public SeatType(String seatTypeId, String seatType, String basePrice)
    {
	this.seatTypeId = seatTypeId;
	this.seatType = seatType;
	this.basePrice = basePrice;
    }

    public String getSeatTypeId()
    {
	return seatTypeId;
    }

    public void setSeatTypeId(String seatTypeId)
    {
	this.seatTypeId = seatTypeId;
    }

    public String getSeatType()
    {
	return seatType;
    }

    public void setSeatType(String seatType)
    {
	this.seatType = seatType;
    }

    public String getBasePrice()
    {
	return basePrice;
    }

    public void setBasePrice(String basePrice)
    {
	this.basePrice = basePrice;
    }
}
