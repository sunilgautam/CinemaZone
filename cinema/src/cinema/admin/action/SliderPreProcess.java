package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;

public class SliderPreProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SliderPreProcess.class);
    private Map<Integer, String> moviesList;

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + SliderPreProcess.class + "]");
	DBAccess dbObj = new DBAccess();
	moviesList = dbObj.getAllMoviesWithoutSlider();
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
}
