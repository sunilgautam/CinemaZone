package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Screen;

public class ScreenDelete extends BaseAction implements ModelDriven<Screen>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScreenDelete.class);

    private Screen screen = new Screen();

    public Screen getScreen()
    {
	return screen;
    }

    public void setScreen(Screen screen)
    {
	this.screen = screen;
    }

    @Override
    public Screen getModel()
    {
	return screen;
    }

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + ScreenDelete.class + "]");

	    DBAccess dbobj = new DBAccess();
	    long flag = dbobj.deleteScreen(this.getScreen());
	    if (flag > 0)
	    {
		this.getScreen().setScreenId(String.valueOf(flag));
		addActionMessage(getText("screen.delete.success"));
		result = "success";
	    }
	    else
	    {
		addActionError(getText("screen.delete.unable"));
		result = "input";
	    }
	}
	return result;
    }
}
