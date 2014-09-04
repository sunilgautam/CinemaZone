package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Screen;

public class ScreenIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScreenIndex.class);

    private List<Screen> screens;

    public List<Screen> getScreens()
    {
	return screens;
    }

    public void setScreens(List<Screen> screens)
    {
	this.screens = screens;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + ScreenIndex.class + "]");
	DBAccess dbobj = new DBAccess();
	screens = dbobj.getAllScreen();
	return "success";
    }
}