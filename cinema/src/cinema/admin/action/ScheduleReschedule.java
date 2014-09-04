package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Upload;
import cinema.util.CommonMethod;

public class ScheduleReschedule extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScheduleReschedule.class);
    private static final Gson gson = new Gson();

    private String screenId;
    private String scheduleDate;
    private String jsonResponse;

    @Override
    public void validate()
    {
	logger.info("[Validating::" + ScheduleReschedule.class + "]");
	if (this.getScreenId() == null || this.getScreenId().equals(""))
	{
	    addActionError(getText("schedule.blank.screen"));
	}

	if (this.getScheduleDate() == null || this.getScheduleDate().equals(""))
	{
	    addActionError(getText("schedule.blank.date"));
	}
	else
	{
	    if (!CommonMethod.customeIsDate(this.getScheduleDate(), "yyyy-MM-dd"))
	    {
		addActionError(getText("schedule.invalid.searchdate"));
	    }
	}

	if (hasActionErrors())
	{
	    jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", ""));
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + ScheduleReschedule.class + "]");

	    DBAccess dbobj = new DBAccess();
	    long flag = dbobj.reSchedule(this.screenId, this.scheduleDate);
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
	    result = "success";
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

    public String getScreenId()
    {
	return screenId;
    }

    public void setScreenId(String screenId)
    {
	this.screenId = screenId;
    }

    public String getScheduleDate()
    {
	return scheduleDate;
    }

    public void setScheduleDate(String scheduleDate)
    {
	this.scheduleDate = scheduleDate;
    }
}
