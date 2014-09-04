package cinema.admin.action;

import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.AdminInfo;

public class AdminLogin extends BaseAction
{

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(AdminLogin.class);

    private String uName;
    private String pWord;
    private boolean validated;
    private AdminInfo aInfo;

    public String getUName()
    {
	return uName;
    }

    public void setUName(String uName)
    {
	this.uName = uName;
    }

    public boolean isValidated()
    {
	return validated;
    }

    public void setValidated(boolean validated)
    {
	this.validated = validated;
    }

    public String getPWord()
    {
	return pWord;
    }

    public void setPWord(String pWord)
    {
	this.pWord = pWord;
    }

    @Override
    public void validate()
    {
	logger.info("[Validating::" + AdminLogin.class + "]");
	if (this.getUName() == null || this.getUName().equals(""))
	{
	    addActionError(getText("login.error.blankusername"));
	}
	if (this.getPWord() == null || this.getPWord().equals(""))
	{
	    addActionError(getText("login.error.blankpassword"));
	}
	if (!hasErrors())
	{
	    DBAccess dbObj = new DBAccess();
	    aInfo = dbObj.checkAdminLogin(uName, pWord);
	    if (aInfo == null)
	    {
		addActionError(getText("login.error.invalid"));
		this.setValidated(false);
	    }
	    else
	    {
		this.setValidated(true);
	    }
	}
	else
	{
	    this.setValidated(false);
	}
    }

    @Override
    public String execute() throws Exception
    {
	try
	{
	    logger.info("[Executing::" + AdminLogin.class + "]");
	    if (this.isValidated())
	    {
		// SET ADMIN SESSION
		HttpSession sessionObj = getServletRequestObject().getSession(true);
		sessionObj.setMaxInactiveInterval(ADMIN_SESSION_TIMEOUT);
		sessionObj.setAttribute(ADMIN_HANDLE, this.aInfo);

		// this.getSession().put(ADMIN_HANDLE, this.aInfo);

		// CHECK SESSION
		if (this.getSession().get(ADMIN_HANDLE) != null)
		{
		    logger.info("[SESSION DETAILS TESTING => " + sessionObj.getAttribute(ADMIN_HANDLE) + " SID => " + sessionObj.getId() + " TIMEOUT => " + sessionObj.getMaxInactiveInterval() + "]");
		}
		return "success";
	    }
	    else
	    {
		return "input";
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in AdminLogin::execute()\t!!" + ex);
	    addActionError(getText("login.error.unable"));
	    return "input";
	}
    }
}
