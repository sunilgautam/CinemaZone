package cinema.admin.action;

import java.util.List;
import org.apache.log4j.Logger;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Slider;

public class SliderIndex extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SliderIndex.class);

    private List<Slider> sliders;

    public List<Slider> getSliders()
    {
	return sliders;
    }

    public void setSliders(List<Slider> sliders)
    {
	this.sliders = sliders;
    }

    public String execute() throws Exception
    {
	logger.info("[Executing::" + SliderIndex.class + "]");
	DBAccess dbobj = new DBAccess();
	sliders = dbobj.getAllSlider();
	return "success";
    }
}
