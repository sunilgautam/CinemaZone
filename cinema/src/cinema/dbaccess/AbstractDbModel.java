package cinema.dbaccess;

import java.sql.*;
import org.apache.log4j.Logger;

public abstract class AbstractDbModel
{
    private static final Logger logger = Logger.getLogger(AbstractDbModel.class);
    protected Connection con = null;
    protected CallableStatement cStmt = null;
    protected ResultSet res = null;
    protected PreparedStatement pStmt = null;
    protected Statement stmt = null;
    protected ResultSetMetaData resMtd = null;

    protected void openConnection()
    {
	try
	{
	    //logger.info("Openning Database Connection.......");
	    this.con = ConnectionManager.getInstance().getConnection();
	    //logger.info("Database Connection Established");
	}
	catch (Exception ex)
	{
	    logger.error("Exception in executeQuery() : #" + ex);
	}
    }

    protected void closeConnection()
    {
	try
	{
	    if (this.con != null)
	    {
		this.con.close();
	    }
	    if (this.res != null)
	    {
		this.res.close();
	    }
	    if (this.cStmt != null)
	    {
		this.cStmt.close();
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured while Connection Closing in executeQuery() : #" + ex);
	}
    }

    protected boolean executeQuery()
    {
	boolean isExecuted = false;
	try
	{
	    //logger.info("Executing Query.......");
	    this.res = this.cStmt.executeQuery();
	    isExecuted = true;
	    //logger.info("Query Executed");
	}
	catch (SQLException se)
	{
	    logger.error("SQLException in executeQuery() : #" + se);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in executeQuery() : #" + ex);
	}
	return isExecuted;
    }

    protected long executeUpdate()
    {
	int result = -99;
	try
	{
	    return this.cStmt.executeUpdate();
	}
	catch (SQLException se)
	{
	    logger.error("SQLException in executeUpdate() : #" + se);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in executeUpdate() : #" + ex);
	}
	finally
	{
	    try
	    {
		if (this.con != null)
		{
		    this.con.close();
		}
		if (this.res != null)
		{
		    this.res.close();
		}
		if (this.cStmt != null)
		{
		    this.cStmt.close();
		}
	    }
	    catch (Exception ex)
	    {
		logger.error("Exception occured while Connection Closing in executeUpdate() : #" + ex);
	    }
	}
	return result;
    }

    protected boolean executeBatchUpdate()
    {
	boolean isExecuted = false;
	try
	{
	    this.cStmt.executeBatch();
	    isExecuted = true;
	}
	catch (SQLException se)
	{
	    logger.error("SQLException in executeBatchUpdate() : #" + se);
	}
	catch (Exception ex)
	{
	    logger.error("Exception in executeBatchUpdate() : #" + ex);
	}
	finally
	{
	    try
	    {
		if (this.con != null)
		{
		    this.con.close();
		}
		if (this.res != null)
		{
		    this.res.close();
		}
		if (this.cStmt != null)
		{
		    this.cStmt.close();
		}
	    }
	    catch (Exception ex)
	    {
		logger.error("Exception occured while Connection Closing in executeBatchUpdate() : #" + ex);
	    }
	}
	return isExecuted;
    }
}