package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;

public class ScreenPreProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScreenPreProcess.class);
    private Map<Integer, String> patterns;

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + ScreenPreProcess.class + "]");
	DBAccess dbObj = new DBAccess();
	patterns = dbObj.getSeatPatterns();
	return "success";
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
