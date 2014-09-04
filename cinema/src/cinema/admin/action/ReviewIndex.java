package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Review;

public class ReviewIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ReviewIndex.class);

    private List<Review> reviews;

    public List<Review> getReviews()
    {
	return reviews;
    }

    public void setReviews(List<Review> reviews)
    {
	this.reviews = reviews;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + ReviewIndex.class + "]");
	DBAccess dbObj = new DBAccess();
	this.reviews = dbObj.getAllReview();
	return "success";
    }
}
