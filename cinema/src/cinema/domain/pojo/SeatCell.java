package cinema.domain.pojo;

public class SeatCell
{
    private int status;
    private int no;
    private String type;

    public SeatCell()
    {

    }

    public SeatCell(int no, String type, int status)
    {
	super();
	this.no = no;
	this.type = type;
	this.status = status;
    }

    public int getStatus()
    {
	return status;
    }

    public void setStatus(int status)
    {
	this.status = status;
    }

    public int getNo()
    {
	return no;
    }

    public void setNo(int no)
    {
	this.no = no;
    }

    public String getType()
    {
	return type;
    }

    public void setType(String type)
    {
	this.type = type;
    }
}
