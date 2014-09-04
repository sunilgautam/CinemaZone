package cinema.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import com.google.gson.Gson;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Schedule;
import cinema.domain.pojo.Upload;

public class ScheduleSchedule extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScheduleSchedule.class);
    private static final Gson gson = new Gson();

    private String screenId;
    private String scheduleDate;

    private int timeSlots1;
    private int timeSlots2;
    private int timeSlots3;
    private int timeSlots4;
    private int timeSlots5;
    private int timeSlots6;
    private int timeSlots7;

    private String movieId1;
    private String movieId2;
    private String movieId3;
    private String movieId4;
    private String movieId5;
    private String movieId6;
    private String movieId7;

    private Map<Integer, String> timeSlot = new HashMap<Integer, String>();

    private String jsonResponse;

    public void validate()
    {
	logger.info("[Validating::" + ScheduleSchedule.class + "]");

	boolean selected = false, showSelectProper = false, showSelectSequence = false;
	// VALIDATION
	// ROW 1
	if (this.timeSlots1 != 0 && !this.movieId1.equals("0"))
	{
	    selected = true;
	}
	else if (this.timeSlots1 == 0 && this.movieId1.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	// ROW 2
	if (this.timeSlots2 != 0 && !this.movieId2.equals("0"))
	{
	    if (this.timeSlots2 <= this.timeSlots1)
	    {
		showSelectSequence = true;
	    }
	    else
	    {
		selected = true;
	    }
	}
	else if (this.timeSlots2 == 0 && this.movieId2.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	// ROW 3
	if (this.timeSlots3 != 0 && !this.movieId3.equals("0"))
	{
	    if (this.timeSlots3 <= this.timeSlots2 || this.timeSlots3 <= this.timeSlots1)
	    {
		showSelectSequence = true;
	    }
	    else
	    {
		selected = true;
	    }
	}
	else if (this.timeSlots3 == 0 && this.movieId3.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	// ROW 4
	if (this.timeSlots4 != 0 && !this.movieId4.equals("0"))
	{
	    if (this.timeSlots4 <= this.timeSlots3 || this.timeSlots4 <= this.timeSlots2 || this.timeSlots4 <= this.timeSlots1)
	    {
		showSelectSequence = true;
	    }
	    else
	    {
		selected = true;
	    }
	}
	else if (this.timeSlots4 == 0 && this.movieId4.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	// ROW 5
	if (this.timeSlots5 != 0 && !this.movieId5.equals("0"))
	{
	    if (this.timeSlots5 <= this.timeSlots4 || this.timeSlots5 <= this.timeSlots3 || this.timeSlots5 <= this.timeSlots2 || this.timeSlots5 <= this.timeSlots1)
	    {
		showSelectSequence = true;
	    }
	    else
	    {
		selected = true;
	    }
	}
	else if (this.timeSlots5 == 0 && this.movieId5.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	// ROW 6
	if (this.timeSlots6 != 0 && !this.movieId6.equals("0"))
	{
	    if (this.timeSlots6 <= this.timeSlots5 || this.timeSlots6 <= this.timeSlots4 || this.timeSlots6 <= this.timeSlots3 || this.timeSlots6 <= this.timeSlots2 || this.timeSlots6 <= this.timeSlots1)
	    {
		showSelectSequence = true;
	    }
	    else
	    {
		selected = true;
	    }
	}
	else if (this.timeSlots6 == 0 && this.movieId6.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	// ROW 7
	if (this.timeSlots7 != 0 && !this.movieId7.equals("0"))
	{
	    if (this.timeSlots7 <= this.timeSlots6 || this.timeSlots7 <= this.timeSlots5 || this.timeSlots7 <= this.timeSlots4 || this.timeSlots7 <= this.timeSlots3 || this.timeSlots7 <= this.timeSlots2 || this.timeSlots7 <= this.timeSlots1)
	    {
		showSelectSequence = true;
	    }
	    else
	    {
		selected = true;
	    }
	}
	else if (this.timeSlots7 == 0 && this.movieId7.equals("0"))
	{
	    // NOTHING
	}
	else
	{
	    showSelectProper = true;
	}

	if (!selected)
	{
	    addActionError("Atleast schedule one show");
	}

	if (showSelectProper)
	{
	    addActionError("Select both show time and movie");
	}

	if (showSelectSequence)
	{
	    addActionError("Select show time in increasing order");
	}

	if (selected == true && showSelectProper == false && showSelectSequence == false)
	{
	    // FORM OK
	    this.setTimeSlot();
	}
	else
	{
	    // FORM NOT OK
	    addActionError("FORM NOT OK");
	}

	if (hasActionErrors())
	{
	    jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", getText("schedule.invalid.formdata")));
	}
    }

    public String execute() throws Exception
    {
	try
	{
	    logger.info("[Executing::" + ScheduleSchedule.class + "]");

	    // Build Schedule List
	    List<Schedule> schedules = new ArrayList<Schedule>();
	    if (this.timeSlots1 != 0 && !this.movieId1.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId1, this.scheduleDate, this.getTimeSlots1()));
	    }

	    if (this.timeSlots2 != 0 && !this.movieId2.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId2, this.scheduleDate, this.getTimeSlots2()));
	    }

	    if (this.timeSlots3 != 0 && !this.movieId3.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId3, this.scheduleDate, this.getTimeSlots3()));
	    }

	    if (this.timeSlots4 != 0 && !this.movieId4.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId4, this.scheduleDate, this.getTimeSlots4()));
	    }

	    if (this.timeSlots5 != 0 && !this.movieId5.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId5, this.scheduleDate, this.getTimeSlots5()));
	    }

	    if (this.timeSlots6 != 0 && !this.movieId6.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId6, this.scheduleDate, this.getTimeSlots6()));
	    }

	    if (this.timeSlots7 != 0 && !this.movieId7.equals("0"))
	    {
		schedules.add(new Schedule(this.screenId, this.movieId7, this.scheduleDate, this.getTimeSlots7()));
	    }

	    if (schedules.size() > 0)
	    {
		DBAccess dbObj = new DBAccess();
		if (dbObj.addSchedule(schedules))
		{
		    jsonResponse = gson.toJson(new Upload(UPLOAD_SUCCESS, "", "", ""));
		}
		else
		{
		    throw new Exception();
		}
	    }
	    else
	    {
		logger.error("Invalid schedules size() :");
		throw new Exception();
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in execute(), ScheduleSchedule :" + ex);
	    jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", getText("common.error")));
	}
	return "success";
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }

    public String getTimeSlots1()
    {
	return this.timeSlot.get(this.timeSlots1);
    }

    public void setTimeSlots1(int timeSlots1)
    {
	this.timeSlots1 = timeSlots1;
    }

    public String getTimeSlots2()
    {
	return this.timeSlot.get(this.timeSlots2);
    }

    public void setTimeSlots2(int timeSlots2)
    {
	this.timeSlots2 = timeSlots2;
    }

    public String getTimeSlots3()
    {
	return this.timeSlot.get(this.timeSlots3);
    }

    public void setTimeSlots3(int timeSlots3)
    {
	this.timeSlots3 = timeSlots3;
    }

    public String getTimeSlots4()
    {
	return this.timeSlot.get(this.timeSlots4);
    }

    public void setTimeSlots4(int timeSlots4)
    {
	this.timeSlots4 = timeSlots4;
    }

    public String getTimeSlots5()
    {
	return this.timeSlot.get(this.timeSlots5);
    }

    public void setTimeSlots5(int timeSlots5)
    {
	this.timeSlots5 = timeSlots5;
    }

    public String getTimeSlots6()
    {
	return this.timeSlot.get(this.timeSlots6);
    }

    public void setTimeSlots6(int timeSlots6)
    {
	this.timeSlots6 = timeSlots6;
    }

    public String getTimeSlots7()
    {
	return this.timeSlot.get(this.timeSlots7);
    }

    public void setTimeSlots7(int timeSlots7)
    {
	this.timeSlots7 = timeSlots7;
    }

    public String getMovieId1()
    {
	return movieId1;
    }

    public void setMovieId1(String movieId1)
    {
	this.movieId1 = movieId1;
    }

    public String getMovieId2()
    {
	return movieId2;
    }

    public void setMovieId2(String movieId2)
    {
	this.movieId2 = movieId2;
    }

    public String getMovieId3()
    {
	return movieId3;
    }

    public void setMovieId3(String movieId3)
    {
	this.movieId3 = movieId3;
    }

    public String getMovieId4()
    {
	return movieId4;
    }

    public void setMovieId4(String movieId4)
    {
	this.movieId4 = movieId4;
    }

    public String getMovieId5()
    {
	return movieId5;
    }

    public void setMovieId5(String movieId5)
    {
	this.movieId5 = movieId5;
    }

    public String getMovieId6()
    {
	return movieId6;
    }

    public void setMovieId6(String movieId6)
    {
	this.movieId6 = movieId6;
    }

    public String getMovieId7()
    {
	return movieId7;
    }

    public void setMovieId7(String movieId7)
    {
	this.movieId7 = movieId7;
    }

    public String getScreenId()
    {
	return screenId;
    }

    public void setScreenId(String screenId)
    {
	this.screenId = screenId;
    }

    public String getScheduleDate()
    {
	return scheduleDate;
    }

    public void setScheduleDate(String scheduleDate)
    {
	this.scheduleDate = scheduleDate;
    }

    public Map<Integer, String> getTimeSlot()
    {
	return timeSlot;
    }

    public void setTimeSlot()
    {
	this.timeSlot.put(1, "10:00 AM");
	this.timeSlot.put(2, "10:15 AM");
	this.timeSlot.put(3, "10:30 AM");
	this.timeSlot.put(4, "10:45 AM");
	this.timeSlot.put(5, "11:00 AM");
	this.timeSlot.put(6, "11:15 AM");
	this.timeSlot.put(7, "11:30 AM");
	this.timeSlot.put(8, "11:45 AM");
	this.timeSlot.put(9, "12:00 PM");
	this.timeSlot.put(10, "12:15 PM");
	this.timeSlot.put(11, "12:30 PM");
	this.timeSlot.put(12, "12:45 PM");
	this.timeSlot.put(13, "01:00 PM");
	this.timeSlot.put(14, "01:15 PM");
	this.timeSlot.put(15, "01:30 PM");
	this.timeSlot.put(16, "01:45 PM");
	this.timeSlot.put(17, "02:00 PM");
	this.timeSlot.put(18, "02:15 PM");
	this.timeSlot.put(19, "02:30 PM");
	this.timeSlot.put(20, "02:45 PM");
	this.timeSlot.put(21, "03:00 PM");
	this.timeSlot.put(22, "03:15 PM");
	this.timeSlot.put(23, "03:30 PM");
	this.timeSlot.put(24, "03:45 PM");
	this.timeSlot.put(25, "04:00 PM");
	this.timeSlot.put(26, "04:15 PM");
	this.timeSlot.put(27, "04:30 PM");
	this.timeSlot.put(28, "04:45 PM");
	this.timeSlot.put(29, "05:00 PM");
	this.timeSlot.put(30, "05:15 PM");
	this.timeSlot.put(31, "05:30 PM");
	this.timeSlot.put(32, "05:45 PM");
	this.timeSlot.put(33, "06:00 PM");
	this.timeSlot.put(34, "06:15 PM");
	this.timeSlot.put(35, "06:30 PM");
	this.timeSlot.put(36, "06:45 PM");
	this.timeSlot.put(37, "07:00 PM");
	this.timeSlot.put(38, "07:15 PM");
	this.timeSlot.put(39, "07:30 PM");
	this.timeSlot.put(40, "07:45 PM");
	this.timeSlot.put(41, "08:00 PM");
	this.timeSlot.put(42, "08:15 PM");
	this.timeSlot.put(43, "08:30 PM");
	this.timeSlot.put(44, "08:45 PM");
	this.timeSlot.put(45, "09:00 PM");
	this.timeSlot.put(46, "09:15 PM");
	this.timeSlot.put(47, "09:30 PM");
	this.timeSlot.put(48, "09:45 PM");
	this.timeSlot.put(49, "10:00 PM");
	this.timeSlot.put(50, "10:15 PM");
	this.timeSlot.put(51, "10:30 PM");
	this.timeSlot.put(52, "10:45 PM");
	this.timeSlot.put(53, "11:00 PM");
	this.timeSlot.put(54, "11:15 PM");
	this.timeSlot.put(55, "11:30 PM");
	this.timeSlot.put(56, "11:45 PM");
	this.timeSlot.put(57, "00:00 AM");
    }
}
