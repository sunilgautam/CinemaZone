<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Your Booking Details</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function(){
    		
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
        <!--FOR TWO COLUMNS ONLY KEEP contLeft AND contCenter AND CHANGE WIDTH IN CSS-->
        <div class="schedule-block-wrapper">
        	<div class="nowshowingtop">
            	<span><s:text name="booking.details.header"></s:text></span>
           	</div>
           	<div class="left contLeft">
           		<div class="details-selection-wrapper">
           			<label class="labelClass selectSeatHeader" for="">
           				<s:text name="booking.details.selection"></s:text>
           			</label>
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.selection.movie"></s:text> : 
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:property value="movieInfo.movieName" />
           				<s:property value="movieInfo.cbRating"/>
           			</label>
           			
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.selection.seats"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:property value="booking.noOfSeats" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.selection.show"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:date name="dateName" format="EEEE dd/MM/yyyy" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<s:property value="booking.schedule.scheduleTime" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.selection.screen"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:property value="booking.schedule.screenName" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.selection.class"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:property value="booking.seatType.seatType" />
           				&nbsp;-&nbsp;
           				<s:property value="seatNames" />
           			</label>
           			<div class="clear"></div>
           		</div>
           		<div class="details-selection-wrapper">
           			<label class="labelClass selectSeatHeader" for=""><s:text name="booking.details.total"></s:text></label>
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.total.tickets"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:property value="booking.transaction.amount" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" for="">
           				<s:text name="booking.details.total.conv"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" for="">
           				<s:property value="booking.transaction.convenienceFees" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" style="font-size: 13px;" for="">
           				<s:text name="booking.details.total.grand"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" style="font-size: 13px;" for="">
           				<s:property value="booking.transaction.grandTotal" />
           			</label>
           			<div class="clear"></div>
           		</div>
           		<s:form id="frm_booking_details" name="frm_booking_details" action="booking-payment" method="GET" theme="simple">
			    <table class="form_table" style="width:100%;">
			        <tr>
			        	<td class="label_cell">
			                &nbsp;
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('booking.details.submit')}"></s:submit>
			                <s:a action="schedules" title="" cssClass="anchor margin10"><s:text name="common.cancel"></s:text></s:a>
			            </td>
			        </tr>
				</table>
				</s:form>
           	</div>
           	<div class="left contCenter">
           		<div class="details-movie-wrapper">
           			<label class="labelClass selectSeatHeader" for=""><s:text name="booking.details.movie"></s:text></label>
           			<div class="postercontainer" style="width: 280px; border-width: 0px;">
						<h1 class="posterheader">
							<s:if test="movieInfo.movieName.length()>33"><s:property value="movieInfo.movieName.substring(0,30)" />...</s:if><s:else><s:property value="movieInfo.movieName" /></s:else>
                        </h1>
                        <div class="left posterimage">
	                        <img width="95" height="140" alt="" src="<s:property value='movieInfo.mainPosterPic'/>" />
                        </div>
                        <div class="left posterdetails" style="width: 170px;">
	                        <span class="posterstar"><s:text name="home.movie.director"></s:text></span>
	                        <span class="posterstarval"><s:if test="movieInfo.director.length()>35"><s:property value="movieInfo.director.substring(0,35)" />...</s:if><s:else><s:property value="movieInfo.director" /></s:else></span>
	                        <span class="posterdir"><s:text name="home.movie.cast"></s:text></span>
	                        <span class="posterdirval"><s:if test="movieInfo.cast.length()>120"><s:property value="movieInfo.cast.substring(0,100)" />...</s:if><s:else><s:property value="movieInfo.cast" /></s:else></span>
                        </div>
					</div>
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
        <%@ include file="/layout/main/footer.jsp" %>
    </div>
</div>
</body>
</html>