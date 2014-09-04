package cinema.main.action;

import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.MovieInfo;

public class MovieDetail extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(MovieDetail.class);

    private MovieInfo movieInfo;
    private String movieId;
    private String movieName;
    private String src;
    private String val;

    public MovieInfo getMovieInfo()
    {
	return movieInfo;
    }

    public void setMovieInfo(MovieInfo movieInfo)
    {
	this.movieInfo = movieInfo;
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

    public String getSrc()
    {
	return src;
    }

    public void setSrc(String src)
    {
	this.src = src;
    }

    public String getVal()
    {
	return val;
    }

    public void setVal(String val)
    {
	this.val = val;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + MovieDetail.class + "]");
	DBAccess dbObj = new DBAccess();
	this.movieInfo = dbObj.getMovieDetails(movieId);
	return "success";
    }
}
