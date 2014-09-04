package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Trailer;

public class TrailerDelete extends BaseAction implements ModelDriven<Trailer>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TrailerDelete.class);

    private Trailer trailer = new Trailer();

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

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + TrailerDelete.class + "]");

	    DBAccess dbobj = new DBAccess();
	    long flag = dbobj.deleteTrailer(this.getTrailer());
	    if (flag > 0)
	    {
		this.getTrailer().setTrailerId(String.valueOf(flag));
		addActionMessage(getText("trailer.delete.success"));
		result = "success";
	    }
	    else
	    {
		addActionError(getText("trailer.delete.unable"));
		result = "input";
	    }
	}
	return result;
    }
}
