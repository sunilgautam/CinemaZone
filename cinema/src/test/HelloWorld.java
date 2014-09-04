package test;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import cinema.common.BaseAction;
import cinema.domain.pojo.Trailer;

public class HelloWorld extends BaseAction {
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(HelloWorld.class);
	
	private List<String> comboMeals;
	
	private String jsonData;
	
	private String userName;
	
	private String path;
	
	private String datas;
	
	public List<String> getComboMeals() {
		return comboMeals;
	}

	public void setComboMeals(List<String> comboMeals) {
		this.comboMeals = comboMeals;
	}

	public String execute() {
		Gson gson = new Gson();
		comboMeals = new ArrayList<String>();
		comboMeals.add("Snack Plate");
		comboMeals.add("Dinner Plate");
		comboMeals.add("Colonel Chicken Rice Combo");
		comboMeals.add("Colonel Burger");
		comboMeals.add("O.R. Fillet Burger");
		comboMeals.add("Zinger Burger");
		//userName = "SUNIL GAUTAM" + ServletActionContext.getRequest().getParameter("data");
		userName = "SUNIL GAUTAM" + datas;
		
		Trailer tr = new Trailer("trailerId", "movieId", "movieName", "trailerLink");
		
		jsonData = gson.toJson(tr);
		
		path = ServletActionContext.getServletContext().getRealPath("/posters");
		return SUCCESS;
	}
	
//	private data detail;
//
//	public HelloWorld() {
//	}
//
//	public String execute() {
//		this.detail = new data();
//		logger.info("<========== executing ==========>");
//		logger.info(detail);
//		logger.info("<====================>");
//		return "SUCCESS";
//	}
//
//	public data getDetail() {
//		return detail;
//	}
//
//	public void setDetail(data detail) {
//		this.detail = detail;
//	}

	public String getUserName() {
		logger.info("<========== getting username ==========>");
		return userName;
	}

	public void setUserName(String userName) {
		logger.info("<========== setting username ==========>");
		this.userName = userName;
	}

	public String getDatas() {
		return datas;
	}

	public void setDatas(String datas) {
		this.datas = datas;
	}

	public String getJsonData() {
	    return jsonData;
	}

	public void setJsonData(String jsonData) {
	    this.jsonData = jsonData;
	}

	public String getPath() {
	    return path;
	}

	public void setPath(String path) {
	    this.path = path;
	}
}