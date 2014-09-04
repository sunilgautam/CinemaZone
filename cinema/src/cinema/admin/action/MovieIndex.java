package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Movie;

public class MovieIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(MovieIndex.class);

    private List<Movie> movies;

    public List<Movie> getMovies()
    {
	return movies;
    }

    public void setMovies(List<Movie> movies)
    {
	this.movies = movies;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + MovieIndex.class + "]");
	DBAccess dbobj = new DBAccess();
	movies = dbobj.getAllMovie();
	return "success";
    }
}
