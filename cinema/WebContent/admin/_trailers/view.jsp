<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Trailer</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/videobox.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
    	var settings = {
    			containerResizeSpeed: 350
        };
        $('.video-preview-link').videoBox(settings);
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
						<s:actionmessage />
						<s:actionerror />
					</ul>
				</div>
				<table class="form_table">
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="trailer.view.id"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="trailer.getTrailerId()"/></label>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="trailer.view.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="trailer.getMovieName()"/></label>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="trailer.view.link"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:a value="%{trailer.getTrailerLink()}" title="" cssClass="anchor labelClass video-preview-link" cssStyle="font-size: 12px;"><s:property value="trailer.getTrailerLink()"/></s:a>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                &nbsp;
			            </td>
			            <td class="control_cell">
			                <s:a action="trailers" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
			            </td>
			        </tr>
			    </table>
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