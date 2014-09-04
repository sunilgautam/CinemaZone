package cinema.domain.pojo;

public class TicketCost
{
    private String ticketCostId;
    private String movieId;
    private String movieName;
    private String seatTypeId;
    private String seatType;
    private String ticketCost;

    public TicketCost()
    {

    }

    public TicketCost(String ticketCostId, String movieId, String movieName, String seatTypeId, String seatType, String ticketCost)
    {
	this.ticketCostId = ticketCostId;
	this.movieId = movieId;
	this.movieName = movieName;
	this.seatTypeId = seatTypeId;
	this.seatType = seatType;
	this.ticketCost = ticketCost;
    }

    public String getTicketCostId()
    {
	return ticketCostId;
    }

    public void setTicketCostId(String ticketCostId)
    {
	this.ticketCostId = ticketCostId;
    }

    public String getMovieId()
    {
	return movieId;
    }

    public void setMovieId(String movieId)
    {
	this.movieId = movieId;
    }

    public String getMovieName()
    {
	return movieName;
    }

    public void setMovieName(String movieName)
    {
	this.movieName = movieName;
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

    public String getTicketCost()
    {
	return ticketCost;
    }

    public void setTicketCost(String ticketCost)
    {
	this.ticketCost = ticketCost;
    }
}
