package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Review;

public class ReviewView extends BaseAction implements ModelDriven<Review>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ReviewView.class);
    private Map<Integer, String> moviesList;

    private Review review = new Review();

    public String execute() throws Exception
    {
	logger.info("[Executing::" + ReviewView.class + "]");
	DBAccess dbObj = new DBAccess();
	this.setMoviesList(dbObj.getAllMovieList());
	this.review = dbObj.getReview(review.getReviewId());
	if (review == null)
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }

    @Override
    public Review getModel()
    {
	return review;
    }

    public Review getReview()
    {
	return review;
    }

    public void setReview(Review review)
    {
	this.review = review;
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
