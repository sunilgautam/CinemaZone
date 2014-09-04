package cinema.common;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

public class logout extends BaseAction
{

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(logout.class);

    public String execute() throws Exception
    {
	try
	{
	    logger.info("logging out.............");
	    // ServletActionContext.getRequest().getSession().invalidate();
	    getServletRequestObject().getSession(false).invalidate();
	    return "success";
	}
	catch (Exception ex)
	{
	    logger.error("Exception in logout::execute() second try\t!!" + ex);
	    // Again try to invalidate session
	    try
	    {
		logger.info("logging out second try.............");
		ServletActionContext.getRequest().getSession(false).invalidate();
		return "success";
	    }
	    catch (Exception exp)
	    {
		logger.error("Exception in logout::execute() second try\t!!" + exp);
		return "success";
	    }
	}
    }
}
