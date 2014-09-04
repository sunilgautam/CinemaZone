package cinema.main.action;

import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import com.google.gson.Gson;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Movie;
import cinema.util.Constants;

public class SearchProvider implements Constants
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SearchProvider.class);
    private static final Gson gson = new Gson();

    public SearchProvider()
    {

    }

    public static void GetSearchList(HttpSession sessionObj) throws Exception
    {
	try
	{
	    logger.info("[Executing::" + SearchProvider.class + "]");
	    DBAccess dbObj = new DBAccess();
	    List<Movie> movieList = dbObj.getAllMovie();
	    String movieNames[] = new String[movieList.size()];

	    int counter = 0;
	    Iterator<Movie> mIterator = movieList.iterator();
	    while (mIterator.hasNext())
	    {
		movieNames[counter] = mIterator.next().getMovieName();
		counter++;
	    }

	    sessionObj.setAttribute(SEARCH_HANDLE, gson.toJson(movieNames));
	}
	catch (Exception ex)
	{
	    logger.info("Exception in GetSearchList(HttpSession sessionObj)");
	}
    }
}