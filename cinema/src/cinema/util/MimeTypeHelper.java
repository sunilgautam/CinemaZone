package cinema.util;

import java.util.HashMap;
import org.apache.log4j.Logger;

public class MimeTypeHelper
{
    private static final Logger logger = Logger.getLogger(MimeTypeHelper.class);
    private HashMap<String, String> mimeTypeExtensionMap = new HashMap<String, String>();

    public MimeTypeHelper()
    {
	mimeTypeExtensionMap.put("image/jpg", ".jpg");
	mimeTypeExtensionMap.put("image/jpeg", ".jpg");
	mimeTypeExtensionMap.put("image/gif", ".gif");
	mimeTypeExtensionMap.put("image/png", ".png");
	mimeTypeExtensionMap.put("image/pjpeg", ".jpg");
	mimeTypeExtensionMap.put("image/x-png", ".png");
	mimeTypeExtensionMap.put("image/bmp", ".bmp");
    }

    public String getMimeTypeExtension(String mimeType)
    {
	try
	{
	    String extenstion = null;
	    extenstion = mimeTypeExtensionMap.get(mimeType);
	    if (null == extenstion)
	    {
		logger.info("No matching mimetype found. returning default extension");
		return ".tmp";
	    }
	    else
	    {
		return extenstion;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in getMimeTypeExtension(),  MimeTypeHelper:" + ex);
	    logger.info("returning default extension");
	    return ".tmp";
	}
    }

    public static boolean isValidMimeType(String mimeTypes, String inputMimeType)
    {
	try
	{
	    String[] mimeTypesArray = mimeTypes.split("\\|");
	    boolean found = false;
	    for (String mimeType : mimeTypesArray)
	    {
		if (inputMimeType.equals(mimeType))
		{
		    found = true;
		    break;
		}
	    }
	    return found;
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in isValidMimeType(),  MimeTypeHelper:" + ex);
	    return false;
	}
    }
}
