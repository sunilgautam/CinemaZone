package cinema.dbaccess;

import cinema.domain.pojo.AdminInfo;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.Movie;
import cinema.domain.pojo.MovieInfo;
import cinema.domain.pojo.Poster;
import cinema.domain.pojo.Review;
import cinema.domain.pojo.Schedule;
import cinema.domain.pojo.Screen;
import cinema.domain.pojo.SeatCell;
import cinema.domain.pojo.SeatRow;
import cinema.domain.pojo.SeatType;
import cinema.domain.pojo.Slider;
import cinema.domain.pojo.TicketCost;
import cinema.domain.pojo.Trailer;
import cinema.domain.pojo.User;
import cinema.domain.pojo.UserInfo;
import cinema.util.CommonMethod;
import cinema.util.SQLResourceBundle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

public class DBAccess extends AbstractDbModel
{
    private static final Logger logger = Logger.getLogger(DBAccess.class);

    public DBAccess()
    {

    }

    public AdminInfo checkAdminLogin(String userName, String passWord)
    {
	AdminInfo aInfo = null;
	try
	{
	    logger.info("Checking Admin Login....");

	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.check_admin_login);
	    this.cStmt.setString(1, userName);
	    this.cStmt.setString(2, passWord);

	    this.executeQuery();
	    while (this.res.next())
	    {
		if (this.res.getBoolean(1))
		{
		    aInfo = new AdminInfo(this.res.getString(2), this.res.getString(3), this.res.getString(4));
		}
		else
		{
		    logger.info("Invalid User !!");
		}
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in checkAdminLogin(String userName, String passWord)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return aInfo;
    }

    public UserInfo checkUserLogin(String email, String passWord)
    {
	UserInfo uInfo = null;
	try
	{
	    logger.info("Checking User Login....");

	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.check_user_login);
	    this.cStmt.setString(1, email);
	    this.cStmt.setString(2, passWord);

	    this.executeQuery();
	    while (this.res.next())
	    {
		if (this.res.getBoolean(1))
		{
		    uInfo = new UserInfo(this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(8), this.res.getString(9));
		}
		else
		{
		    logger.info("Invalid User !!");
		}
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in checkUserLogin(String email, String passWord)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return uInfo;
    }

    /************************************************** { SCREEN } *************************************************/
    public long addScreen(Screen screen)
    {
	long result = -99;
	try
	{
	    logger.info("Adding screen.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.screens_proc_aud_add);
	    this.cStmt.setString(1, screen.getSeatPatternId());
	    this.cStmt.setString(2, screen.getScreenName());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
		// logger.info("RESULT : " + result);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addScreen(Screen screen)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long editScreen(Screen screen)
    {
	long result = -99;
	try
	{
	    logger.info("Editing screen.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.screens_proc_aud_edit);
	    this.cStmt.setString(1, screen.getScreenId());
	    this.cStmt.setString(2, screen.getSeatPatternId());
	    this.cStmt.setString(3, screen.getScreenName());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editScreen(Screen screen)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deleteScreen(Screen screen)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting screen.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.screens_proc_aud_delete);
	    this.cStmt.setString(1, screen.getScreenId());

	    return this.cStmt.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deleteScreen(Screen screen)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public Screen getScreen(String screen_id)
    {
	Screen screen = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.screens_proc_get_find);
	    this.cStmt.setString(1, screen_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		screen = new Screen(this.res.getString(1), this.res.getString(4), this.res.getString(3), this.res.getString(5));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getScreen(String screen_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return screen;
    }

    public List<Screen> getAllScreen()
    {
	List<Screen> screens = new ArrayList<Screen>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.screens_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		screens.add(new Screen(this.res.getString(1), this.res.getString(4), this.res.getString(3), this.res.getString(5)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllScreen()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return screens;
    }

    /************************************************** { SCREEN END } *************************************************/

    /************************************************** { MOVIE } *************************************************/
    public long addMovie(Movie movie)
    {
	long result = -99;
	try
	{
	    logger.info("Adding Movie.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_aud_add);
	    this.cStmt.setString(1, movie.getMovieName());
	    this.cStmt.setString(2, movie.getHours());
	    this.cStmt.setString(3, movie.getMinutes());
	    this.cStmt.setString(4, movie.getDirector());
	    this.cStmt.setString(5, movie.getCast());
	    this.cStmt.setString(6, movie.getGenre());
	    this.cStmt.setString(7, movie.getLang());
	    this.cStmt.setString(8, movie.getSynopsis());
	    this.cStmt.setString(9, movie.getCbRating());
	    this.cStmt.setDate(10, CommonMethod.stringToSqlDate(movie.getReleaseDate()));

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addMovie(Movie movie)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long editMovie(Movie movie)
    {
	long result = -99;
	try
	{
	    logger.info("Editing movie.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_aud_edit);
	    this.cStmt.setString(1, movie.getMovieId());
	    this.cStmt.setString(2, movie.getMovieName());
	    this.cStmt.setString(3, movie.getHours());
	    this.cStmt.setString(4, movie.getMinutes());
	    this.cStmt.setString(5, movie.getDirector());
	    this.cStmt.setString(6, movie.getCast());
	    this.cStmt.setString(7, movie.getGenre());
	    this.cStmt.setString(8, movie.getLang());
	    this.cStmt.setString(9, movie.getSynopsis());
	    this.cStmt.setString(10, movie.getCbRating());
	    this.cStmt.setDate(11, CommonMethod.stringToSqlDate(movie.getReleaseDate()));

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editMovie(Movie movie)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deleteMovie(Movie movie)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting movie.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_aud_delete);
	    this.cStmt.setString(1, movie.getMovieId());
	    
	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deleteMovie(Movie movie)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public Movie getMovie(String movie_id)
    {
	Movie movie = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_find);
	    this.cStmt.setString(1, movie_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		movie = new Movie(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getMovie(String movie_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movie;
    }

    public List<Movie> getAllMovie()
    {
	List<Movie> movies = new ArrayList<Movie>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		movies.add(new Movie(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllMovie()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movies;
    }

    public List<Movie> getAllRemovedMovie()
    {
	List<Movie> movies = new ArrayList<Movie>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_removed);
	    this.executeQuery();
	    while (this.res.next())
	    {
		movies.add(new Movie(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllRemovedMovie()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movies;
    }

    public Map<Integer, String> getAllMovieList()
    {
	Map<Integer, String> movies = new HashMap<Integer, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		movies.put(this.res.getInt(1), this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllMovieList()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movies;
    }

    public Map<Integer, String> getReleasedMovieList(String releaseDate)
    {
	Map<Integer, String> movies = new HashMap<Integer, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_forschedule);
	    this.cStmt.setString(1, releaseDate);

	    this.executeQuery();
	    while (this.res.next())
	    {
		movies.put(this.res.getInt(1), this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getReleasedMovieList(String releaseDate)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movies;
    }

    public List<MovieInfo> getMoviesForHome()
    {
	List<MovieInfo> moviesInfo = new ArrayList<MovieInfo>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_forhome);

	    this.executeQuery();
	    while (this.res.next())
	    {
		moviesInfo.add(new MovieInfo(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11), this.res.getString(12)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getMoviesForHome()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return moviesInfo;
    }

    public List<MovieInfo> getUpComingMovies()
    {
	List<MovieInfo> moviesInfo = new ArrayList<MovieInfo>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_upcoming);

	    this.executeQuery();
	    while (this.res.next())
	    {
		moviesInfo.add(new MovieInfo(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11), this.res.getString(12), true));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getUpComingMovies()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return moviesInfo;
    }

    public MovieInfo getMovieDetails(String movie_id)
    {
	MovieInfo movieInfoObj = null;
	List<String> otherPosterPic = new ArrayList<String>();
	String otherPosters = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_details);
	    this.cStmt.setString(1, movie_id);
	    this.executeQuery();

	    if (this.res.next())
	    {
		movieInfoObj = new MovieInfo(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11), this.res.getString(12));
		otherPosters = this.res.getString(13);
		String buyFlag = this.res.getString(14);
		if (buyFlag != null && buyFlag.equals("Y"))
		{
		    movieInfoObj.setCanBuy(true);
		}
		else
		{
		    movieInfoObj.setCanBuy(false);
		}
		if (otherPosters != null && !otherPosters.equals(""))
		{
		    String otherPostersArr[] = otherPosters.split(",");
		    for (String item : otherPostersArr)
		    {
			otherPosterPic.add(item.trim());
		    }
		    movieInfoObj.setOtherPosterPic(otherPosterPic);
		}
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getMovieDetails()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movieInfoObj;
    }

    public List<MovieInfo> searchMovies(String seachText)
    {
	List<MovieInfo> moviesInfo = new ArrayList<MovieInfo>();
	MovieInfo movieInfoObj = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.movies_proc_get_search);
	    this.cStmt.setString(1, seachText);
	    this.executeQuery();

	    while (this.res.next())
	    {
		movieInfoObj = new MovieInfo(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8), this.res.getString(9), this.res.getString(10), this.res.getString(11), this.res.getString(12), true);
		String buyFlag = this.res.getString(13);
		if (buyFlag != null && buyFlag.equals("Y"))
		{
		    movieInfoObj.setCanBuy(true);
		}
		else
		{
		    movieInfoObj.setCanBuy(false);
		}
		moviesInfo.add(movieInfoObj);
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in searchMovies(String seachText)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return moviesInfo;
    }

    /************************************************** { MOVIE END } *************************************************/

    /************************************************** { SEAT } *************************************************/

    public Map<Integer, String> getSeatPatterns()
    {
	Map<Integer, String> patterns = new HashMap<Integer, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.seat_patterns_proc_get);
	    this.executeQuery();
	    while (this.res.next())
	    {
		patterns.put(this.res.getInt(1), this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSeatPatterns()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return patterns;
    }

    public List<SeatType> getAllSeatTypes()
    {
	List<SeatType> seattypes = new ArrayList<SeatType>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.seat_types_proc_get_all);
	    this.executeQuery();

	    while (this.res.next())
	    {
		seattypes.add(new SeatType(this.res.getString(1), this.res.getString(2), this.res.getString(3)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllSeatTypes()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return seattypes;
    }
    
    public SeatType getSeatType(String seat_type_id, String movie_id)
    {
	SeatType seattype = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.seat_types_proc_getbyid);
	    this.cStmt.setString(1, seat_type_id);
	    this.cStmt.setString(2, movie_id);
	    this.executeQuery();

	    if (this.res.next())
	    {
		seattype = new SeatType(this.res.getString(1), this.res.getString(2), this.res.getString(3));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSeatType(String seat_type_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return seattype;
    }

    /************************************************** { SEAT END } *************************************************/

    /************************************************** { SEAT CONFIG } *************************************************/

    public List<SeatRow> getSeatConfiguration(int patternid)
    {
	List<SeatRow> seatrows = new ArrayList<SeatRow>();
	SeatRow seatrowsObj = null;
	String row, curr_row;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.seat_config_proc_get);
	    this.cStmt.setInt(1, patternid);
	    this.executeQuery();
	    row = "";
	    while (this.res.next())
	    {
		curr_row = this.res.getString(4);
		// logger.info("curr_row : " + curr_row + " row : " + row +
		// " test== : " + (curr_row.equals(row)));
		if (!curr_row.equals(row))
		{
		    row = curr_row;

		    if (null != seatrowsObj)
		    {
			seatrows.add(seatrowsObj);
		    }

		    seatrowsObj = new SeatRow();
		    seatrowsObj.setNo(row);
		    seatrowsObj.getCells().add(new SeatCell(res.getInt(5), res.getString(3), res.getInt(6)));
		}
		else
		{
		    seatrowsObj.getCells().add(new SeatCell(res.getInt(5), res.getString(3), res.getInt(6)));
		}
	    }
	    if (null != seatrowsObj)
	    {
		seatrows.add(seatrowsObj);
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSeatConfiguration(int patternid)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return seatrows;
    }

    public List<String> getSeatTypeDetails(int patternid)
    {
	List<String> seattypes = new ArrayList<String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.seat_types_proc_get);
	    this.cStmt.setInt(1, patternid);
	    this.executeQuery();

	    while (this.res.next())
	    {
		seattypes.add("[" + this.res.getString(1) + "] : " + this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSeatTypeDetails(int patternid)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return seattypes;
    }

    /************************************************** { SEAT CONFIG END } *************************************************/

    /************************************************** { TRAILER } *************************************************/
    public long addTrailer(Trailer trailer)
    {
	long result = -99;
	try
	{
	    logger.info("Adding trailer.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.trailers_proc_aud_add);
	    this.cStmt.setString(1, trailer.getMovieId());
	    this.cStmt.setString(2, trailer.getTrailerLink());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addTrailer(Trailer trailer)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long editTrailer(Trailer trailer)
    {
	long result = -99;
	try
	{
	    logger.info("Editing trailer.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.trailers_proc_aud_edit);
	    this.cStmt.setString(1, trailer.getTrailerId());
	    this.cStmt.setString(2, trailer.getMovieId());
	    this.cStmt.setString(3, trailer.getTrailerLink());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editTrailer(Trailer trailer)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deleteTrailer(Trailer trailer)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting trailer.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.trailers_proc_aud_delete);
	    this.cStmt.setString(1, trailer.getTrailerId());

	    return this.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deleteTrailer(Trailer trailer)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public Trailer getTrailer(String trailer_id)
    {
	Trailer trailer = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.trailers_proc_get_find);
	    this.cStmt.setString(1, trailer_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		trailer = new Trailer(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getTrailer(String trailer_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return trailer;
    }

    public List<Trailer> getAllTrailer()
    {
	List<Trailer> trailers = new ArrayList<Trailer>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.trailers_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		trailers.add(new Trailer(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllTrailer()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return trailers;
    }

    /************************************************** { TRAILER END } *************************************************/

    /************************************************** { TICKET COST } *************************************************/
    public long editTicketCost(TicketCost ticketcost)
    {
	long result = -99;
	try
	{
	    logger.info("Editing ticketcost.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.ticket_costs_proc_aud_edit);
	    this.cStmt.setString(1, ticketcost.getTicketCostId());
	    this.cStmt.setString(2, ticketcost.getTicketCost());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editTicketCost(TicketCost ticketcost)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public TicketCost getTicketCost(String ticket_cost_id)
    {
	TicketCost ticketcost = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.ticket_costs_proc_get_find);
	    this.cStmt.setString(1, ticket_cost_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		ticketcost = new TicketCost(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getTicketCost(String ticket_cost_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return ticketcost;
    }

    public List<TicketCost> getAllTicketCost()
    {
	List<TicketCost> ticketcosts = new ArrayList<TicketCost>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.ticket_costs_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		ticketcosts.add(new TicketCost(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllTicketCost()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return ticketcosts;
    }

    /************************************************** { TICKET COST END } *************************************************/

    /************************************************** { POSTER } *************************************************/
    public long addPoster(Poster poster)
    {
	long result = -99;
	try
	{
	    logger.info("Adding poster.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.posters_proc_aud_add);
	    this.cStmt.setString(1, poster.getMovieId());
	    this.cStmt.setString(2, poster.getPosterThumb());
	    this.cStmt.setBoolean(3, poster.isMainFlag());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addPoster(Poster poster)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long editPoster(Poster poster)
    {
	long result = -99;
	try
	{
	    logger.info("Editing poster.......");

	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.posters_proc_aud_edit);
	    this.cStmt.setString(1, poster.getPosterId());
	    this.cStmt.setString(2, poster.getMovieId());
	    this.cStmt.setBoolean(3, poster.isMainFlag());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editPoster(Poster poster)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deletePoster(Poster poster)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting poster.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.posters_proc_aud_delete);
	    this.cStmt.setString(1, poster.getPosterId());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deletePoster(Poster poster)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public Poster getPoster(String poster_id)
    {
	Poster poster = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.posters_proc_get_find);
	    this.cStmt.setString(1, poster_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		poster = new Poster(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getBoolean(5));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getPoster(String poster_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return poster;
    }

    public List<Poster> getAllPoster(String movie_id)
    {
	List<Poster> posters = new ArrayList<Poster>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.posters_proc_get_findbymovie);
	    this.cStmt.setString(1, movie_id);
	    this.executeQuery();
	    while (this.res.next())
	    {
		posters.add(new Poster(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getBoolean(5)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllPoster(String movie_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return posters;
    }

    /************************************************** { POSTER END } *************************************************/

    /************************************************** { SLIDER } *************************************************/
    public long addSlider(Slider slider)
    {
	long result = -99;
	try
	{
	    logger.info("Adding slider.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.sliders_proc_aud_add);
	    this.cStmt.setString(1, slider.getMovieId());
	    this.cStmt.setString(2, slider.getSliderPic());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addSlider(Slider slider)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deleteSlider(Slider slider)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting slider.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.sliders_proc_aud_delete);
	    this.cStmt.setString(1, slider.getSliderId());

	    return this.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deleteSlider(Slider slider)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public Slider getSlider(String slider_id)
    {
	Slider slider = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.sliders_proc_get_find);
	    this.cStmt.setString(1, slider_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		slider = new Slider(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSlider(String slider_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return slider;
    }

    public List<Slider> getAllSlider()
    {
	List<Slider> sliders = new ArrayList<Slider>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.sliders_proc_get_all);

	    this.executeQuery();
	    while (this.res.next())
	    {
		sliders.add(new Slider(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllSlider()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return sliders;
    }

    public Map<Integer, String> getAllMoviesWithoutSlider()
    {
	Map<Integer, String> movies = new HashMap<Integer, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.sliders_proc_get_findmoviewithout);

	    this.executeQuery();
	    while (this.res.next())
	    {
		movies.put(this.res.getInt(1), this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllMoviesWithoutSlider()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return movies;
    }

    /************************************************** { SLIDER END } *************************************************/

    /************************************************** { SCHEDULE } *************************************************/
    public boolean addSchedule(List<Schedule> schedules)
    {
	boolean result = false;
	try
	{
	    logger.info("Adding schedules.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_aud_add);
	    for (int i = 0; i < schedules.size(); i++)
	    {
		this.cStmt.setString(1, schedules.get(i).getScreenId());
		this.cStmt.setString(2, schedules.get(i).getMovieId());
		this.cStmt.setString(3, schedules.get(i).getDate());
		this.cStmt.setString(4, schedules.get(i).getScheduleTime());
		this.cStmt.addBatch();
	    }

	    return this.executeBatchUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addSchedule(List<Schedule> schedules)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long reSchedule(String screenId, String scheduleDate)
    {
	long result = -99;
	try
	{
	    logger.info("Rescheduling.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_aud_reschedule);
	    this.cStmt.setString(1, screenId);
	    this.cStmt.setString(2, scheduleDate);

	    return this.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in reSchedule(String screenId, String scheduleDate)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public List<Schedule> getAllSchedule()
    {
	List<Schedule> schedules = new ArrayList<Schedule>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		schedules.add(new Schedule(this.res.getString(5), this.res.getString(7), this.res.getString(3), this.res.getString(4), this.res.getString(6), this.res.getBoolean(8), this.res.getString(1), this.res.getString(2), this.res.getBoolean(9)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllSchedule()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return schedules;
    }

    public List<Schedule> getSchedule(String scheduleDate)
    {
	List<Schedule> schedules = new ArrayList<Schedule>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_get_find);
	    this.cStmt.setDate(1, CommonMethod.stringToSqlDate(scheduleDate));
	    this.executeQuery();
	    while (this.res.next())
	    {
		schedules.add(new Schedule(this.res.getString(5), this.res.getString(7), this.res.getString(3), this.res.getString(4), this.res.getString(6), true, this.res.getString(1), this.res.getString(2), true));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSchedule(String scheduleDate)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return schedules;
    }

    public Schedule getScheduleById(String schedule_id)
    {
	Schedule schedule = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_get_findid);
	    this.cStmt.setString(1, schedule_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		schedule = new Schedule(this.res.getString(5), this.res.getString(7), this.res.getString(3), this.res.getString(4), this.res.getString(6), true, this.res.getString(1), this.res.getString(2), true);
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getScheduleById(String schedule_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return schedule;
    }

    public String getLatestSchedule(String movie_id)
    {
	String schedule_id = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_get_latest);
	    this.cStmt.setString(1, movie_id);
	    this.executeQuery();
	    if (this.res.next())
	    {
		schedule_id = this.res.getString(2);
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getLatestSchedule(String movie_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return schedule_id;
    }

    public List<Schedule> getUserSchedule()
    {
	List<Schedule> schedules = new ArrayList<Schedule>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.schedules_proc_get_userschedule);
	    this.executeQuery();
	    while (this.res.next())
	    {
		schedules.add(new Schedule(this.res.getString(5), this.res.getString(7), this.res.getString(3), this.res.getString(4), this.res.getString(6), this.res.getBoolean(8), this.res.getString(1), this.res.getString(2), this.res.getBoolean(9), true));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getUserSchedule()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return schedules;
    }

    /************************************************** { SCHEDULE END } *************************************************/

    /************************************************** { REVIEW } *************************************************/
    public long addReview(Review review)
    {
	long result = -99;
	try
	{
	    logger.info("Adding review.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.reviews_proc_aud_add);
	    this.cStmt.setString(1, review.getMovieId());
	    this.cStmt.setString(2, review.getReview());
	    this.cStmt.setString(3, review.getReviewBy());
	    this.cStmt.setDouble(4, Double.parseDouble(review.getStars()));

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addReview(Review review)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long editReview(Review review)
    {
	long result = -99;
	try
	{
	    logger.info("Editing review.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.reviews_proc_aud_edit);
	    this.cStmt.setString(1, review.getReviewId());
	    this.cStmt.setString(2, review.getMovieId());
	    this.cStmt.setString(3, review.getReview());
	    this.cStmt.setString(4, review.getReviewBy());
	    this.cStmt.setDouble(5, Double.parseDouble(review.getStars()));

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editReview(Review review)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deleteReview(Review review)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting review.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.reviews_proc_aud_delete);
	    this.cStmt.setString(1, review.getReviewId());

	    return this.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deleteReview(Review review)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public Review getReview(String review_id)
    {
	Review review = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.reviews_proc_get_find);
	    this.cStmt.setString(1, review_id);

	    this.executeQuery();
	    if (this.res.next())
	    {
		review = new Review(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getReview(String review_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return review;
    }

    public List<Review> getAllReview()
    {
	List<Review> reviews = new ArrayList<Review>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.reviews_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		reviews.add(new Review(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllReview()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return reviews;
    }

    public List<Review> getAllReviewForHome()
    {
	List<Review> reviews = new ArrayList<Review>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.reviews_proc_get_forhome);
	    this.executeQuery();
	    while (this.res.next())
	    {
		reviews.add(new Review(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllReviewForHome()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return reviews;
    }

    /************************************************** { REVIEW END } *************************************************/

    /************************************************** { CITY } *************************************************/

    public Map<Integer, String> getCityList()
    {
	Map<Integer, String> cities = new HashMap<Integer, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.cities_proc_get_all);

	    this.executeQuery();
	    while (this.res.next())
	    {
		cities.put(this.res.getInt(1), this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getCityList()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return cities;
    }

    /************************************************** { CITY END } *************************************************/

    /************************************************** { USER } *************************************************/
    public long addUser(User user)
    {
	long result = -99;
	try
	{
	    logger.info("Adding user.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.users_proc_aud_add);
	    this.cStmt.setString(1, user.getFirstName());
	    this.cStmt.setString(2, user.getLastName());
	    this.cStmt.setString(3, user.getGender());
	    this.cStmt.setString(4, user.getMobileNo());
	    this.cStmt.setString(5, user.getCityId());
	    this.cStmt.setString(6, user.getEmail());
	    this.cStmt.setString(7, user.getPassword());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in addUser(User user)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long editUser(User user)
    {
	long result = -99;
	try
	{
	    logger.info("Editing user.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.users_proc_aud_edit);
	    this.cStmt.setString(1, user.getUserId());
	    this.cStmt.setString(2, user.getFirstName());
	    this.cStmt.setString(3, user.getLastName());
	    this.cStmt.setString(4, user.getGender());
	    this.cStmt.setString(5, user.getMobileNo());
	    this.cStmt.setString(6, user.getCityId());

	    this.executeQuery();
	    if (this.res.next())
	    {
		result = this.res.getLong(1);
	    }
	    else
	    {
		result = -99;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in editUser(User user)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long deleteUser(User user)
    {
	long result = -99;
	try
	{
	    logger.info("Deleting user.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.users_proc_aud_delete);
	    this.cStmt.setString(1, user.getUserId());

	    return this.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in deleteUser(User user)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public long changePassUser(User user)
    {
	long result = -99;
	try
	{
	    logger.info("Changing user password.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.users_proc_aud_changepass);
	    this.cStmt.setString(1, user.getEmail());

	    return this.executeUpdate();
	}
	catch (Exception ex)
	{
	    logger.error("Exception in changePassUser(User user)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return result;
    }

    public User getUser(User user)
    {
	// User user = null;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.users_proc_get_find);
	    this.cStmt.setString(1, user.getUserId());
	    this.executeQuery();
	    if (this.res.next())
	    {
		user = new User(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getUser(User user)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return user;
    }

    public List<User> getAllUser()
    {
	List<User> users = new ArrayList<User>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.users_proc_get_all);
	    this.executeQuery();
	    while (this.res.next())
	    {
		users.add(new User(this.res.getString(1), this.res.getString(2), this.res.getString(3), this.res.getString(4), this.res.getString(5), this.res.getString(6), this.res.getString(7), this.res.getString(8)));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getAllUser()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return users;
    }

    /************************************************** { USER END } *************************************************/

    /************************************************** { BOOKING } *************************************************/

    public Map<String, String> getMovieScreenAndShow(Schedule schedule)
    {
	Map<String, String> screenAndShows = new HashMap<String, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.bookings_get_screenandshows);
	    this.cStmt.setDate(1, CommonMethod.utilDateToSqlDate(new java.util.Date()));
	    this.cStmt.setString(2, schedule.getDate());
	    this.cStmt.setString(3, schedule.getMovieId());

	    this.executeQuery();
	    while (this.res.next())
	    {
		// SCREEN_ID : SCHEDULE_ID
		screenAndShows.put(this.res.getString(1) + ":" + this.res.getString(3), this.res.getString(2) + " " + this.res.getString(5));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getMovieScreenAndShow(Schedule schedule)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return screenAndShows;
    }

    public Map<Integer, String> getShowClass()
    {
	Map<Integer, String> showClasses = new HashMap<Integer, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.bookings_get_class);

	    this.executeQuery();
	    while (this.res.next())
	    {
		showClasses.put(this.res.getInt(1), this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getShowClass()" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return showClasses;
    }

    public List<SeatRow> getCurrentSeatStatus(Booking booking)
    {
	List<SeatRow> seatrows = new ArrayList<SeatRow>();
	SeatRow seatrowsObj = null;
	String row, curr_row;
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.bookings_get_seat_status);
	    this.cStmt.setString(1, booking.getSchedule().getScheduleId());
	    this.cStmt.setString(2, booking.getSeatType().getSeatTypeId());
	    this.executeQuery();
	    row = "";
	    while (this.res.next())
	    {
		curr_row = this.res.getString(4);
		// logger.info("curr_row : " + curr_row + " row : " + row +
		// " test== : " + (curr_row.equals(row)));
		if (!curr_row.equals(row))
		{
		    row = curr_row;

		    if (null != seatrowsObj)
		    {
			seatrows.add(seatrowsObj);
		    }

		    seatrowsObj = new SeatRow();
		    seatrowsObj.setNo(row);
		    seatrowsObj.getCells().add(new SeatCell(res.getInt(5), res.getString(3), res.getInt(6)));
		}
		else
		{
		    seatrowsObj.getCells().add(new SeatCell(res.getInt(5), res.getString(3), res.getInt(6)));
		}
	    }
	    if (null != seatrowsObj)
	    {
		seatrows.add(seatrowsObj);
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getCurrentSeatStatus(Schedule schedule)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return seatrows;
    }

    public List<String> getSeatTypeDetailsBySchedule(Schedule schedule)
    {
	List<String> seattypes = new ArrayList<String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.bookings_get_seat_types);
	    this.cStmt.setString(1, schedule.getScheduleId());
	    this.executeQuery();

	    while (this.res.next())
	    {
		seattypes.add("[" + this.res.getString(1) + "] : " + this.res.getString(2));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getSeatTypeDetailsBySchedule(Schedule schedule)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return seattypes;
    }
    
    public List<String> getQuickScheduleDates(String movie_id)
    {
	List<String> scheduleDates = new ArrayList<String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.quick_bookings_get_dates);
	    this.cStmt.setString(1, movie_id);
	    this.executeQuery();

	    while (this.res.next())
	    {
		scheduleDates.add(this.res.getString(1));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getQuickScheduleDates(String movie_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return scheduleDates;
    }
    
    public Map<String, String> getQuickMovieScreenAndShow(String schedule_date, String movie_id)
    {
	Map<String, String> screenAndShows = new HashMap<String, String>();
	try
	{
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.bookings_get_screenandshows);
	    this.cStmt.setDate(1, CommonMethod.utilDateToSqlDate(new java.util.Date()));
	    this.cStmt.setString(2, schedule_date);
	    this.cStmt.setString(3, movie_id);

	    this.executeQuery();
	    while (this.res.next())
	    {
		// SCREEN_ID : SCHEDULE_ID
		screenAndShows.put(this.res.getString(1) + ":" + this.res.getString(3), this.res.getString(2) + " " + this.res.getString(5));
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception in getQuickMovieScreenAndShow(String schedule_date, String movie_id)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return screenAndShows;
    }

    /************************************************** { BOOKING END } *************************************************/
    
    /************************************************** { TRANSACTION } *************************************************/
    
    public Booking doTransaction(Booking booking, String SessionId)
    {
	try
	{
	    logger.info("TRANSACTION STARTED.......");
	    this.openConnection();
	    this.cStmt = con.prepareCall(SQLResourceBundle.do_transaction);
	    this.cStmt.setString(1, ((booking.getUserType() == "R") ? "1" : "0"));	    
	    this.cStmt.setString(2, booking.getUserId());	    
	    this.cStmt.setString(3, booking.getMobileNo());	    
	    this.cStmt.setString(4, booking.getEmail());	    
	    this.cStmt.setString(5, String.valueOf(booking.getTransaction().getAmount()));	    
	    this.cStmt.setString(6, String.valueOf( booking.getTransaction().getConvenienceFees()));	    
	    this.cStmt.setString(7, String.valueOf(booking.getTransaction().getServiceTax()));	    
	    this.cStmt.setString(8, String.valueOf(booking.getTransaction().getGrandTotal()));	    
	    this.cStmt.setString(9, booking.getPaymentDetail().getCardType());	    
	    this.cStmt.setString(10, booking.getPaymentDetail().getCardName());	    
	    this.cStmt.setString(11, booking.getPaymentDetail().getExpiryString());	    
	    this.cStmt.setString(12, booking.getPaymentDetail().getCvv());	    
	    this.cStmt.setString(13, booking.getPaymentDetail().getCardName());	    
	    this.cStmt.setString(14, booking.getSchedule().getScheduleId());	    
	    this.cStmt.setString(15, CommonMethod.seatsToXMLString(booking.getSeats()));	    
	    this.cStmt.setString(16, SessionId);
	    
	    logger.info("[1]" + ((booking.getUserType() == "R") ? "1" : "0"));
	    logger.info("[2]" + booking.getUserId());
	    logger.info("[3]" + booking.getMobileNo());
	    logger.info("[4]" + booking.getEmail());
	    logger.info("[5]" + String.valueOf(booking.getTransaction().getAmount()));
	    logger.info("[6]" + String.valueOf( booking.getTransaction().getConvenienceFees()));
	    logger.info("[7]" + String.valueOf(booking.getTransaction().getServiceTax()));
	    logger.info("[8]" + String.valueOf(booking.getTransaction().getGrandTotal()));
	    logger.info("[9]" + booking.getPaymentDetail().getCardType());
	    logger.info("[10]" + booking.getPaymentDetail().getCardName());
	    logger.info("[11]" + booking.getPaymentDetail().getExpiryString());
	    logger.info("[12]" + booking.getPaymentDetail().getCvv());
	    logger.info("[13]" + booking.getPaymentDetail().getCardName());
	    logger.info("[14]" + booking.getSchedule().getScheduleId());
	    logger.info("[15]" + CommonMethod.seatsToXMLString(booking.getSeats()));
	    logger.info("[16]" + SessionId);

	    this.executeQuery();
	    if (this.res.next())
	    {
		String userId = this.res.getString(1);
		if(userId.equals("0"))
		{
		    logger.info("TRANSACTION FAILED.......");
		}
		else
		{
		    logger.info("TRANSACTION SUCCESSFULL.......");
		    booking.setUserId(this.res.getString(1));
		    booking.getTransaction().setId(this.res.getString(2));
		    booking.getTransaction().setCode(this.res.getString(3));
		    booking.getPaymentDetail().setId(this.res.getString(4));
		}
	    }
	    else
	    {
		booking.setUserId("0");
		logger.info("TRANSACTION FAILED.......");
	    }
	}
	catch (Exception ex)
	{
	    booking.setUserId("0");
	    logger.info("TRANSACTION FAILED.......");
	    logger.error("Exception in doTransaction(Booking booking)" + ex);
	}
	finally
	{
	    this.closeConnection();
	}
	return booking;
    }
    
    /************************************************** { TRANSACTION END } *************************************************/
}