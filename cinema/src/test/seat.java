package test;

import java.util.List;
import java.util.Map;

import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.SeatRow;

public class seat extends BaseAction {
    private static final long serialVersionUID = 1L;
    
    private Map<Integer, String> patterns;
    private List<SeatRow> seatrows;
    private List<String> seattypes;

    @Override
    public String execute() throws Exception {
	DBAccess dbObj = new DBAccess();
	patterns = dbObj.getSeatPatterns();
	seatrows = dbObj.getSeatConfiguration(1);
	seattypes = dbObj.getSeatTypeDetails(1);
	return "success";
    }

    public Map<Integer, String> getPatterns() {
	return patterns;
    }

    public void setPatterns(Map<Integer, String> patterns) {
	this.patterns = patterns;
    }

    public List<SeatRow> getSeatrows() {
	return seatrows;
    }

    public void setSeatrows(List<SeatRow> seatrows) {
	this.seatrows = seatrows;
    }

    public List<String> getSeattypes() {
	return seattypes;
    }

    public void setSeattypes(List<String> seattypes) {
	this.seattypes = seattypes;
    }
}
