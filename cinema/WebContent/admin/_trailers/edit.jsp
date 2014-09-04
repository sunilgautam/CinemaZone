<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Trailer - edit</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <style type="text/css">
    .big-loading{
	    background-position: center 20px;
	}
    </style>
    <script type="text/javascript">
    	$(document).ready(function() {
    	var validator = $("#frm_edittrailer").validate({
    		rules: {
    			movieId: "required",
    			trailerLink: "required"
    		},
    		messages: {
    			movieId: "<s:text name="trailer.blank.movie"></s:text>",
                trailerLink: "<s:text name="trailer.blank.link"></s:text>"
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
	            <h3><s:text name="trailer.edit"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<li><s:text name="trailer.link.example"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:form id="frm_edittrailer" name="frm_edittrailer" action="trailers-edit-process" method="POST" theme="simple">
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
			                <label class="labelClass" for=""><s:text name="trailer.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select name="movieId" id="movieId" list="moviesList" cssClass="dropList" headerKey="" headerValue="Select" value="%{trailer.getMovieId()}"></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="trailer.link"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="trailerLink" id="trailerLink" maxlength="150" cssClass="inpText" cssStyle="width: 400px;" value="%{trailer.getTrailerLink()}" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <s:hidden name="trailerId" value="%{trailer.getTrailerId()}"></s:hidden>
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('common.update')}"></s:submit>
			                <s:a action="trailers" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
			            </td>
			        </tr>
			    </table>
			</s:form>
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