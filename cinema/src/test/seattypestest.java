package test;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cinema.common.BaseAction;

public class seattypestest extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(seattypestest.class);
    
    private List<Double> dt1;
    private List<Double> dt0;
    private List<String> dt2 = new ArrayList<String>();
    
    @Override
    public String execute() throws Exception {
	logger.info("value dt1 => " + dt1);
	logger.info("value dt0 => " + dt0);
	for(int i = 0; i < dt1.size(); i++) {
	    dt2.add(dt0.get(i) + " => " + dt1.get(i));
	}
	logger.info("value dt2 => " + dt2);
        return "success";
    }

//    public String[] getDt1() {
//	return dt1.split(",");
//    }
//
//    public void setDt1(String dt1) {
//	this.dt1 = dt1;
//    }
    
    public List<Double> getDt1() {
	return dt1;
    }

    public void setDt1(List<Double> dt1) {
	this.dt1 = dt1;
    }

    public List<Double> getDt0() {
	return dt0;
    }

    public void setDt0(List<Double> dt0) {
	this.dt0 = dt0;
    }

    public List<String> getDt2() {
	return dt2;
    }

    public void setDt2(List<String> dt2) {
	this.dt2 = dt2;
    }
}
