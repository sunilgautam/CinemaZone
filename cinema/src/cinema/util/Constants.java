package cinema.util;

public interface Constants
{
    String DEFAULT_LOGIN_URI = "login";
    String DEFAULT_LOGIN_URI_JSP = "/cinema/admin/login";
    String REGISTERED_HOME_PAGE = "/jsp/registeredHomePage.jsf";
    String USER_ID = "User_Id";
    String USER_FNAME = "User_FName";
    String USER_LNAME = "User_LName";
    String USER_EMAIL = "User_Email";
    String USER_CITY = "User_City";
    String USER_USERNAME = "User_Username";
    String USER_PASSWORD = "User_Password";
    String ADMIN_HANDLE = "admin_info";
    String USER_HANDLE = "user_info";
    String A_USER_HANDLE = "user_a_info";
    String SEARCH_HANDLE = "search_list";
    String BOOKING_HANDLE = "booking_item";

    int ADMIN_SESSION_TIMEOUT = 1800;
    int USER_SESSION_TIMEOUT = 1800;
    int A_USER_SESSION_TIMEOUT = 1800;

    String POSTER_FOLDER = "/posters";
    String SLIDER_FOLDER = "/sliders";
    String UPLOAD_SUCCESS = "SUCCESS";
    String UPLOAD_ERROR = "ERROR";
    String LOGIN_SUCCESS = "SUCCESS";
    String LOGIN_ERROR = "ERROR";
    String VALID_IMAGE_TYPES = "image/jpg|image/jpeg|image/gif|image/png|image/pjpeg|image/x-png|image/bmp";
    String POSTER_PREFIX = "poster_";
    String SLIDER_PREFIX = "slider_";
    int MAX_IMAGE_SIZE = 2097152;

    String MAIL_SUBJECT_USER_REGISTERATION = "User Registration";
    String MAIL_SUBJECT_TICKET = "Your Ticket";
    String MAIL_ATT_TICKET_NAME = "Ticket_";

    String MAIL_SERVER_HOST_ADDRESS = "smtp.gmail.com";
    String MAIL_SERVER_PORT_NUMBER = "587";
    String MAIL_PROTOCOL = "smtp";
    String MAIL_DEFAULT_FROM_EMAIL_ADDRESS = "cinemazone777@gmail.com";
    String MAIL_DEFAULT_FROM_EMAIL_ADDRESS_PERSONAL_NAME = "CinemaZone";
    String MAIL_AUTH_USERNAME = "cinemazone777@gmail.com";
    String MAIL_AUTH_PASSWORD = "cinema@123";
    boolean MAIL_SERVICE_ACTIVE = true;
}
