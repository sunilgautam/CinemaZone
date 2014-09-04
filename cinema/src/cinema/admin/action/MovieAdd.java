package cinema.admin.action;

import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Movie;
import cinema.util.CommonMethod;

public class MovieAdd extends BaseAction implements ModelDriven<Movie>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(MovieAdd.class);

    private Movie movie = new Movie();
    private String mode;

    public Movie getMovie()
    {
	return movie;
    }

    public void setMovie(Movie movie)
    {
	this.movie = movie;
    }

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    @Override
    public Movie getModel()
    {
	return movie;
    }

    public void validate()
    {
	logger.info("[Validating::" + MovieAdd.class + "]");
	if (this.getMovie().getMovieName() == null || this.getMovie().getMovieName().equals(""))
	{
	    addActionError(getText("movie.blank.name"));
	}

	if ((this.getMovie().getHours() == null || this.getMovie().getHours().equals("00")) && (this.getMovie().getHours() == null || this.getMovie().getHours().equals("00")))
	{
	    addActionError(getText("movie.blank.duration"));
	}

	if (this.getMovie().getDirector() == null || this.getMovie().getDirector().equals(""))
	{
	    addActionError(getText("movie.blank.director"));
	}

	if (this.getMovie().getCast() == null || this.getMovie().getCast().equals(""))
	{
	    addActionError(getText("movie.blank.cast"));
	}

	if (this.getMovie().getGenre() == null || this.getMovie().getGenre().equals(""))
	{
	    addActionError(getText("movie.blank.genre"));
	}

	if (this.getMovie().getLang() == null || this.getMovie().getLang().equals(""))
	{
	    addActionError(getText("movie.blank.lang"));
	}

	if (this.getMovie().getSynopsis() == null || this.getMovie().getSynopsis().equals(""))
	{
	    addActionError(getText("movie.blank.synopsis"));
	}

	if (this.getMovie().getCbRating() == null || this.getMovie().getCbRating().equals(""))
	{
	    addActionError(getText("movie.blank.cbRating"));
	}

	if (this.getMovie().getReleaseDate() == null || this.getMovie().getReleaseDate().equals(""))
	{
	    addActionError(getText("movie.blank.releaseDate"));
	}
	else
	{
	    if (!CommonMethod.isDate(this.getMovie().getReleaseDate()))
	    {
		addActionError(getText("movie.invalid.releaseDate"));
	    }
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	logger.info("[Executing::" + MovieAdd.class + "]");

	DBAccess dbobj = new DBAccess();
	if (this.getMode().equals("ADD"))
	{
	    long flag = dbobj.addMovie(this.getMovie());
	    if (flag > 0)
	    {
		this.getMovie().setMovieId(String.valueOf(flag));
		addActionMessage(getText("movie.add.success"));
		result = "success";
	    }
	    else
	    {
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("movie.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("movie.add.unable"));
			result = "input";
			break;
		}
	    }
	}
	else
	{
	    long flag = dbobj.editMovie(this.getMovie());
	    if (flag > 0)
	    {
		this.getMovie().setMovieId(String.valueOf(flag));
		addActionMessage(getText("movie.edit.success"));
		result = "success";
	    }
	    else
	    {
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("movie.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("movie.edit.unable"));
			result = "input";
			break;
		}
	    }
	}

	return result;
    }
}
