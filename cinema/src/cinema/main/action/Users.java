package cinema.main.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Upload;
import cinema.domain.pojo.User;
import cinema.domain.pojo.UserInfo;
import cinema.template.mail.UserRegistration;
import cinema.util.CommonMethod;
import cinema.util.Constants;
import cinema.util.MailService;

public class Users extends BaseAction implements ModelDriven<User>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(Users.class);
    private static final Gson gson = new Gson();

    private User user = new User();
    private String mode;
    private String jsonResponse;
    private UserInfo uInfo;

    @Override
    public void validate()
    {
	logger.info("[Validating(mode=" + this.mode + ")::" + Users.class + "]");
	if (this.mode.equals("ADD"))
	{
	    if (this.getUser().getEmail() == null || this.getUser().getEmail().equals(""))
	    {
		addActionError(getText("register.blank.email"));
	    }
	    else if (!CommonMethod.isEmailValidator(this.getUser().getEmail()))
	    {
		addActionError(getText("register.invalid.email"));
	    }

	    if (this.getUser().getFirstName() == null || this.getUser().getFirstName().equals(""))
	    {
		addActionError(getText("register.blank.fname"));
	    }

	    if (this.getUser().getPassword() == null || this.getUser().getPassword().equals(""))
	    {
		addActionError(getText("register.blank.password"));
	    }
	    else if (this.getUser().getPassword().length() < 5)
	    {
		addActionError(getText("register.invalid.password"));
	    }

	    if (this.getUser().getConfPassword() == null || this.getUser().getConfPassword().equals(""))
	    {
		addActionError(getText("register.blank.confirm"));
	    }

	    if ((this.getUser().getPassword() != null || !this.getUser().getPassword().equals("")) && (this.getUser().getConfPassword() != null || !this.getUser().getConfPassword().equals("")))
	    {
		if (!this.getUser().getPassword().equals(this.getUser().getConfPassword()))
		{
		    addActionError(getText("register.invalid.confirm"));
		}
	    }

	    if (this.getUser().getGender() == null || this.getUser().getGender().equals(""))
	    {
		addActionError(getText("register.blank.gender"));
	    }

	    if (this.getUser().getCityId() == null || this.getUser().getCityId().equals(""))
	    {
		addActionError(getText("register.blank.city"));
	    }

	    if (this.getUser().getMobileNo() == null || this.getUser().getMobileNo().equals(""))
	    {
		addActionError(getText("register.blank.mobile"));
	    }
	    else if (!CommonMethod.isNumeric(this.getUser().getMobileNo()) || this.getUser().getMobileNo().length() != 10)
	    {
		addActionError(getText("register.invalid.mobile"));
	    }

	    if (hasActionErrors())
	    {
		setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("register.invalid.form"))));
	    }
	}
	else if (this.mode.equals("EDIT"))
	{

	}
	else if (this.mode.equals("DELETE"))
	{

	}
    }

    public String register() throws Exception
    {
	String result = "input";
	try
	{
	    logger.info("[Executing (mode=" + this.mode + ")::" + Users.class + "]");
	    DBAccess dbObj = new DBAccess();
	    long flag = dbObj.addUser(this.user);
	    if (flag > 0)
	    {
		// SEND EMAIL TO USER
		UserRegistration template = new UserRegistration();
		template.setSubject(Constants.MAIL_SUBJECT_USER_REGISTERATION);
		template.setUserName(this.user.getFirstName() + " " + this.user.getLastName());
		MailService.getInstance().send(this.user.getEmail(), template);

		this.user.setUserId(String.valueOf(flag));
		// START NEWLY REGISTRED USER'S SESSION
		this.uInfo = new UserInfo(this.user.getUserId(), this.user.getFirstName(), this.user.getLastName(), this.user.getGender(), this.user.getMobileNo(), this.user.getCityName(), this.user.getEmail());

		this.getSession().put(USER_HANDLE, this.uInfo);

		// CHECK SESSION
		if (this.getSession().get(USER_HANDLE) != null)
		{
		    logger.info("[USER SESSION DETAILS => " + ServletActionContext.getRequest().getSession(false).getAttribute(USER_HANDLE) + " SID => " + ServletActionContext.getRequest().getSession(false).getId() + " TIMEOUT => "
			    + ServletActionContext.getRequest().getSession(false).getMaxInactiveInterval() + "]");
		    setJsonResponse(gson.toJson(new Upload(LOGIN_SUCCESS, "", "", this.uInfo.toString())));
		}
		else
		{
		    throw new Exception();
		}
		result = "success";
	    }
	    else
	    {
		switch ((int) flag)
		{
		    case -2:
			setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("register.already"))));
			result = "input";
			break;
		    default:
			setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("register.add.unable"))));
			result = "input";
			break;
		}
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in register() " + ex);
	    setJsonResponse(gson.toJson(new Upload(LOGIN_ERROR, "", "", getText("register.add.unable"))));
	    result = "input";
	}
	return result;
    }

    @Override
    public String execute() throws Exception
    {
	return "success";
    }

    @Override
    public User getModel()
    {
	return user;
    }

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    public User getUser()
    {
	return user;
    }

    public void setUser(User user)
    {
	this.user = user;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }

    public UserInfo getuInfo()
    {
	return uInfo;
    }

    public void setuInfo(UserInfo uInfo)
    {
	this.uInfo = uInfo;
    }
}
