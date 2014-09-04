package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Screen;

public class ScreenAdd extends BaseAction implements ModelDriven<Screen>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScreenAdd.class);

    private Screen screen = new Screen();
    private String mode;
    private Map<Integer, String> patterns;

    public Screen getScreen()
    {
	return screen;
    }

    public void setScreen(Screen screen)
    {
	this.screen = screen;
    }

    public Map<Integer, String> getPatterns()
    {
	return patterns;
    }

    public void setPatterns(Map<Integer, String> patterns)
    {
	this.patterns = patterns;
    }

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    @Override
    public Screen getModel()
    {
	return screen;
    }

    public void validate()
    {
	logger.info("[Validating::" + ScreenAdd.class + "]");
	if (this.getScreen().getScreenName() == null || this.getScreen().getScreenName().equals(""))
	{
	    addActionError(getText("screen.blankname"));
	}

	if (this.getScreen().getSeatPatternId() == null || this.getScreen().getSeatPatternId().equals(""))
	{
	    addActionError(getText("screen.blank.pattern"));
	}

	if (hasActionErrors())
	{
	    DBAccess dbObj = new DBAccess();
	    patterns = dbObj.getSeatPatterns();
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	logger.info("[Executing::" + ScreenAdd.class + "]");

	DBAccess dbObj = new DBAccess();
	if (this.getMode().equals("ADD"))
	{
	    long flag = dbObj.addScreen(this.getScreen());
	    logger.info("flag => " + flag);
	    if (flag > 0)
	    {
		this.getScreen().setScreenId(String.valueOf(flag));
		addActionMessage(getText("screen.add.success"));
		result = "success";
	    }
	    else
	    {
		patterns = dbObj.getSeatPatterns();
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("screen.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("screen.add.unable"));
			result = "input";
			break;
		}
	    }
	}
	else
	{
	    long flag = dbObj.editScreen(this.getScreen());
	    if (flag > 0)
	    {
		this.getScreen().setScreenId(String.valueOf(flag));
		addActionMessage(getText("screen.edit.success"));
		result = "success";
	    }
	    else
	    {
		patterns = dbObj.getSeatPatterns();
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("screen.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("screen.edit.unable"));
			result = "input";
			break;
		}
	    }
	}

	return result;
    }
}
