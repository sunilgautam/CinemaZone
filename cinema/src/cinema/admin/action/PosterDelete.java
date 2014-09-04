package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Poster;
import cinema.domain.pojo.Upload;

public class PosterDelete extends BaseAction implements ModelDriven<Poster>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(PosterDelete.class);
    private static final Gson gson = new Gson();

    private Poster poster = new Poster();
    private String jsonResponse;

    public Poster getPoster()
    {
	return poster;
    }

    public void setPoster(Poster poster)
    {
	this.poster = poster;
    }

    @Override
    public Poster getModel()
    {
	return poster;
    }

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + PosterDelete.class + "]");

	    DBAccess dbobj = new DBAccess();
	    long flag = dbobj.deletePoster(this.getPoster());
	    if (flag > 0)
	    {
		jsonResponse = gson.toJson(new Upload(UPLOAD_SUCCESS, "", "", ""));
		result = "success";
	    }
	    else
	    {
		jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", ""));
		result = "input";
	    }
	}
	return result;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }
}
