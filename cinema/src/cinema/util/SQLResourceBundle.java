package cinema.util;

import java.util.ResourceBundle;

public class SQLResourceBundle
{
    private static ResourceBundle objSQLResorceBundle = ResourceBundle.getBundle("cinema.res.sqlProp");

    public static String getQueryOfKey(String key)
    {
	return objSQLResorceBundle.getString(key);
    }

    public static final String check_admin_login = getQueryOfKey("check_admin_login");
    public static final String check_user_login = getQueryOfKey("check_user_login");

    public static final String screens_proc_aud_add = getQueryOfKey("screens_proc_aud_add");
    public static final String screens_proc_aud_edit = getQueryOfKey("screens_proc_aud_edit");
    public static final String screens_proc_aud_delete = getQueryOfKey("screens_proc_aud_delete");
    public static final String screens_proc_get_all = getQueryOfKey("screens_proc_get_all");
    public static final String screens_proc_get_find = getQueryOfKey("screens_proc_get_find");

    public static final String movies_proc_aud_add = getQueryOfKey("movies_proc_aud_add");
    public static final String movies_proc_aud_edit = getQueryOfKey("movies_proc_aud_edit");
    public static final String movies_proc_aud_delete = getQueryOfKey("movies_proc_aud_delete");
    public static final String movies_proc_get_all = getQueryOfKey("movies_proc_get_all");
    public static final String movies_proc_get_find = getQueryOfKey("movies_proc_get_find");
    public static final String movies_proc_get_findname = getQueryOfKey("movies_proc_get_findname");
    public static final String movies_proc_get_search = getQueryOfKey("movies_proc_get_search");
    public static final String movies_proc_get_removed = getQueryOfKey("movies_proc_get_removed");
    public static final String movies_proc_get_forschedule = getQueryOfKey("movies_proc_get_forschedule");
    public static final String movies_proc_get_forhome = getQueryOfKey("movies_proc_get_forhome");
    public static final String movies_proc_get_upcoming = getQueryOfKey("movies_proc_get_upcoming");
    public static final String movies_proc_get_details = getQueryOfKey("movies_proc_get_details");

    public static final String seat_patterns_proc_get = getQueryOfKey("seat_patterns_proc_get");

    public static final String seat_config_proc_get = getQueryOfKey("seat_config_proc_get");
    public static final String seat_types_proc_get = getQueryOfKey("seat_types_proc_get");
    public static final String seat_types_proc_get_all = getQueryOfKey("seat_types_proc_get_all");
    public static final String seat_types_proc_getbyid = getQueryOfKey("seat_types_proc_getbyid");

    public static final String trailers_proc_aud_add = getQueryOfKey("trailers_proc_aud_add");
    public static final String trailers_proc_aud_edit = getQueryOfKey("trailers_proc_aud_edit");
    public static final String trailers_proc_aud_delete = getQueryOfKey("trailers_proc_aud_delete");
    public static final String trailers_proc_get_all = getQueryOfKey("trailers_proc_get_all");
    public static final String trailers_proc_get_find = getQueryOfKey("trailers_proc_get_find");
    public static final String trailers_proc_get_findbymovie = getQueryOfKey("trailers_proc_get_findbymovie");

    public static final String ticket_costs_proc_aud_add = getQueryOfKey("ticket_costs_proc_aud_add");
    public static final String ticket_costs_proc_aud_edit = getQueryOfKey("ticket_costs_proc_aud_edit");
    public static final String ticket_costs_proc_aud_delete = getQueryOfKey("ticket_costs_proc_aud_delete");
    public static final String ticket_costs_proc_get_all = getQueryOfKey("ticket_costs_proc_get_all");
    public static final String ticket_costs_proc_get_find = getQueryOfKey("ticket_costs_proc_get_find");
    public static final String ticket_costs_proc_get_findbymovie = getQueryOfKey("ticket_costs_proc_get_findbymovie");

