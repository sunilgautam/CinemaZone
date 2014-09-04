package cinema.admin.action;

import java.util.Map;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ModelDriven;
import cinema.common.BaseAction;
import cinema.dbaccess.DBAccess;
import cinema.domain.pojo.Slider;

public class SliderAdd extends BaseAction implements ModelDriven<Slider>
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SliderAdd.class);

    private Slider slider = new Slider();
    private String mode;
    private Map<Integer, String> moviesList;

    public Slider getSlider()
    {
	return slider;
    }

    public void setSlider(Slider slider)
    {
	this.slider = slider;
    }

    public Map<Integer, String> getMoviesList()
    {
	return moviesList;
    }

    public void setMoviesList(Map<Integer, String> moviesList)
    {
	this.moviesList = moviesList;
    }

    public String getMode()
    {
	return mode;
    }

    public void setMode(String mode)
    {
	this.mode = mode;
    }

    @Override
    public Slider getModel()
    {
	return slider;
    }

    public void validate()
    {
	logger.info("[Validating::" + SliderAdd.class + "]");
	if (this.getSlider().getMovieId() == null || this.getSlider().getMovieId().equals(""))
	{
	    addActionError(getText("slider.blank.movie"));
	}

	if (this.getSlider().getSliderPic() == null || this.getSlider().getSliderPic().equals(""))
	{
	    addActionError(getText("slider.blank.image"));
	}

	if (hasActionErrors())
	{
	    DBAccess dbObj = new DBAccess();
	    moviesList = dbObj.getAllMoviesWithoutSlider();
	}
    }

    public String execute() throws Exception
    {
	String result = "input";
	logger.info("[Executing::" + SliderAdd.class + "]");

	DBAccess dbObj = new DBAccess();
	if (this.getMode().equals("ADD"))
	{
	    long flag = dbObj.addSlider(this.getSlider());

	    if (flag > 0)
	    {
		this.getSlider().setSliderId(String.valueOf(flag));
		addActionMessage(getText("slider.add.success"));
		result = "success";
	    }
	    else
	    {
		moviesList = dbObj.getAllMoviesWithoutSlider();
		switch ((int) flag)
		{
		    default:
			addActionError(getText("slider.add.unable"));
			result = "input";
			break;
		}
	    }
	}

	return result;
    }
}
