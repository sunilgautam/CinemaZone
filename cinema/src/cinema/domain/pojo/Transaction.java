package cinema.domain.pojo;

public class Transaction
{
    private String id;
    private String code;
    private double amount;
    private final double convenienceFees = 20;
    private double serviceTax;
    private double grandTotal;

    public Transaction()
    {

    }
    
    public Transaction(int noOfSeats, double basePrice)
    {
	if (noOfSeats > 0)
	{
	    // CALCULATE AMOUNT
	    this.setAmount(noOfSeats * basePrice);
	    
	    this.setServiceTax(0);
	    this.setGrandTotal();
	}
    }

    public String getId()
    {
	return id;
    }

    public void setId(String id)
    {
	this.id = id;
    }

    public String getCode()
    {
	return code;
    }

    public void setCode(String code)
    {
	this.code = code;
    }

    public double getAmount()
    {
        return amount;
    }

    public void setAmount(double amount)
    {
        this.amount = amount;
    }

    public double getConvenienceFees()
    {
        return convenienceFees;
    }

    public double getServiceTax()
    {
        return serviceTax;
    }

    public void setServiceTax(double serviceTax)
    {
        this.serviceTax = serviceTax;
    }

    public double getGrandTotal()
    {
        return grandTotal;
    }

    public void setGrandTotal()
    {
	if (this.amount > 0)
	{
	    this.grandTotal = (this.amount + this.convenienceFees);
	}
    }
    
    @Override
    public String toString()
    {
        return String.valueOf(amount) + "||" + String.valueOf(convenienceFees) + "||" + String.valueOf(grandTotal);
    }
}