    public static final String posters_proc_aud_add = getQueryOfKey("posters_proc_aud_add");
    public static final String posters_proc_aud_edit = getQueryOfKey("posters_proc_aud_edit");
    public static final String posters_proc_aud_delete = getQueryOfKey("posters_proc_aud_delete");
    public static final String posters_proc_get_all = getQueryOfKey("posters_proc_get_all");
    public static final String posters_proc_get_find = getQueryOfKey("posters_proc_get_find");
    public static final String posters_proc_get_findbymovie = getQueryOfKey("posters_proc_get_findbymovie");

    public static final String sliders_proc_aud_add = getQueryOfKey("sliders_proc_aud_add");
    public static final String sliders_proc_aud_delete = getQueryOfKey("sliders_proc_aud_delete");
    public static final String sliders_proc_get_all = getQueryOfKey("sliders_proc_get_all");
    public static final String sliders_proc_get_find = getQueryOfKey("sliders_proc_get_find");
    public static final String sliders_proc_get_findmoviewithout = getQueryOfKey("sliders_proc_get_findmoviewithout");

    public static final String schedules_proc_aud_add = getQueryOfKey("schedules_proc_aud_add");
    public static final String schedules_proc_aud_reschedule = getQueryOfKey("schedules_proc_aud_reschedule");
    public static final String schedules_proc_get_all = getQueryOfKey("schedules_proc_get_all");
    public static final String schedules_proc_get_find = getQueryOfKey("schedules_proc_get_find");
    public static final String schedules_proc_get_userschedule = getQueryOfKey("schedules_proc_get_userschedule");
    public static final String schedules_proc_get_findid = getQueryOfKey("schedules_proc_get_findid");
    public static final String schedules_proc_get_latest = getQueryOfKey("schedules_proc_get_latest");

    public static final String reviews_proc_aud_add = getQueryOfKey("reviews_proc_aud_add");
    public static final String reviews_proc_aud_edit = getQueryOfKey("reviews_proc_aud_edit");
    public static final String reviews_proc_aud_delete = getQueryOfKey("reviews_proc_aud_delete");
    public static final String reviews_proc_get_all = getQueryOfKey("reviews_proc_get_all");
    public static final String reviews_proc_get_find = getQueryOfKey("reviews_proc_get_find");
    public static final String reviews_proc_get_findbymovie = getQueryOfKey("reviews_proc_get_findbymovie");
    public static final String reviews_proc_get_forhome = getQueryOfKey("reviews_proc_get_forhome");

    public static final String cities_proc_get_all = getQueryOfKey("cities_proc_get_all");
    public static final String cities_proc_get_find = getQueryOfKey("cities_proc_get_find");

    public static final String users_proc_aud_add = getQueryOfKey("users_proc_aud_add");
    public static final String users_proc_aud_edit = getQueryOfKey("users_proc_aud_edit");
    public static final String users_proc_aud_changepass = getQueryOfKey("users_proc_aud_changepass");
    public static final String users_proc_aud_delete = getQueryOfKey("users_proc_aud_delete");
    public static final String users_proc_get_all = getQueryOfKey("users_proc_get_all");
    public static final String users_proc_get_find = getQueryOfKey("users_proc_get_find");
    public static final String users_proc_get_findbyemail = getQueryOfKey("users_proc_get_findbyemail");

    public static final String bookings_get_screenandshows = getQueryOfKey("bookings_get_screenandshows");
    public static final String bookings_get_class = getQueryOfKey("bookings_get_class");
    public static final String bookings_get_seat_status = getQueryOfKey("bookings_get_seat_status");
    public static final String bookings_get_seat_types = getQueryOfKey("bookings_get_seat_types");
    public static final String quick_bookings_get_dates = getQueryOfKey("quick_bookings_get_dates");
    
    public static final String do_transaction = getQueryOfKey("do_transaction");
}