package cinema.main.action;

import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import com.google.gson.Gson;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Upload;
import cinema.domain.pojo.UserInfo;

public class UserLogin extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(UserLogin.class);
    private static final Gson gson = new Gson();

    private String mode;
    private String uName;
    private String pWord;
    private UserInfo uInfo;
    private String jsonResponse;

    public String getUName()
    {
	return uName;
    }

    public void setUName(String uName)
    {
	this.uName = uName;
    }

    public String getPWord()
    {
	return pWord;
    }

    public void setPWord(String pWord)
    {
	this.pWord = pWord;
    }

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    public UserInfo getuInfo()
    {
	return uInfo;
    }

    public void setuInfo(UserInfo uInfo)
    {
	this.uInfo = uInfo;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }

    @Override
    public void validate()
    {
	logger.info("[Validating(mode=" + this.mode + ")::" + UserLogin.class + "]");
	if (this.getUName() == null || this.getUName().equals(""))
	{
	    addActionError(getText("login.error.blank"));
	}
	if (this.getPWord() == null || this.getPWord().equals(""))
	{
	    addActionError(getText("login.error.blank"));
	}
	if (hasActionErrors())
	{
	    setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("login.error.blank"))));
	}
    }

    @Override
    public String execute() throws Exception
    {
	try
	{
	    logger.info("[Executing::" + UserLogin.class + "]");
	    // VALIDATE USER
	    DBAccess dbObj = new DBAccess();
	    this.uInfo = dbObj.checkUserLogin(uName, pWord);
	    if (this.uInfo == null)
	    {
		setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("login.error.invalid"))));
	    }
	    else
	    {
		// SET USER SESSION
		HttpSession sessionObj = getServletRequestObject().getSession(true);
		sessionObj.setMaxInactiveInterval(USER_SESSION_TIMEOUT);
		sessionObj.setAttribute(USER_HANDLE, this.uInfo);

		// CHECK SESSION
		if (this.getSession().get(USER_HANDLE) != null)
		{
		    // logger.info("[USER SESSION DETAILS => " +
		    // ServletActionContext.getRequest().getSession(false).getAttribute(USER_HANDLE)
		    // + " SID => " +
		    // ServletActionContext.getRequest().getSession(false).getId()
		    // + " TIMEOUT => " +
		    // ServletActionContext.getRequest().getSession(false).getMaxInactiveInterval()
		    // + "]");
		    // setJsonResponse(gson.toJson(new Upload(LOGIN_SUCCESS, "",
		    // "", this.uInfo.toString())));

		    logger.info("[USER SESSION DETAILS => " + sessionObj.getAttribute(USER_HANDLE) + " SID => " + sessionObj.getId() + " TIMEOUT => " + sessionObj.getMaxInactiveInterval() + "]");
		    setJsonResponse(gson.toJson(new Upload(LOGIN_SUCCESS, "", "", this.uInfo.toString())));
		}
		else
		{
		    throw new Exception();
		}
	    }
	    return "success";
	}
	catch (Exception ex)
	{
	    logger.error("Exception in authenticate() " + ex);
	    setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("login.error.unable"))));
	    return "input";
	}
    }
}
