package cinema.domain.pojo;

public class Screen
{
    private String screenId;
    private String screenName;
    private String seatPatternId;
    private String seatPattern;

    public Screen()
    {

    }

    public Screen(String screenId, String screenName, String seatPatternId, String seatPattern)
    {
	this.screenId = screenId;
	this.screenName = screenName;
	this.seatPatternId = seatPatternId;
	this.seatPattern = seatPattern;
    }

    public String getScreenId()
    {
	return screenId;
    }

    public void setScreenId(String screenId)
    {
	this.screenId = screenId;
    }

    public String getScreenName()
    {
	return screenName;
    }

    public void setScreenName(String screenName)
    {
	this.screenName = screenName;
    }

    public String getSeatPattern()
    {
	return seatPattern;
    }

    public void setSeatPattern(String seatPattern)
    {
	this.seatPattern = seatPattern;
    }

    public String getSeatPatternId()
    {
	return seatPatternId;
    }

    public void setSeatPatternId(String seatPatternId)
    {
	this.seatPatternId = seatPatternId;
    }
}
