package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Screen;

public class ScreenView extends BaseAction implements ModelDriven<Screen>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScreenView.class);
    private Map<Integer, String> patterns;

    private Screen screen = new Screen();

    public String execute() throws Exception
    {
	logger.info("[Executing::" + ScreenView.class + "]");
	DBAccess dbObj = new DBAccess();
	patterns = dbObj.getSeatPatterns();
	screen = dbObj.getScreen(screen.getScreenId());
	if (screen == null)
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }

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

    public Map<Integer, String> getPatterns()
    {
	return patterns;
    }

    public void setPatterns(Map<Integer, String> patterns)
    {
	this.patterns = patterns;
    }
}
