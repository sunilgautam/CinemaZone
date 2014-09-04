package cinema.domain.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import cinema.util.CommonMethod;

public class DaySchedule
{
    private String date;
    private Date dateName;
    private boolean scheduled;
    private boolean canScheduled;
    private boolean canBooked;
    private List<Schedule> schedules = new ArrayList<Schedule>();

    public DaySchedule()
    {

    }

    public DaySchedule(String date, Date dateName, boolean scheduled, List<Schedule> schedules)
    {
	this.date = date;
	this.dateName = dateName;
	this.scheduled = scheduled;
	this.schedules = schedules;
    }

    public String getDate()
    {
	return date;
    }

    public void setDate(String date)
    {
	this.date = date;
    }

    public Date getDateName()
    {
	return dateName;
    }

    public void setDateName()
    {
	this.dateName = CommonMethod.customeStringToUtilDate(this.date, "yyyy-MM-dd");
    }

    public boolean isScheduled()
    {
	return scheduled;
    }

    public void setScheduled(boolean scheduled)
    {
	this.scheduled = scheduled;
    }

    public List<Schedule> getSchedules()
    {
	return schedules;
    }

    public void setSchedules(List<Schedule> schedules)
    {
	this.schedules = schedules;
    }

    public boolean isCanScheduled()
    {
	return canScheduled;
    }

    public void setCanScheduled(boolean canScheduled)
    {
	this.canScheduled = canScheduled;
    }

    public boolean isCanBooked()
    {
	return canBooked;
    }

    public void setCanBooked(boolean canBooked)
    {
	this.canBooked = canBooked;
    }
}
