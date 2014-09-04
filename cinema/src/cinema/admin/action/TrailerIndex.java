package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Trailer;

public class TrailerIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TrailerIndex.class);

    private List<Trailer> trailers;

    public List<Trailer> getTrailers()
    {
	return trailers;
    }

    public void setTrailers(List<Trailer> trailers)
    {
	this.trailers = trailers;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + TrailerIndex.class + "]");
	DBAccess dbobj = new DBAccess();
	trailers = dbobj.getAllTrailer();
	return "success";
    }
}