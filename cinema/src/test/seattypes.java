package test;

import java.util.List;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.SeatType;

public class seattypes extends BaseAction {
    private static final long serialVersionUID = 1L;
    private List<SeatType> seattypes;

    @Override
    public String execute() throws Exception {
	DBAccess dbObj = new DBAccess();
	setSeattypes(dbObj.getAllSeatTypes());
	return "success";
    }

    public List<SeatType> getSeattypes() {
	return seattypes;
    }

    public void setSeattypes(List<SeatType> seattypes) {
	this.seattypes = seattypes;
    }
}
