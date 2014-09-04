<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Reviews - add</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script type="text/javascript">
		$(document).ready(function() {
    	var validator = $("#frm_addreview").validate({
    		rules: {
    			movieId: "required",
    			reviewBy: "required",
    			review: "required",
    			stars: "required"
    		},
    		messages: {
    			movieId: "<s:text name="review.blank.movie"></s:text>",
    			reviewBy: "<s:text name="review.blank.reviewby"></s:text>",
    			review: "<s:text name="review.blank.review"></s:text>",
    			stars: "<s:text name="review.blank.stars"></s:text>"
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
	            <h3><s:text name="review.add"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:form id="frm_addreview" name="frm_addreview" action="reviews-add-process" method="POST" theme="simple">
			    <table class="form_table">
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select name="movieId" id="movieId" list="moviesList" cssClass="dropList" headerKey="" headerValue="Select"></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.reviewby"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="reviewBy" maxlength="60" id="reviewBy" cssClass="inpText" />
			            </td>
			        </tr>
			        <tr valign="top">
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.review"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textarea name="review" id="review" cols="40" rows="6" cssStyle="resize:auto; overflow: auto;" cssClass="inpText"></s:textarea>
			            </td>
			        </tr>
			        <tr valign="top">
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.stars"></s:text></label>
			            </td>
			            <td class="control_cell">
			            	<table>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-half" checked="checked" value="0.5" />
			            			</td>
			            			<td>
			            				<label for="stars-half" class="ratings half" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-one" value="1" />
			            			</td>
			            			<td>
			            				<label for="stars-one" class="ratings one" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-one-half" value="1.5" />
			            			</td>
			            			<td>
			            				<label for="stars-one-half" class="ratings one-half" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-two" value="2" />
			            			</td>
			            			<td>
			            				<label for="stars-two" class="ratings two" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-two-half" value="2.5" />
			            			</td>
			            			<td>
			            				<label for="stars-two-half" class="ratings two-half" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-three" value="3" />
			            			</td>
			            			<td>
			            				<label for="stars-three" class="ratings three" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-three-half" value="3.5" />
			            			</td>
			            			<td>
			            				<label for="stars-three-half" class="ratings three-half" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-four" value="4" />
			            			</td>
			            			<td>
			            				<label for="stars-four" class="ratings four" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-four-half" value="4.5" />
			            			</td>
			            			<td>
			            				<label for="stars-four-half" class="ratings four-half" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
			            				<input type="radio" name="stars" id="stars-five" value="5" />
			            			</td>
			            			<td>
			            				<label for="stars-five" class="ratings five" style="display: block;">
			                			</label>
			            			</td>
			            		</tr>
			            	</table>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                &nbsp;
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('common.save')}"></s:submit>
			                <s:a action="reviews" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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