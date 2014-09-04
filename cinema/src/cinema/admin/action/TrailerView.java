package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Trailer;

public class TrailerView extends BaseAction implements ModelDriven<Trailer>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TrailerView.class);
    private Map<Integer, String> moviesList;

    private Trailer trailer = new Trailer();

    public String execute() throws Exception
    {
	logger.info("[Executing::" + TrailerView.class + "]");
	DBAccess dbObj = new DBAccess();
	moviesList = dbObj.getAllMovieList();
	trailer = dbObj.getTrailer(trailer.getTrailerId());
	if (trailer == null)
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }

    public Trailer getTrailer()
    {
	return trailer;
    }

    public void setTrailer(Trailer trailer)
    {
	this.trailer = trailer;
    }

    @Override
    public Trailer getModel()
    {
	return trailer;
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
