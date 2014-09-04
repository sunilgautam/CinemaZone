package cinema.main.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.MovieInfo;
import cinema.domain.pojo.Review;
import cinema.domain.pojo.Slider;

public class Home extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(Home.class);

    private List<MovieInfo> moviesInfo;
    private List<MovieInfo> upcomingMoviesInfo;
    private List<Slider> sliders;
    private List<Review> reviews;
    private Map<Integer, String> moviesList;
    private Map<Integer, String> showClasses = new HashMap<Integer, String>();
    
    public String execute() throws Exception
    {
	logger.info("[Executing::" + Home.class + "]");
	DBAccess dbObj = new DBAccess();
	this.sliders = dbObj.getAllSlider();
	this.moviesInfo = dbObj.getMoviesForHome();
	this.upcomingMoviesInfo = dbObj.getUpComingMovies();
	this.reviews = dbObj.getAllReviewForHome();
	this.moviesList = dbObj.getAllMovieList();
	this.showClasses = dbObj.getShowClass();
	return "success";
    }

    public List<Review> getReviews()
    {
	return reviews;
    }

    public void setReviews(List<Review> reviews)
    {
	this.reviews = reviews;
    }

    public List<Slider> getSliders()
    {
	return sliders;
    }

    public void setSliders(List<Slider> sliders)
    {
	this.sliders = sliders;
    }

    public List<MovieInfo> getMoviesInfo()
    {
	return moviesInfo;
    }

    public void setMoviesInfo(List<MovieInfo> moviesInfo)
    {
	this.moviesInfo = moviesInfo;
    }

    public List<MovieInfo> getUpcomingMoviesInfo()
    {
	return upcomingMoviesInfo;
    }

    public void setUpcomingMoviesInfo(List<MovieInfo> upcomingMoviesInfo)
    {
	this.upcomingMoviesInfo = upcomingMoviesInfo;
    }

    public Map<Integer, String> getMoviesList()
    {
	return moviesList;
    }

    public void setMoviesList(Map<Integer, String> moviesList)
    {
	this.moviesList = moviesList;
    }

    public Map<Integer, String> getShowClasses()
    {
	return showClasses;
    }

    public void setShowClasses(Map<Integer, String> showClasses)
    {
	this.showClasses = showClasses;
    }
}
