package cinema.domain.pojo;

public class Movie
{
    private String movieId;
    private String movieName;
    private String duration;
    private String hours;
    private String minutes;
    private String director;
    private String cast;
    private String genre;
    private String lang;
    private String synopsis;
    private String cbRating;
    private String releaseDate;

    public Movie()
    {

    }

    public Movie(String movieId, String movieName, String hours, String minutes, String director, String cast, String genre, String lang, String synopsis, String cbRating, String releaseDate)
    {
	this.movieId = movieId;
	this.movieName = movieName;
	this.hours = hours;
	this.minutes = minutes;
	this.director = director;
	this.cast = cast;
	this.genre = genre;
	this.lang = lang;
	this.synopsis = synopsis;
	this.cbRating = cbRating;
	this.releaseDate = releaseDate;
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

    public String getDuration()
    {
	return hours + " : " + minutes;
    }

    public void setDuration(String duration)
    {
	this.duration = duration;
    }

    public String getHours()
    {
	return hours;
    }

    public void setHours(String hours)
    {
	this.hours = hours;
    }

    public String getMinutes()
    {
	return minutes;
    }

    public void setMinutes(String minutes)
    {
	this.minutes = minutes;
    }

    public String getDirector()
    {
	return director;
    }

    public void setDirector(String director)
    {
	this.director = director;
    }

    public String getCast()
    {
	return cast;
    }

    public void setCast(String cast)
    {
	this.cast = cast;
    }

    public String getGenre()
    {
	return genre;
    }

    public void setGenre(String genre)
    {
	this.genre = genre;
    }

    public String getLang()
    {
	return lang;
    }

    public void setLang(String lang)
    {
	this.lang = lang;
    }

    public String getSynopsis()
    {
	return synopsis;
    }

    public void setSynopsis(String synopsis)
    {
	this.synopsis = synopsis;
    }

    public String getCbRating()
    {
	return cbRating;
    }

    public void setCbRating(String cbRating)
    {
	this.cbRating = cbRating;
    }

    public String getReleaseDate()
    {
	return releaseDate;
    }

    public void setReleaseDate(String releaseDate)
    {
	this.releaseDate = releaseDate;
    }
}
