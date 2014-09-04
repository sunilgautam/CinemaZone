package cinema.admin.action;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Slider;

public class SliderDelete extends BaseAction implements ModelDriven<Slider>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SliderDelete.class);
    private Slider slider = new Slider();
    private String jsonResponse;

    public String execute() throws Exception
    {
	String result = "input";
	if (ServletActionContext.getRequest().getMethod().equals("POST"))
	{
	    logger.info("[Executing::" + SliderDelete.class + "]");

	    DBAccess dbobj = new DBAccess();
	    long flag = dbobj.deleteSlider(this.getSlider());
	    if (flag > 0)
	    {
		this.getSlider().setSliderId(String.valueOf(flag));
		addActionMessage(getText("slider.delete.success"));
		result = "success";
	    }
	    else
	    {
		addActionError(getText("slider.delete.unable"));
		result = "input";
	    }
	}
	return result;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }

    public Slider getSlider()
    {
	return slider;
    }

    public void setSlider(Slider slider)
    {
	this.slider = slider;
    }

    @Override
    public Slider getModel()
    {
	return slider;
    }
}
