package cinema.domain.pojo;

public class Slider
{
    private String sliderId;
    private String movieId;
    private String movieName;
    private String sliderPic;

    public Slider()
    {

    }

    public Slider(String sliderId, String movieId, String movieName, String sliderPic)
    {
	super();
	this.sliderId = sliderId;
	this.movieId = movieId;
	this.movieName = movieName;
	this.sliderPic = sliderPic;
    }

    public String getSliderId()
    {
	return sliderId;
    }

    public void setSliderId(String sliderId)
    {
	this.sliderId = sliderId;
    }

    public String getMovieId()
    {
	return movieId;
    }

    public void setMovieId(String movieId)
    {
	this.movieId = movieId;
    }

    public String getMovieName()
    {
	return movieName;
    }

    public void setMovieName(String movieName)
    {
	this.movieName = movieName;
    }

    public String getSliderPic()
    {
	return sliderPic;
    }

    public void setSliderPic(String sliderPic)
    {
	this.sliderPic = sliderPic;
    }
}
