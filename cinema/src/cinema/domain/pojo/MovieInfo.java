package cinema.domain.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import cinema.util.CommonMethod;

public class MovieInfo
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
    private Date releaseDateName;
    private String mainPosterPic;
    private boolean canBuy;
    List<String> otherPosterPic = new ArrayList<String>();

    public MovieInfo()
    {

    }

    public MovieInfo(String movieId, String movieName, String hours, String minutes, String director, String cast, String genre, String lang, String synopsis, String cbRating, String releaseDate, String mainPosterPic)
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
	this.mainPosterPic = mainPosterPic;
    }

    public MovieInfo(String movieId, String movieName, String hours, String minutes, String director, String cast, String genre, String lang, String synopsis, String cbRating, String releaseDate, String mainPosterPic, boolean parseDate)
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
	this.mainPosterPic = mainPosterPic;
	this.setReleaseDateName();
    }

    public List<String> getOtherPosterPic()
    {
	return otherPosterPic;
    }

    public void setOtherPosterPic(List<String> otherPosterPic)
    {
	this.otherPosterPic = otherPosterPic;
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

    public Date getReleaseDateName()
    {
	return releaseDateName;
    }

    public void setReleaseDateName()
    {
	this.releaseDateName = CommonMethod.customeStringToUtilDate(this.releaseDate, "yyyy-MM-dd");
    }

    public String getMainPosterPic()
    {
	return mainPosterPic;
    }

    public void setMainPosterPic(String mainPosterPic)
    {
	this.mainPosterPic = mainPosterPic;
    }

    public boolean isCanBuy()
    {
	return canBuy;
    }

    public void setCanBuy(boolean canBuy)
    {
	this.canBuy = canBuy;
    }
}
