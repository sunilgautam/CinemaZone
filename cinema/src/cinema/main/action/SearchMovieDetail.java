package cinema.main.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.MovieInfo;

public class SearchMovieDetail extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SearchMovieDetail.class);

    private List<MovieInfo> moviesInfo;
    private String search;

    public String getSearch()
    {
	return search;
    }

    public void setSearch(String search)
    {
	this.search = search;
    }

    public List<MovieInfo> getMoviesInfo()
    {
	return moviesInfo;
    }

    public void setMoviesInfo(List<MovieInfo> moviesInfo)
    {
	this.moviesInfo = moviesInfo;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + SearchMovieDetail.class + "]");
	DBAccess dbObj = new DBAccess();
	this.moviesInfo = dbObj.searchMovies(this.search);
	return "success";
    }
}
