package cinema.domain.pojo;

public class Trailer
{
    private String trailerId;
    private String movieId;
    private String movieName;
    private String trailerLink;

    public Trailer()
    {

    }

    public Trailer(String trailerId, String movieId, String movieName, String trailerLink)
    {
	this.trailerId = trailerId;
	this.movieId = movieId;
	this.movieName = movieName;
	this.trailerLink = trailerLink;
    }

    public String getTrailerId()
    {
	return trailerId;
    }

    public void setTrailerId(String trailerId)
    {
	this.trailerId = trailerId;
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

    public String getTrailerLink()
    {
	return trailerLink;
    }

    public void setTrailerLink(String trailerLink)
    {
	this.trailerLink = trailerLink;
    }
}
