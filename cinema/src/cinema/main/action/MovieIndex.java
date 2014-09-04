package cinema.main.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.MovieInfo;

public class MovieIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(MovieIndex.class);

    private List<MovieInfo> moviesInfo;
    private List<MovieInfo> upcomingMoviesInfo;

    public List<MovieInfo> getMoviesInfo()
    {
	return moviesInfo;
    }

    public void setMoviesInfo(List<MovieInfo> moviesInfo)
    {
	this.moviesInfo = moviesInfo;
    }

    public List<MovieInfo> getUpcomingMoviesInfo()
    {
	return upcomingMoviesInfo;
    }

    public void setUpcomingMoviesInfo(List<MovieInfo> upcomingMoviesInfo)
    {
	this.upcomingMoviesInfo = upcomingMoviesInfo;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + MovieIndex.class + "]");
	DBAccess dbObj = new DBAccess();
	this.moviesInfo = dbObj.getMoviesForHome();
	this.upcomingMoviesInfo = dbObj.getUpComingMovies();
	return "success";
    }
}
