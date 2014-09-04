package cinema.domain.pojo;

import java.util.ArrayList;
import java.util.List;

public class ScreenSchedule
{
    private String screenId;
    private String screenName;
    private List<DaySchedule> daySchedules = new ArrayList<DaySchedule>();

    public ScreenSchedule()
    {

    }

    public ScreenSchedule(String screenId, String screenName, List<DaySchedule> daySchedules)
    {
	super();
	this.screenId = screenId;
	this.screenName = screenName;
	this.daySchedules = daySchedules;
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

    public List<DaySchedule> getDaySchedules()
    {
	return daySchedules;
    }

    public void setDaySchedules(List<DaySchedule> daySchedules)
    {
	this.daySchedules = daySchedules;
    }
}
