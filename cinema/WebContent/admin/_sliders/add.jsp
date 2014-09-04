<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Slider</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/ajaxupload.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	var validator = $("#frm_addslider").validate({
    		rules: {
    			movieId: "required",
    			sliderPic1: "required"
    		},
    		messages: {
    			movieId: "<s:text name="slider.blank.movie"></s:text>",
                sliderPic1: "<s:text name="slider.blank.image"></s:text>"
    		}
    	});
    	var a = sliderManage();
    	doUpload();
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
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="slider.best.size"></s:text></li>
						<s:actionmessage />
						<s:actionerror />
					</ul>
				</div>
			    <s:form id="frm_addslider" name="frm_addslider" action="sliders-add-process" method="POST" theme="simple">
				    <table class="form_table">
				        <tr>
				        	<td class="label_cell">
				                <label class="labelClass" for=""><s:text name="slider.movie"></s:text></label>
				            </td>
				            <td class="control_cell">
				                <s:select name="movieId" id="movieId" list="moviesList" cssClass="dropList" headerKey="" headerValue="Select"></s:select>
				            </td>
				        </tr>
				        <tr>
				        	<td class="label_cell">
				                <label class="labelClass" for=""><s:text name="slider.choose"></s:text></label>
				            </td>
				            <td class="control_cell">
				                <a class="myButton" id="btnUpload"><s:text name="common.choose"></s:text></a>
				                <label id="slider-upload-ok"></label>
				                <input type="text" name="sliderPic1" id="sliderPic1" style="visibility:hidden; width:10px;" />
				            </td>
				        </tr>
				        <tr>
				        	<td class="label_cell">
				                <s:hidden id="sliderPic" name="sliderPic"></s:hidden>
				            </td>
				            <td class="control_cell">
				                <s:submit cssClass="myButton" value="%{getText('common.save')}"></s:submit>
				                <s:a action="sliders" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
				            </td>
				        </tr>
				    </table>
				</s:form>
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