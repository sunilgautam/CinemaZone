package cinema.admin.action;

import java.io.File;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import com.google.gson.Gson;
import cinema.common.BaseAction;
import cinema.domain.pojo.Upload;
import cinema.util.MimeTypeHelper;

public class SliderUpload extends BaseAction
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SliderUpload.class);
    private static final Gson gson = new Gson();

    private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;

    private String jsonResponse;

    @Override
    public void validate()
    {
	logger.info("[Validating::" + SliderUpload.class + "]");
	List<String> uploadErrors = (List<String>) getActionErrors();
	if (getFieldErrors().get("upload") != null)
	{
	    uploadErrors.addAll((List<String>) getFieldErrors().get("upload"));
	}

	for (String err : uploadErrors)
	{
	    if (err.startsWith("File too large") || err.startsWith("the request was rejected because its size"))
	    {
		clearErrorsAndMessages();
		addActionError(getText("common.invalid.image.filesize"));
		break;
	    }
	}

	if (!hasActionErrors())
	{
	    if (fileUpload == null)
	    {
		addActionError(getText("common.invalid.image.filetype"));
	    }
	    else
	    {
		if (!MimeTypeHelper.isValidMimeType(VALID_IMAGE_TYPES, fileUploadContentType))
		{
		    addActionError(getText("common.invalid.image.filetype"));
		}

		if (!CheckFileSize())
		{
		    addActionError(getText("common.invalid.image.filesize"));
		}
	    }

	    if (hasActionErrors())
	    {
		jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", ""));
	    }
	}
	else
	{
	    jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", ""));
	}
    }

    public String execute() throws Exception
    {
	try
	{
	    logger.info("[Executing::" + SliderUpload.class + "]");
	    // 30 11 12
//	    String filePath = getServletRequestObject().getSession(false).getServletContext().getRealPath(SLIDER_FOLDER);
	    String filePath = getServletContextObject().getRealPath(SLIDER_FOLDER);
	    File fileToCreate = File.createTempFile(SLIDER_PREFIX, new MimeTypeHelper().getMimeTypeExtension(fileUploadContentType), new File(filePath));
	    FileUtils.copyFile(this.fileUpload, fileToCreate);
	    logger.info("File successfully uploaded => " + fileToCreate);

	    jsonResponse = gson.toJson(new Upload(UPLOAD_SUCCESS, getServletRequestObject().getSession(false).getServletContext().getContextPath() + SLIDER_FOLDER + "/" + fileToCreate.getName(), "", ""));
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured in execute(), SliderUpload :" + ex);
	    jsonResponse = gson.toJson(new Upload(UPLOAD_ERROR, "", "", ""));
	}
	return "success";
    }

    public boolean CheckFileSize()
    {
	System.out.println(fileUpload);
	if (fileUpload.length() > MAX_IMAGE_SIZE)
	{
	    return false;
	}
	else
	{
	    return true;
	}
    }

    public File getFileUpload()
    {
	return fileUpload;
    }

    public void setFileUpload(File fileUpload)
    {
	this.fileUpload = fileUpload;
    }

    public String getFileUploadContentType()
    {
	return fileUploadContentType;
    }

    public void setFileUploadContentType(String fileUploadContentType)
    {
	this.fileUploadContentType = fileUploadContentType;
    }

    public String getFileUploadFileName()
    {
	return fileUploadFileName;
    }

    public void setFileUploadFileName(String fileUploadFileName)
    {
	this.fileUploadFileName = fileUploadFileName;
    }

    public String getJsonResponse()
    {
	return jsonResponse;
    }

    public void setJsonResponse(String jsonResponse)
    {
	this.jsonResponse = jsonResponse;
    }
}