package cinema.domain.pojo;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

public class PaymentDetail
{
    private String id;
    private String cardType;
    private String cardNo;
    private String expiryMonth;
    private String expiryYear;
    private String cvv;
    private String cardName;
    private Map<String, String> cardTypes = new HashMap<String, String>();
    private Map<Integer, String> expiryMonths = new HashMap<Integer, String>();
    private Map<Integer, String> expiryYears = new HashMap<Integer, String>();
    
    public PaymentDetail()
    {
	setCardTypes();
	setExpiryMonths();
	setExpiryYears();
    }
    
    public PaymentDetail(String cardType, String cardNo, String expiryMonth, String expiryYear, String cvv, String cardName)
    {
	this.cardType = cardType;
	this.cardNo = cardNo;
	this.expiryMonth = expiryMonth;
	this.expiryYear = expiryYear;
	this.cvv = cvv;
	this.cardName = cardName;
	
	setCardTypes();
	setExpiryMonths();
	setExpiryYears();
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
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

    public Map<String, String> getCardTypes()
    {
	return cardTypes;
    }

    public void setCardTypes()
    {
	this.cardTypes.put("Visa", "Visa");
	this.cardTypes.put("MasterCard", "MasterCard");
	this.cardTypes.put("American Express", "American Express");
    }

    public Map<Integer, String> getExpiryMonths()
    {
        return expiryMonths;
    }

    public void setExpiryMonths()
    {
        this.expiryMonths.put(1, "JAN");
        this.expiryMonths.put(2, "FEB");
        this.expiryMonths.put(3, "MAR");
        this.expiryMonths.put(4, "APR");
        this.expiryMonths.put(5, "MAY");
        this.expiryMonths.put(6, "JUN");
        this.expiryMonths.put(7, "JUL");
        this.expiryMonths.put(8, "AUG");
        this.expiryMonths.put(9, "SEP");
        this.expiryMonths.put(10, "OCT");
        this.expiryMonths.put(11, "NOV");
        this.expiryMonths.put(12, "DEC");
    }

    public Map<Integer, String> getExpiryYears()
    {
        return expiryYears;
    }

    public void setExpiryYears()
    {
	GregorianCalendar currDate = new GregorianCalendar();
	int currYear = Integer.parseInt(String.valueOf(currDate.get(Calendar.YEAR)).substring(2));
	for(int i = 0; i < 30; i ++)
	{
	    this.expiryYears.put((currYear + i), String.valueOf(currYear + i));
	}
    }
    
    public String getExpiryString()
    {
	if((this.getExpiryMonth() == null || this.getExpiryMonth().equals("")) || (this.getExpiryYear() == null || this.getExpiryYear().equals("")))
	{
	    return null;
	}
	else
	{
	    return this.getExpiryMonth() + "-" + this.getExpiryYear();
	}
    }
}