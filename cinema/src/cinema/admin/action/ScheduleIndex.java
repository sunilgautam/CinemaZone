package cinema.admin.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.DaySchedule;
import cinema.domain.pojo.Schedule;
import cinema.domain.pojo.ScreenSchedule;

public class ScheduleIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScheduleIndex.class);

    private List<ScreenSchedule> screenSchedules;

    public String execute() throws Exception
    {
	logger.info("[Executing::" + ScheduleIndex.class + "]");
	DBAccess dbObj = new DBAccess();
	List<Schedule> schedules = dbObj.getAllSchedule();
	logger.info("Size => " + schedules.size());
	if (schedules.size() > 0)
	{
	    setScreenSchedules(schedules);
	}
	return "success";
    }

    public List<ScreenSchedule> getScreenSchedules()
    {
	return screenSchedules;
    }

    public void setScreenSchedules(List<Schedule> schedules)
    {
	try
	{
	    this.screenSchedules = new ArrayList<ScreenSchedule>();
	    ScreenSchedule currScreenSchedule = null;
	    DaySchedule currDaySchedule = null;
	    String screenId = "";
	    String date = "";
	    Iterator<Schedule> iterate = schedules.iterator();

	    while (iterate.hasNext())
	    {
		Schedule schedule = iterate.next();

		if (schedule.getScreenId().equals(screenId))
		{
		    if (schedule.getDate().equals(date))
		    {
			System.out.println("{ BOTH SCREEN AND DATE SAME }");
			currDaySchedule.getSchedules().add(schedule);
		    }
		    else
		    {
			System.out.println("{ SCREEN SAME AND DATE NOT SAME }");
			currDaySchedule = new DaySchedule();
			currDaySchedule.setDate(schedule.getDate());
			currDaySchedule.setDateName();
			currDaySchedule.setScheduled(schedule.isScheduled());
			currDaySchedule.setCanScheduled(schedule.isCanScheduled());
			currDaySchedule.getSchedules().add(schedule);
			currScreenSchedule.getDaySchedules().add(currDaySchedule);
		    }
		}
		else
		{
		    System.out.println("{ BOTH SCREEN AND DATE NOT SAME }");
		    currScreenSchedule = new ScreenSchedule();
		    currScreenSchedule.setScreenId(schedule.getScreenId());
		    currScreenSchedule.setScreenName(schedule.getScreenName());

		    currDaySchedule = new DaySchedule();
		    currDaySchedule.setDate(schedule.getDate());
		    currDaySchedule.setDateName();
		    currDaySchedule.setScheduled(schedule.isScheduled());
		    currDaySchedule.setCanScheduled(schedule.isCanScheduled());
		    currDaySchedule.getSchedules().add(schedule);

		    currScreenSchedule.getDaySchedules().add(currDaySchedule);

		    this.screenSchedules.add(currScreenSchedule);
		}

		screenId = schedule.getScreenId();
		date = schedule.getDate();
	    }
	    // logger.info(this.screenSchedules);
	}
	catch (Exception e)
	{
	    e.printStackTrace();
	}
    }
}
