package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Review;

public class ReviewAdd extends BaseAction implements ModelDriven<Review>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ReviewAdd.class);

    private Review review = new Review();
    private String mode;
    private Map<Integer, String> moviesList;

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

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    @Override
    public Review getModel()
    {
	return review;
    }

    public void validate()
    {
	logger.info("[Validating::" + ReviewAdd.class + "]");
	if (this.getReview().getMovieId() == null || this.getReview().getMovieId().equals(""))
	{
	    addActionError(getText("review.blank.movie"));
	}

	if (this.getReview().getReview() == null || this.getReview().getReview().equals(""))
	{
	    addActionError(getText("review.blank.review"));
	}

	if (this.getReview().getReviewBy() == null || this.getReview().getReviewBy().equals(""))
	{
	    addActionError(getText("review.blank.reviewby"));
	}

	if (this.getReview().getStars() == null || this.getReview().getStars().equals(""))
	{
	    addActionError(getText("review.blank.stars"));
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
	logger.info("[Executing::" + ReviewAdd.class + "]");

	DBAccess dbObj = new DBAccess();
	if (this.getMode().equals("ADD"))
	{
	    long flag = dbObj.addReview(this.getReview());
	    if (flag > 0)
	    {
		this.getReview().setReviewId(String.valueOf(flag));
		addActionMessage(getText("review.add.success"));
		result = "success";
	    }
	    else
	    {
		moviesList = dbObj.getAllMovieList();
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("review.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("review.add.unable"));
			result = "input";
			break;
		}
	    }
	}
	else
	{
	    long flag = dbObj.editReview(this.getReview());
	    if (flag > 0)
	    {
		this.getReview().setReviewId(String.valueOf(flag));
		addActionMessage(getText("review.edit.success"));
		result = "success";
	    }
	    else
	    {
		moviesList = dbObj.getAllMovieList();
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("review.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("review.edit.unable"));
			result = "input";
			break;
		}
	    }
	}

	return result;
    }
}
