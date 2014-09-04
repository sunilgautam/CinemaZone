package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Movie;

public class MovieDelete extends BaseAction implements ModelDriven<Movie>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(MovieDelete.class);

    private Movie movie = new Movie();

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

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + MovieDelete.class + "]");

	    DBAccess dbobj = new DBAccess();
	    long flag = dbobj.deleteMovie(this.getMovie());
	    switch ((int) flag)
	    {
		case 1:
		    addActionMessage(getText("movie.delete.success"));
		    result = "success";
		break;
		case -2:
		    addActionError(getText("movie.delete.unable.schedule"));
		    result = "input";
		break;
		default:
		    addActionError(getText("movie.delete.unable"));
		    result = "input";
		break;
	    }
	    
	    // 01 12 12
//	    if (flag > 0)
//	    {
//		this.getMovie().setMovieId(String.valueOf(flag));
//		addActionMessage(getText("movie.delete.success"));
//		result = "success";
//	    }
//	    else
//	    {
//		addActionError(getText("movie.delete.unable"));
//		result = "input";
//	    }
	}
	return result;
    }
}
