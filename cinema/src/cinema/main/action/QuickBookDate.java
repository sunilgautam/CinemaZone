package cinema.main.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Upload;
import com.google.gson.Gson;

public class QuickBookDate extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(QuickBookDate.class);
    private static final Gson gson = new Gson();
    
    private List<String> scheduleDates;
    private String movieId;
    private String jsonResponse;
    
    @Override
    public String execute() throws Exception
    {
	try
	{
	    logger.info("[Executing::" + QuickBookDate.class + "]");
	    if (this.getMovieId() == null || this.getMovieId().equals(""))
	    {
		throw new Exception();
	    }
	    else
	    {
		DBAccess dbObj = new DBAccess();
		this.scheduleDates = dbObj.getQuickScheduleDates(this.movieId);
		String jsonListDates = gson.toJson(this.scheduleDates);
		setJsonResponse(gson.toJson(new Upload(UPLOAD_SUCCESS, "", "", jsonListDates)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in execute(), QuickBookDate :" + ex);
	    setJsonResponse(gson.toJson(new Upload(UPLOAD_ERROR, "", "", getText("common.error"))));
	}
	return "success";
    }
    
    public List<String> getScheduleDates()
    {
        return scheduleDates;
    }

    public void setScheduleDates(List<String> scheduleDates)
    {
        this.scheduleDates = scheduleDates;
    }

    public String getMovieId()
    {
	return movieId;
    }

    public void setMovieId(String movieId)
    {
	this.movieId = movieId;
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
