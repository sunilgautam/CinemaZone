package cinema.admin.action;

import org.apache.log4j.Logger;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Poster;
import cinema.domain.pojo.Upload;

public class PosterEdit extends BaseAction implements ModelDriven<Poster>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(PosterEdit.class);
    private static final Gson gson = new Gson();

    private Poster poster = new Poster();
    private String jsonResponse;
    private String mode;

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    @Override
    public Poster getModel()
    {
	return poster;
    }

    public void validate()
    {
	logger.info("[Validating::" + PosterEdit.class + "]");
	if (this.getPoster().getMovieId() == null || this.getPoster().getMovieId().equals(""))
	{
	    addActionError(getText("movie.blank.name"));
	}

	if (this.getPoster().isMainFlag() == false)
	{
	    addActionError("ERROR");
	}

	if (hasActionErrors())
	{
	    jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", ""));
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	logger.info("[Executing::" + PosterEdit.class + "]");

	DBAccess dbObj = new DBAccess();
	if (this.getMode().equals("EDIT"))
	{
	    long flag = dbObj.editPoster(this.getPoster());
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

    public Poster getPoster()
    {
	return poster;
    }

    public void setPoster(Poster poster)
    {
	this.poster = poster;
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
