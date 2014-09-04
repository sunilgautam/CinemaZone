package cinema.main.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.DaySchedule;
import cinema.domain.pojo.Schedule;

public class ScheduleIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScheduleIndex.class);

    private List<DaySchedule> daySchedules = new ArrayList<DaySchedule>();

    public String execute() throws Exception
    {
	logger.info("[Executing::" + ScheduleIndex.class + "]");
	BookingManager.invalidateBookingSession(getServletRequestObject().getSession(false));

	DBAccess dbObj = new DBAccess();
	List<Schedule> schedules = dbObj.getUserSchedule();
	logger.info("Size => " + schedules.size());
	if (schedules.size() > 0)
	{
	    setDaySchedules(schedules);
	}
	return "success";
    }

    public List<DaySchedule> getDaySchedules()
    {
	return daySchedules;
    }

    public void setDaySchedules(List<Schedule> schedules)
    {
	try
	{
	    DaySchedule currDaySchedule = null;
	    String date = "";
	    Iterator<Schedule> iterate = schedules.iterator();

	    while (iterate.hasNext())
	    {
		Schedule schedule = iterate.next();

		if (schedule.getDate().equals(date))
		{
		    System.out.println("{ DATE SAME }");
		    currDaySchedule.getSchedules().add(schedule);
		}
		else
		{
		    System.out.println("{ DATE NOT SAME }");
		    currDaySchedule = new DaySchedule();
		    currDaySchedule.setDate(schedule.getDate());
		    currDaySchedule.setDateName();
		    currDaySchedule.setScheduled(schedule.isScheduled());
		    currDaySchedule.setCanBooked(schedule.isCanBooked());
		    currDaySchedule.getSchedules().add(schedule);

		    daySchedules.add(currDaySchedule);
		}

		date = schedule.getDate();
	    }
	    // logger.info(this.daySchedules);
	}
	catch (Exception e)
	{
	    e.printStackTrace();
	}
    }
}