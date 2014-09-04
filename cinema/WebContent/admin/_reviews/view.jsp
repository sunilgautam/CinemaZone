<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Reviews</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script type="text/javascript">
    
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
			                <label class="labelClass" for=""><s:text name="review.view.id"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="getReview().getReviewId()"/></label>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			            	<label class="labelClass" for=""><s:property value="getReview().getMovieId()"/></label>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.reviewby"></s:text></label>
			            </td>
			            <td class="control_cell">
			            	<label class="labelClass" for=""><s:property value="getReview().getReviewBy()"/></label>
			            </td>
			        </tr>
			        <tr valign="top">
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.review"></s:text></label>
			            </td>
			            <td class="control_cell">
			            	<label class="labelClass" for=""><s:property value="getReview().getReview()"/></label>
			            </td>
			        </tr>
			        <tr valign="top">
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="review.stars"></s:text></label>
			            </td>
			            <td class="control_cell">
			            	<div class="ratings <s:property value='getReview().getStarsClass()'/>"></div>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                &nbsp;
			            </td>
			            <td class="control_cell">
			                <s:a action="reviews" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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