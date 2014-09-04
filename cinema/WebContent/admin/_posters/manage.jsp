<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Poster</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/ajaxupload.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$(".poster-view-blocks").hover(function(){
    		$(".close-btn",this).fadeIn();
    	},function(){
    		$(".close-btn",this).fadeOut();
    	});
    	var a = posterManage($("#movieId").val());
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
						<li><s:text name="poster.best.size"></s:text></li>
						<s:actionmessage />
						<s:actionerror />
					</ul>
				</div>
				<table class="form_table">
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="poster.view.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="movieName"/></label>
			                <s:hidden name="movieId" value="%{movieId}"></s:hidden>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="poster.view.select"></s:text></label>
			            </td>
			            <td class="control_cell">
		            		<div class="myButton" id="btnUpload"><s:text name="common.choose"></s:text></div>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="poster.view.setmain"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="manage-label">
							   <input type="checkbox" id="upload-main-check" name="upload-main-check"/>
							   <span>Main</span>
							 </label>
			            </td>
			        </tr>
			    </table>
			    <div class="poster-view-wrapper">
			    	<div class="poster-view-inner">
		    		<s:iterator value="posters" var="poster">
		    			<div class="poster-view-blocks left">
		    				<s:a href="javascript:void(0)" cssClass="close-btn" onclick="javascript:doDelete(%{posterId},this);"></s:a>
			    			<img class="main-img" alt="" src="<s:property value='posterThumb'/>" />
			    			<div class="main-detail">
			    				<label class="manage-label">
								   <s:checkbox fieldValue="true" onclick="javascript:doChangeMain(%{posterId},this);" name="main-check" value="mainFlag"></s:checkbox>
								   <span>Main</span>
								 </label>
			    			</div>
			    		</div>
		    		</s:iterator>
			    	</div>
			    	<div class="clear"></div>
			    </div>
			    <s:a action="posters" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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