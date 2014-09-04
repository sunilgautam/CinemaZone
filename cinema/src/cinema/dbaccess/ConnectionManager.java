package cinema.dbaccess;

import cinema.exception.DatabaseServerException;
import cinema.exception.DriverClassNotFound;
import java.sql.Connection;
import java.sql.DriverManager;
import org.apache.log4j.Logger;

public final class ConnectionManager extends DBConfig
{

    private static final Logger logger = Logger.getLogger(ConnectionManager.class);
    public static final ConnectionManager instance = new ConnectionManager();
    private Connection con;

    private ConnectionManager()
    {

    }

    public Connection getConnection() throws DriverClassNotFound, DatabaseServerException
    {
	try
	{
	    Class.forName(DRIVER);
	    con = DriverManager.getConnection(DBSTRING, USERNAME, PASSWORD);
	}
	catch (ClassNotFoundException cnfe)
	{
	    logger.error("Driver Class not found.");
	    throw new DriverClassNotFound("Driver Class not found.");
	}
	catch (Exception ex)
	{
	    logger.error("Unable To Connect To Database Server#\t" + ex);
	    throw new DatabaseServerException("Unable To Connect To Database Server", ex);
	}
	return con;
    }

    public static ConnectionManager getInstance()
    {
	return instance;
    }
}