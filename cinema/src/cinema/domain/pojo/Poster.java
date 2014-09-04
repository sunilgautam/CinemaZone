package cinema.domain.pojo;

public class Poster
{
    private String posterId;
    private String movieId;
    private String movieName;
    private String posterThumb;
    private boolean mainFlag;

    public Poster()
    {

    }

    public Poster(String posterId, String movieId, String movieName, String posterThumb, boolean mainFlag)
    {
	this.posterId = posterId;
	this.movieId = movieId;
	this.movieName = movieName;
	this.posterThumb = posterThumb;
	this.setMainFlag(mainFlag);
    }

    public String getPosterId()
    {
	return posterId;
    }

    public void setPosterId(String posterId)
    {
	this.posterId = posterId;
    }

    public String getMovieId()
    {
	return movieId;
    }

    public void setMovieId(String movieId)
    {
	this.movieId = movieId;
    }

    public String getPosterThumb()
    {
	return posterThumb;
    }

    public void setPosterThumb(String posterThumb)
    {
	this.posterThumb = posterThumb;
    }

    public String getMovieName()
    {
	return movieName;
    }

    public void setMovieName(String movieName)
    {
	this.movieName = movieName;
    }

    public boolean isMainFlag()
    {
	return mainFlag;
    }

    public void setMainFlag(boolean mainFlag)
    {
	this.mainFlag = mainFlag;
    }
}
