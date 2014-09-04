package cinema.domain.pojo;

public class Schedule
{
    private String scheduleId;
    private String scheduleTime;
    private String movieId;
    private String movieName;

    private String date;
    private boolean scheduled;
    private boolean canScheduled;
    private boolean canBooked;
    private String screenId;
    private String screenName;

    public Schedule()
    {

    }

    public Schedule(String screenId, String movieId, String date, String scheduleTime)
    {
	this.screenId = screenId;
	this.movieId = movieId;
	this.date = date;
	this.scheduleTime = scheduleTime;
    }

    public Schedule(String scheduleId, String scheduleTime, String movieId, String movieName, String date, boolean scheduled, String screenId, String screenName, boolean canScheduled)
    {
	this.scheduleId = scheduleId;
	this.scheduleTime = scheduleTime;
	this.movieId = movieId;
	this.movieName = movieName;
	this.date = date;
	this.scheduled = scheduled;
	this.screenId = screenId;
	this.screenName = screenName;
	this.canScheduled = canScheduled;
    }

    public Schedule(String scheduleId, String scheduleTime, String movieId, String movieName, String date, boolean scheduled, String screenId, String screenName, boolean canBooked, boolean userFlag)
    {
	this.scheduleId = scheduleId;
	this.scheduleTime = scheduleTime;
	this.movieId = movieId;
	this.movieName = movieName;
	this.date = date;
	this.scheduled = scheduled;
	this.screenId = screenId;
	this.screenName = screenName;
	this.canBooked = canBooked;
    }

    public String getScheduleId()
    {
	return scheduleId;
    }

    public void setScheduleId(String scheduleId)
    {
	this.scheduleId = scheduleId;
    }

    public String getScheduleTime()
    {
	return scheduleTime;
    }

    public void setScheduleTime(String scheduleTime)
    {
	this.scheduleTime = scheduleTime;
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

    public String getDate()
    {
	return date;
    }

    public void setDate(String date)
    {
	this.date = date;
    }

    public boolean isScheduled()
    {
	return scheduled;
    }

    public void setScheduled(boolean scheduled)
    {
	this.scheduled = scheduled;
    }

    public String getScreenId()
    {
	return screenId;
    }

    public void setScreenId(String screenId)
    {
	this.screenId = screenId;
    }

    public String getScreenName()
    {
	return screenName;
    }

    public void setScreenName(String screenName)
    {
	this.screenName = screenName;
    }

    @Override
    public String toString()
    {
	return this.screenId + " " + this.date + " " + this.movieId + " " + this.scheduleTime + " " + this.scheduleId;
    }

    public boolean isCanScheduled()
    {
	return canScheduled;
    }

    public void setCanScheduled(boolean canScheduled)
    {
	this.canScheduled = canScheduled;
    }

    public boolean isCanBooked()
    {
	return canBooked;
    }

    public void setCanBooked(boolean canBooked)
    {
	this.canBooked = canBooked;
    }
}
