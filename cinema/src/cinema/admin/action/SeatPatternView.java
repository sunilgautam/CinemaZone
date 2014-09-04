package cinema.admin.action;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.SeatRow;

public class SeatPatternView extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private List<SeatRow> seatrows;
    private List<String> seattypes;
    private int patternid;

    @Override
    public String execute() throws Exception
    {
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    DBAccess dbObj = new DBAccess();
	    seatrows = dbObj.getSeatConfiguration(patternid);
	    seattypes = dbObj.getSeatTypeDetails(patternid);
	}
	return "success";
    }

    public List<SeatRow> getSeatrows()
    {
	return seatrows;
    }

    public void setSeatrows(List<SeatRow> seatrows)
    {
	this.seatrows = seatrows;
    }

    public List<String> getSeattypes()
    {
	return seattypes;
    }

    public void setSeattypes(List<String> seattypes)
    {
	this.seattypes = seattypes;
    }

    public int getPatternid()
    {
	return patternid;
    }

    public void setPatternid(int patternid)
    {
	this.patternid = patternid;
    }
}
