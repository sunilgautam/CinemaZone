package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.TicketCost;

public class TicketCostIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TicketCostIndex.class);

    private List<TicketCost> ticketcosts;

    public String execute() throws Exception
    {
	logger.info("[Executing::" + TicketCostIndex.class + "]");
	DBAccess dbobj = new DBAccess();
	ticketcosts = dbobj.getAllTicketCost();
	return "success";
    }

    public List<TicketCost> getTicketcosts()
    {
	return ticketcosts;
    }

    public void setTicketcosts(List<TicketCost> ticketcosts)
    {
	this.ticketcosts = ticketcosts;
    }
}
