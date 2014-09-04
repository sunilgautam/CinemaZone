package cinema.admin.action;

import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.TicketCost;

public class TicketCostView extends BaseAction implements ModelDriven<TicketCost>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TicketCostView.class);

    private TicketCost ticketcost = new TicketCost();

    public String execute() throws Exception
    {
	logger.info("[Executing::" + TicketCostView.class + "]");
	DBAccess dbObj = new DBAccess();
	ticketcost = dbObj.getTicketCost(ticketcost.getTicketCostId());
	if (ticketcost == null)
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }

    @Override
    public TicketCost getModel()
    {
	return ticketcost;
    }

    public TicketCost getTicketcost()
    {
	return ticketcost;
    }

    public void setTicketcost(TicketCost ticketcost)
    {
	this.ticketcost = ticketcost;
    }
}
