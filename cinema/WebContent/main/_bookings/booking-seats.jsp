<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Booking Step-2</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function(){
    		seatSelectionHandle();
    		initSelection();
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
            	<span><s:text name="booking.seats.all"></s:text></span>
           	</div>
        	<div class="error-info-Div">
				<ul class="errorList">
					<s:actionmessage />
					<s:actionerror />
				</ul>
			</div>
			<div class="seat-pattern-main-wrapper">
				<label class="labelClass selectSeatHeader" for=""><s:text name="booking.seats.select"></s:text></label>
				<div class="details-header-wrapper">
					<div class="details-header">
						<s:property value="movieInfo.movieName"/>
						<s:property value="movieInfo.cbRating"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<s:date name="dateName" format="EEEE dd/MM/yyyy" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<s:property value="booking.schedule.scheduleTime"/>
					</div>
					<div class="details-header" style="font-size: 12px; line-height: 25px;">
						<s:property value="booking.schedule.screenName"/> : <s:property value="booking.seatType.seatType"/>
					</div>
				</div>
				<div class="seat-details-wrapper">
					<div class="left details blue"><s:text name="booking.available"></s:text></div>
					<div class="left details gray"><s:text name="booking.unavailable"></s:text></div>
					<div class="left details yellow"><s:text name="booking.current"></s:text></div>
					<div class="left details red"><s:text name="booking.otherclass"></s:text></div>
					<div class="clear"></div>
				</div>
				<div class="type-legend" style="margin-left: 0px;">
				<s:iterator value="seattypes" status="stype">
					<div class="left">
					<s:property/>
					</div>
				</s:iterator>
				<div class="clear"></div>
				</div>
				<div class="seat-pattern-wrapper" style="text-align: center;">
					<table class="seat-pattern-style">
						<s:iterator value="seatrows" var="srows">
						<tr>
							<td class="row-legend">
							<s:property value="#srows.no" />
							</td>
							<s:iterator value="cells" status="irows">
							<s:if test="status==0">
							<td></td>
							</s:if>
							<s:elseif test="status==1">
							<td class="blue clickable" data-cell='<s:property value="no" />' data-row='<s:property value="#srows.no" />'><s:property value="no" /></td>
							</s:elseif>
							<s:elseif test="status==2">
							<td class="gray"><s:property value="no" /></td>
							</s:elseif>
							<s:elseif test="status==3">
							<td class="red"><s:property value="no" /></td>
							</s:elseif>
							</s:iterator>
						</tr>
						</s:iterator>
					</table>
					<div class="screen-part" style="text-align: center;">
						SCREEN
					</div>
				</div>
				<s:form id="frm_booking_seats" name="frm_booking_seats" onsubmit="return validateSelection();" action="booking-pre-user" method="POST" theme="simple">
					<div style="text-align: right;">
						<s:hidden id="maxSeatSelection" name="maxSeatSelection" value="%{booking.noOfSeats}"></s:hidden>
						<s:hidden id="seatsSelected" name="seatsSelected" value=""></s:hidden>
						<s:submit cssClass="myButton" value="%{getText('booking.seat.submit')}"></s:submit>
						<s:a action="schedules" title="" cssClass="anchor margin10"><s:text name="booking.back.schedule"></s:text></s:a>
					</div>
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
        <%@ include file="/layout/main/footer.jsp" %>
    </div>
</div>
</body>
</html>