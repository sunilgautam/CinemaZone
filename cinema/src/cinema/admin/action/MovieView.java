package cinema.admin.action;

import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Movie;

public class MovieView extends BaseAction implements ModelDriven<Movie>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(MovieView.class);

    private Movie movie = new Movie();

    public String execute() throws Exception
    {
	logger.info("[Executing::" + MovieView.class + "]");
	DBAccess dbObj = new DBAccess();
	movie = dbObj.getMovie(movie.getMovieId());
	if (movie == null)
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }

    public Movie getMovie()
    {
	return movie;
    }

    public void setMovie(Movie movie)
    {
	this.movie = movie;
    }

    @Override
    public Movie getModel()
    {
	return movie;
    }
}
