package cinema.admin.action;

import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Slider;

public class SliderView extends BaseAction implements ModelDriven<Slider>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SliderView.class);

    private Slider slider = new Slider();

    @Override
    public Slider getModel()
    {
	return slider;
    }

    public Slider getSlider()
    {
	return slider;
    }

    public void setSlider(Slider slider)
    {
	this.slider = slider;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + SliderView.class + "]");
	DBAccess dbobj = new DBAccess();
	slider = dbobj.getSlider(slider.getSliderId());
	if (slider == null)
	{
	    addActionError(getText("common.noresult"));
	}
	return "success";
    }
}
