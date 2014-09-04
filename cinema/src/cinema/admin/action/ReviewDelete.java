package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Review;

public class ReviewDelete extends BaseAction implements ModelDriven<Review>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ReviewDelete.class);

    private Review review = new Review();

    public Review getReview()
    {
	return review;
    }

    public void setReview(Review review)
    {
	this.review = review;
    }

    @Override
    public Review getModel()
    {
	return review;
    }

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + ReviewDelete.class + "]");

	    DBAccess dbObj = new DBAccess();
	    long flag = dbObj.deleteReview(this.getReview());
	    if (flag > 0)
	    {
		this.getReview().setReviewId(String.valueOf(flag));
		addActionMessage(getText("review.delete.success"));
		result = "success";
	    }
	    else
	    {
		addActionError(getText("review.delete.unable"));
		result = "input";
	    }
	}
	return result;
    }
}
