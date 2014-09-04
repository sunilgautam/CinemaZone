package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Trailer;

public class TrailerAdd extends BaseAction implements ModelDriven<Trailer>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TrailerAdd.class);

    private Trailer trailer = new Trailer();
    private String mode;
    private Map<Integer, String> moviesList;

    public Trailer getTrailer()
    {
	return trailer;
    }

    public void setTrailer(Trailer trailer)
    {
	this.trailer = trailer;
    }

    public Map<Integer, String> getMoviesList()
    {
	return moviesList;
    }

    public void setMoviesList(Map<Integer, String> moviesList)
    {
	this.moviesList = moviesList;
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
    public Trailer getModel()
    {
	return trailer;
    }

    public void validate()
    {
	logger.info("[Validating::" + TrailerAdd.class + "]");
	if (this.getTrailer().getMovieId() == null || this.getTrailer().getMovieId().equals(""))
	{
	    addActionError(getText("trailer.blank.movie"));
	}

	if (this.getTrailer().getTrailerLink() == null || this.getTrailer().getTrailerLink().equals(""))
	{
	    addActionError(getText("trailer.blank.link"));
	}

	if (hasActionErrors())
	{
	    DBAccess dbObj = new DBAccess();
	    moviesList = dbObj.getAllMovieList();
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	logger.info("[Executing::" + TrailerAdd.class + "]");

	DBAccess dbObj = new DBAccess();
	if (this.getMode().equals("ADD"))
	{
	    long flag = dbObj.addTrailer(this.getTrailer());
	    if (flag > 0)
	    {
		this.getTrailer().setTrailerId(String.valueOf(flag));
		addActionMessage(getText("trailer.add.success"));
		result = "success";
	    }
	    else
	    {
		moviesList = dbObj.getAllMovieList();
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("trailer.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("trailer.add.unable"));
			result = "input";
			break;
		}
	    }
	}
	else
	{
	    long flag = dbObj.editTrailer(this.getTrailer());
	    if (flag > 0)
	    {
		this.getTrailer().setTrailerId(String.valueOf(flag));
		addActionMessage(getText("trailer.edit.success"));
		result = "success";
	    }
	    else
	    {
		moviesList = dbObj.getAllMovieList();
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("trailer.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("trailer.edit.unable"));
			result = "input";
			break;
		}
	    }
	}

	return result;
    }
}
