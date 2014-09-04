<%--<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'd1p.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<s:actionmessage />
	<s:actionerror />
	<s:form action="upload" method="POST" enctype="multipart/form-data">

		<s:file name="fileUpload" label="Select a File to upload" size="40" />

		<s:submit value="submit" name="submit" />

	</s:form>
</body>
</html>
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Poster Upload</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/ajaxupload.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
		$(document).ready(function() {
			var thumbProfile = $('#upload-image-profile-thumb');
			
            new AjaxUpload('btnUploadProfile', {
                action: '<%= application.getInitParameter("domain") + "testupload.action" %>',
                name: 'fileUpload',
                responseType: 'json',
                onSubmit: function(file, extension) {
                    if (! (extension && /^(<s:text name="common.valid.image.filetype"></s:text>)$/.test(extension))){ 
                        // extension is not allowed 
                        showModel();
                        return false;
                    }
                    $('.upload-image-profile-preview').addClass('big-loading').children('img').css('display','none');
                },
                onComplete: function(file, response) {
                    thumbProfile.load(function(){
                        $('.upload-image-profile-preview').removeClass('big-loading').children('img').css('display','block');
                        thumbProfile.unbind();
                    });
                    if(response.result == 'SUCCESS') {
                        thumbProfile.attr('src', response.resource);
                        $('#image_path').val(response.resource);
                        $('#thumb_path').val(response.thumb);
                    }
                    else {
                        $('.upload-image-profile-preview').removeClass('big-loading').children('img').css('display','block');
                        thumbProfile.unbind();
                    }
                }
            });
    });
	</script>
</head>
<body>
<div class="completeWidth topFull">
    <div class="keepCenter topWrapper">
        <div class="topLeft">
            <!--HEADER-->
            <%@ include file="/layout/adm/header.jsp" %>
        </div>
        <div class="topBottom">
            <!--MENU-->
            <%@ include file="/layout/adm/menu.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="keepCenter containtWrapper">
        <!--CONTENT-->
        <div class="content-box">
	        <div class="content-box-header">
	            <h3><s:text name="screen.add"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<div class="upload-image-sections">
                   <div class="upload-image-profile">
                       <div class="upload-section">
                           <div class="upload-image-profile-preview">
               				<img id="upload-image-profile-thumb" width="100px" height="100px" src="<?php echo $thumb_path; ?>" />
           				</div>
                           <div class="upload-section-file">
       						<label>&nbsp;&nbsp; Upload Student Image &nbsp;&nbsp;</label>
                               <input type="hidden" id="image_path" name="image_path" value="<?php echo $image_path; ?>" />
       						<div class="myButton" id="btnUploadProfile">Choose Image</div>
                               <label class="best-size">best size : 100px x 100px</label>
               			</div>
                       </div>
                   </div>
               </div>
               <div id="dialog-message" title="Invalid File Type">
					<p>
						<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 50px 0;"></span>
						<s:text name="common.invalid.image.filetype"></s:text>
					</p>
				</div>
			</div>
		</div>
		<div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="completeWidth footerFull">
    <div class="keepCenter footerWrapper">
        <!--FOOTER-->
        <%@ include file="/layout/adm/footer.jsp" %>
    </div>
</div>
</body>
</html>