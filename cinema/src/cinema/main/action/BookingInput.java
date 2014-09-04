package cinema.main.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.MovieInfo;
import cinema.domain.pojo.Schedule;
import cinema.util.CommonMethod;

public class BookingInput extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BookingInput.class);

    private MovieInfo movieInfo;
    private String movieId;
    private String movieName;
    private Schedule schedule;
    private String scheduleId;
    private Map<String, String> screenAndShows = new HashMap<String, String>();
    private Map<Integer, String> showClasses = new HashMap<Integer, String>();
    private String mode;
    private Boolean noticeFlag;
    private Date dateName;
    private String selectedShow = "";
    
    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + BookingInput.class + "]");
	BookingManager.invalidateBookingSession(getServletRequestObject().getSession(false));
	DBAccess dbObj = new DBAccess();

	// CHECK MOVIE ID IF NOT THEN GO TO SCHEDULE PAGE
	if (movieId == null || movieId.equals(""))
	{
	    return "step-schedule";
	}

	if (mode == null || mode.equals(""))
	{
	    mode = "h";
	}

	if (mode.equals("h"))
	{
	    // GET LATEST SCHEDULE FOR MOVIE
	    this.scheduleId = dbObj.getLatestSchedule(movieId);

	    if (this.scheduleId == null || this.scheduleId.equals(""))
	    {
		setMovieInfo(dbObj);
		addActionError(getText("booking.no.schedule"));
	    }
	    else
	    {
		setMovieInfo(dbObj);

		// GET SCHEDULE INFO
		this.schedule = dbObj.getScheduleById(scheduleId);

		if (this.schedule != null)
		{
		    setDateName(this.schedule.getDate());
		    this.screenAndShows = dbObj.getMovieScreenAndShow(schedule);
		    this.showClasses = dbObj.getShowClass();
		}
		else
		{
		    logger.info("NO SCHEDULE FOUND");
		}
	    }
	}
	else if (mode.equals("s"))
	{
	    // GET SCHEDULE INFO
	    this.schedule = dbObj.getScheduleById(scheduleId);
	    if (this.schedule != null)
	    {
		this.movieId = this.schedule.getMovieId();
		setMovieInfo(dbObj);
		setDateName(this.schedule.getDate());
		setSelectedShow(this.schedule.getScreenId() + ":" + this.schedule.getScheduleId());
		this.screenAndShows = dbObj.getMovieScreenAndShow(schedule);
		this.showClasses = dbObj.getShowClass();
	    }
	    else
	    {
		logger.info("NO SCHEDULE FOUND");
	    }
	}
	else
	{
	    return "step-schedule";
	}

	return "step-input";
    }

    public MovieInfo getMovieInfo()
    {
	return movieInfo;
    }

    public void setMovieInfo(DBAccess dbObj)
    {
	this.movieInfo = dbObj.getMovieDetails(movieId);
	if (this.movieInfo != null)
	{
	    if (this.movieInfo.getCbRating().equals("A"))
	    {
		setNoticeFlag(true);
	    }
	    else
	    {
		setNoticeFlag(false);
	    }
	}
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

    public Schedule getSchedule()
    {
	return schedule;
    }

    public void setSchedule(Schedule schedule)
    {
	this.schedule = schedule;
    }

    public String getScheduleId()
    {
	return scheduleId;
    }

    public void setScheduleId(String scheduleId)
    {
	this.scheduleId = scheduleId;
    }

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    public Boolean getNoticeFlag()
    {
	return noticeFlag;
    }

    public void setNoticeFlag(Boolean noticeFlag)
    {
	this.noticeFlag = noticeFlag;
    }

    public Map<String, String> getScreenAndShows()
    {
	return screenAndShows;
    }

    public void setScreenAndShows(Map<String, String> screenAndShows)
    {
	this.screenAndShows = screenAndShows;
    }

    public Map<Integer, String> getShowClasses()
    {
	return showClasses;
    }

    public void setShowClasses(Map<Integer, String> showClasses)
    {
	this.showClasses = showClasses;
    }

    public Date getDateName()
    {
	return dateName;
    }

    public void setDateName(String dateNameStr)
    {
	this.dateName = CommonMethod.customeStringToUtilDate(dateNameStr, "yyyy-MM-dd");
    }

    public String getSelectedShow()
    {
	return selectedShow;
    }

    public void setSelectedShow(String selectedShow)
    {
	this.selectedShow = selectedShow;
    }
}
