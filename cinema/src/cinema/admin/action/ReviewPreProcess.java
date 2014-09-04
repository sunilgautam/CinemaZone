package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;

public class ReviewPreProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ReviewPreProcess.class);
    private Map<Integer, String> moviesList;

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + ReviewPreProcess.class + "]");
	DBAccess dbObj = new DBAccess();
	moviesList = dbObj.getAllMovieList();
	return "success";
    }

    public Map<Integer, String> getMoviesList()
    {
	return moviesList;
    }

    public void setMoviesList(Map<Integer, String> reviews)
    {
	this.moviesList = reviews;
    }
}
