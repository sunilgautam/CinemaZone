<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Booking Step-1</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	<s:if test="noticeFlag==true">
    		$(document).ready(function(){
    			$( "#dialog-message" ).dialog({
    				modal: true,
    				height: 165,
    				width: 600,
    				buttons: {
    					Ok: function() {
    						$( this ).dialog( "close" );
    					}
    				}
    			});
    		});
    	</s:if>
    	$(document).ready(function() {
        	var validatorBookingInput = $("#frm_booking_input").validate({
        		rules: {
        			screenAndShows: "required",
        			showClass: "required",
        			noOfSeats: "required"
        		},
        		messages: {
        			screenAndShows: "<s:text name="booking.blank.show"></s:text>",
        			showClass: "<s:text name="booking.blank.show"></s:text>",
        			noOfSeats: "<s:text name="booking.blank.noofseats"></s:text>"
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
            <%@ include file="/layout/main/header.jsp" %>
        </div>
        <div class="topBottom">
            <!--MENU-->
            <%@ include file="/layout/main/menu.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="keepCenter containtWrapper" style="background-color: #fff;">
        <!--CONTENT-->
        <div class="content-box">
	        <div class="content-box-content">
		        <!--FOR TWO COLUMNS ONLY KEEP contLeft AND contCenter AND CHANGE WIDTH IN CSS-->
		        <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="booking.notice"></s:text></li>
						<s:actionmessage />
						<s:actionerror />
					</ul>
					</div>
					<div>
						<div class="details-header-wrapper">
							<div class="details-header">
								<s:property value="movieInfo.movieName"/>
								<s:property value="movieInfo.cbRating"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:date name="dateName" format="EEEE dd/MM/yyyy" />
							</div>
						</div>
						<table>
							<tr>
								<td rowspan="7" valign="top" style="padding: 10px;">
							    	<div class="poster-view-inner">
						    			<div class="poster-view-blocks">
							    			<img width="95" height="140" class="main-img" alt="" src="<s:property value='movieInfo.mainPosterPic'/>" />
							    		</div>
							    	</div>
								</td>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.director"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.director"/></label>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.cast"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.cast"/></label>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.genre"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.genre"/></label>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.lang"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.lang"/></label>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.duration"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.duration"/></label>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.releaseDate"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.releaseDate"/></label>
									</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>
									<label class="labelClass details-label" for=""><s:text name="movie.view.cbRating"></s:text></label>
									<label class="labelClass left" for=""><s:property value="movieInfo.cbRating"/></label>
									</p>
								</td>
							</tr>
						</table>
						<s:if test='scheduleId == null || scheduleId.equals("") || schedule == null'>
							<table class="form_table">
								<tr>
						        	<td class="label_cell">
						                &nbsp;
						            </td>
						            <td class="control_cell">
						                <s:a action="home" title="" cssClass="anchor margin10"><s:text name="booking.back.home"></s:text></s:a>
						                <s:a action="schedules" title="" cssClass="anchor margin10"><s:text name="booking.back.schedule"></s:text></s:a>
						            </td>
						        </tr>
							</table>
						</s:if>
						<s:else>
						<s:form id="frm_booking_input" name="frm_booking_input" action="booking-pre-seats" method="POST" theme="simple">
						    <table class="form_table">
						        <tr>
						        	<td class="label_cell">
						                <label class="labelClass" for=""><s:text name="booking.select.show"></s:text></label>
						            </td>
						            <td class="control_cell">
						                <s:select name="screenAndShows" id="screenAndShows" value="%{selectedShow}" cssClass="dropList" list="screenAndShows">
						                </s:select>
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <label class="labelClass" for=""><s:text name="booking.select.class"></s:text></label>
						            </td>
						            <td class="control_cell">
						                <s:select name="showClass" id="showClass" value="#1" cssClass="dropList" list="showClasses">
						                </s:select>
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <label class="labelClass" for=""><s:text name="booking.select.noofseats"></s:text></label>
						            </td>
						            <td class="control_cell">
						                <s:select 
						                	name="noOfSeats" id="noOfSeats" cssClass="dropList"  
						                	list="#{ '1':'1' ,'2':'2' ,'3':'3', '4':'4', '5':'5' }"
						                ></s:select>
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <s:hidden name="scheduleId" value="%{schedule.scheduleId}"></s:hidden>
						                <s:hidden name="movieId" value="%{schedule.movieId}"></s:hidden>
						                <s:hidden name="date" value="%{schedule.date}"></s:hidden>
						            </td>
						            <td class="control_cell">
						                <s:submit cssClass="myButton" value="%{getText('booking.submit')}"></s:submit>
						                <s:a action="home" title="" cssClass="anchor margin10"><s:text name="booking.back.home"></s:text></s:a>
						                <s:a action="schedules" title="" cssClass="anchor margin10"><s:text name="booking.back.schedule"></s:text></s:a>
						            </td>
						        </tr>
						    </table>
						</s:form>
						</s:else>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
    </div>
    <div class="clear"></div>
    <div id="dialog-message" title='<s:text name="booking.adult.warn"></s:text>'>
		<p>
			<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 50px 0;"></span>
			<s:text name="booking.adult.notice"></s:text>
		</p>
	</div>
</div>
<div class="completeWidth footerFull">
    <div class="keepCenter footerWrapper">
        <!--FOOTER-->
        <%@ include file="/layout/main/footer.jsp" %>
    </div>
</div>
</body>
</html>