package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Poster;

public class PosterView extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(PosterView.class);

    private List<Poster> posters;
    private String movieId;
    private String movieName;

    public List<Poster> getPosters()
    {
	return posters;
    }

    public void setPosters(List<Poster> posters)
    {
	this.posters = posters;
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

    public String execute() throws Exception
    {
	logger.info("[Executing::" + PosterView.class + "]");
	DBAccess dbobj = new DBAccess();
	posters = dbobj.getAllPoster(movieId);
	if (posters.size() > 0)
	{
	    movieName = posters.get(0).getMovieName();
	}
	else
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }
}
