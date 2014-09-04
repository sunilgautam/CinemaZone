package cinema.admin.action;

import java.util.Date;
import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Screen;
import cinema.util.CommonMethod;

public class SchedulePreProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SchedulePreProcess.class);
    private String screenId;
    private String screenName;
    private String scheduleDate;
    private Date scheduleDateName;
    private Map<Integer, String> moviesList;

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + SchedulePreProcess.class + "]");
	DBAccess dbObj = new DBAccess();
	moviesList = dbObj.getReleasedMovieList(this.scheduleDate);
	Screen screen = dbObj.getScreen(this.screenId);
	if (screen != null)
	{
	    this.screenName = screen.getScreenName();
	}
	this.setScheduleDateName();
	return "success";
    }

    public Map<Integer, String> getMoviesList()
    {
	return moviesList;
    }

    public void setMoviesList(Map<Integer, String> moviesList)
    {
	this.moviesList = moviesList;
    }

    public String getScheduleDate()
    {
	return scheduleDate;
    }

    public void setScheduleDate(String scheduleDate)
    {
	this.scheduleDate = scheduleDate;
    }

    public String getScreenId()
    {
	return screenId;
    }

    public void setScreenId(String screenId)
    {
	this.screenId = screenId;
    }

    public Date getScheduleDateName()
    {
	return scheduleDateName;
    }

    public void setScheduleDateName()
    {
	this.scheduleDateName = CommonMethod.customeStringToUtilDate(this.scheduleDate, "yyyy-MM-dd");
    }

    public String getScreenName()
    {
	return screenName;
    }

    public void setScreenName(String screenName)
    {
	this.screenName = screenName;
    }
}
