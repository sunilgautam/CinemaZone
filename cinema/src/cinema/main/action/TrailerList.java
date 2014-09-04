package cinema.main.action;

import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Logger;
import com.google.gson.Gson;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Trailer;
import cinema.domain.pojo.Upload;

public class TrailerList extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TrailerList.class);
    private static final Gson gson = new Gson();

    private List<Trailer> trailers;
    private String jsonResponse;

    public List<Trailer> getTrailers()
    {
	return trailers;
    }

    public void setTrailers(List<Trailer> trailers)
    {
	this.trailers = trailers;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + TrailerList.class + "]");
	DBAccess dbobj = new DBAccess();
	trailers = dbobj.getAllTrailer();
	extractYoutubeLink(trailers);
	this.setJsonResponse(gson.toJson(trailers));
	// trailers.clear();
	jsonResponse = gson.toJson(new Upload(UPLOAD_SUCCESS, gson.toJson(trailers), "", ""));
	// jsonResponse = gson.toJson(trailers);
	return "success";
    }

    public void extractYoutubeLink(List<Trailer> trailers)
    {
	Iterator<Trailer> tIterator = trailers.iterator();
	Trailer tObj = null;
	String link = null;
	while (tIterator.hasNext())
	{
	    tObj = tIterator.next();
	    link = tObj.getTrailerLink();

	    if (link.contains("embed/"))
	    {
		link = link.substring(link.lastIndexOf("embed/"));
		link = link.replaceFirst("embed/", "");

		if (link.contains("?"))
		{
		    link = link.substring(0, link.indexOf("?"));
		}

		if (link.contains("&"))
		{
		    link = link.substring(0, link.indexOf("&"));
		}

		if (link.contains("="))
		{
		    link = link.substring(0, link.indexOf("="));
		}

		tObj.setTrailerLink(link);
	    }
	}
    }
}
