package cinema.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;

public class CommonMethod
{
    private static final Logger logger = Logger.getLogger(CommonMethod.class);
    private static final DateFormat utilDateFormatter = new SimpleDateFormat("dd/MM/yyyy");
    private static final SimpleDateFormat dateFormate = new SimpleDateFormat("dd/MM/yyyy");
    private static final DateFormat sqlDateFormatter = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat customeDateFormatter = new SimpleDateFormat();
    private static final SimpleDateFormat customeDateFormatter_1 = new SimpleDateFormat();
    private static final EmailValidator em = EmailValidator.getInstance();
    
    public static java.sql.Date utilDateToSqlDate(java.util.Date uDate) throws ParseException
    {
	return java.sql.Date.valueOf(sqlDateFormatter.format(uDate));
    }

    public static java.sql.Timestamp utilDateTimeToSqlDateTime(java.util.Date uDate) throws ParseException
    {
	return new java.sql.Timestamp(uDate.getTime());
    }

    public static java.util.Date sqlDateToutilDate(java.sql.Date sDate) throws ParseException
    {
	return (java.util.Date) utilDateFormatter.parse(utilDateFormatter.format(sDate));
    }

    public static java.util.Date sqlDateTimeToutilDateTime(java.sql.Date sDate) throws ParseException
    {
	return new java.util.Date(sDate.getTime());
    }

    public static java.util.Date stringToutilDate(String sDate) throws ParseException
    {
	return (java.util.Date) dateFormate.parse(sDate);
    }

    public static java.sql.Date stringToSqlDate(String sDate) throws ParseException
    {
	return java.sql.Date.valueOf(sqlDateFormatter.format(dateFormate.parse(sDate)));
    }

    public static java.util.Date customeStringToUtilDate(String sDate, String format)
    {
	try
	{
	    customeDateFormatter.applyPattern(format);
	    return customeDateFormatter.parse(sDate);
	}
	catch (ParseException pex)
	{
	    logger.error("Error customeStringToUtilDate" + pex);
	    return null;
	}
	catch (Exception ex)
	{
	    logger.error("Error customeStringToUtilDate" + ex);
	    return null;
	}
    }

    public static boolean isDate(String value)
    {
	try
	{
	    dateFormate.setLenient(false);
	    dateFormate.parse(value);
	    return true;
	}
	catch (ParseException pex)
	{
	    return false;
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in isDate(), CommonMethod :" + ex);
	    return false;
	}
    }

    public static boolean customeIsDate(String value, String format)
    {
	try
	{
	    customeDateFormatter_1.setLenient(false);
	    customeDateFormatter_1.applyPattern(format);
	    customeDateFormatter_1.parse(value);
	    return true;
	}
	catch (ParseException pex)
	{
	    return false;
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in isDate(), CommonMethod :" + ex);
	    return false;
	}
    }

    public static boolean isNumeric(String value)
    {
	try
	{
	    if (value.startsWith("-"))
	    {
		return false;
	    }
	    Long.parseLong(value);
	    return true;
	}
	catch (NumberFormatException ex)
	{
	    return false;
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in isNumeric(), CommonMethod :" + ex);
	    return false;
	}
    }

    public static boolean isFloating(String value)
    {
	try
	{
	    if (value.startsWith("-"))
	    {
		return false;
	    }
	    Double.parseDouble(value);
	    return true;
	}
	catch (NumberFormatException ex)
	{
	    return false;
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in isFloating(), CommonMethod :" + ex);
	    return false;
	}
    }

    public static boolean isEmailValidator(String value)
    {
	try
	{
	    if (em.isValid(value))
	    {
		return true;
	    }
	    else
	    {
		return false;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in isEmailValidator(), CommonMethod :" + ex);
	    return false;
	}
    }
    
    public static String seatsToXMLString(List<String> seats)
    {
	String[] cell;
	StringBuilder strBuild = new StringBuilder();
	strBuild.append("<Seats>");
	for (String item : seats)
	{
	    cell = item.split("\\:");
	    strBuild.append("<Seat tSeat_row=\"");
	    strBuild.append(cell[0]);
	    strBuild.append("\" tSeat_no=\"");
	    strBuild.append(cell[1]);
	    strBuild.append("\" />");
	}
	strBuild.append("</Seats>");
	return strBuild.toString();
    }
}