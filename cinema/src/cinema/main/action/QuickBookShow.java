package cinema.main.action;

import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Upload;
import com.google.gson.Gson;

public class QuickBookShow extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(QuickBookShow.class);
    private static final Gson gson = new Gson();
    
    private Map<String, String> screenAndShows;
    private String movieId;
    private String scheduleDate;
    private String jsonResponse;
    
    @Override
    public String execute() throws Exception
    {
	try
	{
	    logger.info("[Executing::" + QuickBookShow.class + "]");
	    if (this.getMovieId() == null || this.getMovieId().equals(""))
	    {
		throw new Exception();
	    }
	    else if (this.getScheduleDate() == null || this.getScheduleDate().equals(""))
	    {
		throw new Exception();
	    }
	    else
	    {
		DBAccess dbObj = new DBAccess();
		this.screenAndShows = dbObj.getQuickMovieScreenAndShow(this.getScheduleDate(), this.getMovieId());
		String jsonListShows = gson.toJson(this.screenAndShows);
		setJsonResponse(gson.toJson(new Upload(UPLOAD_SUCCESS, "", "", jsonListShows)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in execute(), QuickBookDate :" + ex);
	    setJsonResponse(gson.toJson(new Upload(UPLOAD_ERROR, "", "", getText("common.error"))));
	}
	return "success";
    }

    public Map<String, String> getScreenAndShows()
    {
	return screenAndShows;
    }

    public void setScreenAndShows(Map<String, String> screenAndShows)
    {
	this.screenAndShows = screenAndShows;
    }

    public String getMovieId()
    {
	return movieId;
    }

    public void setMovieId(String movieId)
    {
	this.movieId = movieId;
    }

    public String getScheduleDate()
    {
	return scheduleDate;
    }

    public void setScheduleDate(String scheduleDate)
    {
	this.scheduleDate = scheduleDate;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }
}
