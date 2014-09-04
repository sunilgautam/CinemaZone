package test;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import cinema.common.BaseAction;
import cinema.util.MimeTypeHelper;

public class upload extends BaseAction {
    private static final long serialVersionUID = 1L;
    @SuppressWarnings("unused")
    private static final Logger logger = Logger.getLogger(upload.class);
    private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;

    public String getFileUploadContentType() {
	return fileUploadContentType;
    }

    public void setFileUploadContentType(String fileUploadContentType) {
	this.fileUploadContentType = fileUploadContentType;
    }

    public String getFileUploadFileName() {
	return fileUploadFileName;
    }

    public void setFileUploadFileName(String fileUploadFileName) {
	this.fileUploadFileName = fileUploadFileName;
    }

    public File getFileUpload() {
	return fileUpload;
    }

    public void setFileUpload(File fileUpload) {
	this.fileUpload = fileUpload;
    }

    @Override
    public void validate() {
	List<String> uploadErrors = (List<String>) getActionErrors();
	if (getFieldErrors().get("upload") != null) {
	    uploadErrors.addAll((List<String>) getFieldErrors().get("upload"));
	}

	for (String err : uploadErrors) {
	    if (err.startsWith("File too large") || err.startsWith("the request was rejected because its size")) {
		clearErrorsAndMessages();
		addActionError(getText("common.invalid.image.filesize"));
		break;
	    }
	}
	
	if(!hasActionErrors()) {
	    if (!MimeTypeHelper.isValidMimeType(VALID_IMAGE_TYPES, fileUploadContentType)) {
		addActionError(getText("common.invalid.image.filetype"));
	    }

	    if (!CheckFileSize()) {
		addActionError(getText("common.invalid.image.filesize"));
	    }
	}
    }

    public String execute() throws Exception {
	try {

	    String filePath = getServletRequestObject().getSession().getServletContext().getRealPath(POSTER_FOLDER);
	    System.out.println("file path ==> " + filePath);
	    File fileToCreate = File.createTempFile(POSTER_PREFIX, new MimeTypeHelper().getMimeTypeExtension(fileUploadContentType), new File(
		    filePath));
	    System.out.println("fileToCreate ==> " + fileToCreate);
	    FileUtils.copyFile(this.fileUpload, fileToCreate);
	    return "success";
	} catch (Exception e) {
	    e.printStackTrace();
	    return "input";
	}
    }

    public boolean CheckFileSize() {
	if (fileUpload.length() > MAX_IMAGE_SIZE) {
	    return false;
	} else {
	    return true;
	}
    }

    public String display() {
	return NONE;
    }
}
