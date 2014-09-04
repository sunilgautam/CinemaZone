package cinema.main.action;

import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;

public class UsersPreProcess extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(UsersPreProcess.class);

    private Map<Integer, String> citiesList = new HashMap<Integer, String>();

    public Map<Integer, String> getCitiesList()
    {
	return citiesList;
    }

    public void setCitiesList(Map<Integer, String> citiesList)
    {
	this.citiesList = citiesList;
    }

    @Override
    public String execute() throws Exception
    {
	logger.info("[Executing::" + UsersPreProcess.class + "]");
	DBAccess dbObj = new DBAccess();
	this.setCitiesList(dbObj.getCityList());
	return "success";
    }
}
