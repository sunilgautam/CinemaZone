package cinema.admin.action;

import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.TicketCost;
import cinema.util.CommonMethod;

public class TicketCostAdd extends BaseAction implements ModelDriven<TicketCost>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TicketCostAdd.class);

    private TicketCost ticketcost = new TicketCost();
    private String mode;

    public String getMode()
    {
	return mode;
    }

    public TicketCost getTicketcost()
    {
	return ticketcost;
    }

    public void setTicketcost(TicketCost ticketcost)
    {
	this.ticketcost = ticketcost;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    @Override
    public TicketCost getModel()
    {
	return ticketcost;
    }

    public void validate()
    {
	logger.info("[Validating::" + TicketCostAdd.class + "]");
	if (this.getTicketcost().getTicketCost() == null || this.getTicketcost().getTicketCost().equals(""))
	{
	    addActionError(getText("ticketcost.blank.cost"));
	}
	else if (!CommonMethod.isFloating(this.getTicketcost().getTicketCost()))
	{
	    addActionError(getText("ticketcost.invalid.cost"));
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	logger.info("[Executing::" + TicketCostAdd.class + "]");

	DBAccess dbObj = new DBAccess();
	if (this.getMode().equals("ADD"))
	{
	    result = "input";
	}
	else
	{
	    long flag = dbObj.editTicketCost(this.getTicketcost());
	    if (flag > 0)
	    {
		this.getTicketcost().setTicketCostId(String.valueOf(flag));
		addActionMessage(getText("ticketcost.edit.success"));
		result = "success";
	    }
	    else
	    {
		switch ((int) flag)
		{
		    case -2:
			addActionError(getText("ticketcost.already"));
			result = "input";
			break;
		    default:
			addActionError(getText("ticketcost.edit.unable"));
			result = "input";
			break;
		}
	    }
	}

	return result;
    }
}
