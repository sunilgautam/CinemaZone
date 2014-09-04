<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Schedules</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function(){
    		scheduleHandle();
    		initScheduleHandle();
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
            	<span><s:text name="schedule.all"></s:text></span>
           	</div>
           	<div class="error-info-Div">
				<ul class="errorList">
					<s:actionmessage/>
					<s:actionerror />
				</ul>
			</div>
        	<s:iterator value="daySchedules" var="daySchedule">
        	<div class="schedule-block-day">
        		<div class="schedule-block-day-part left">
        			<label class="label-schedule-day" for=""><s:date name="#daySchedule.dateName" format="EEEE dd/MM/yyyy" /></label>
        		</div>
        		<div class="schedule-block-time-part left">
        			<s:iterator value="#daySchedule.schedules" var="schedule">
        				<s:if test="#schedule.scheduled==true">
        					<s:if test="#schedule.canBooked==true">
								<!-- LINKS ACTIVE FOR BOOKING -->
        						<div class="schedule-block-time-item left">
		        					<label class="label-schedule-mvname left" for="">
		        						<span class="ui-icon ui-icon-video left"></span>
		        						<s:property value="#schedule.movieName" />
		        					</label>
									<s:a cssClass="label-schedule-mvtime left" action="bookings">
										<s:param name="movieId" value="#schedule.movieId"></s:param>
										<s:param name="movieName" value="#schedule.movieName"></s:param>
										<s:param name="scheduleId" value="#schedule.scheduleId"></s:param>
										<s:param name="mode">s</s:param>
										<s:property value="#schedule.scheduleTime" />
									</s:a>
									<label class="label-schedule-mvscr left" for=""><s:property value="#schedule.screenName" /></label>
									<span class="label-schedule-toggle-icon ui-icon ui-icon-circle-arrow-s" data-status="N" data-ref='<s:property value="#schedule.movieId" />'></span>
									<div class="schedule-block-time-item-desc">
										
									</div>
		        				</div>
        					</s:if>
        					<s:else>
								<!-- LINKS NOT ACTIVE FOR BOOKING -->
								<div class="schedule-block-time-item left">
		        					<label class="label-schedule-mvname left" for="">
		        						<span class="ui-icon ui-icon-video left"></span>
		        						<s:property value="#schedule.movieName" />
		        					</label>
									<label class="label-schedule-mvtime label-schedule-mvtime-no left" for="">
										<s:property value="#schedule.scheduleTime" />
									</label>
									<label class="label-schedule-mvscr left" for=""><s:property value="#schedule.screenName" /></label>
									<span class="label-schedule-toggle-icon ui-icon ui-icon-circle-arrow-s" data-status="N" data-ref='<s:property value="#schedule.movieId" />'></span>
									<div class="schedule-block-time-item-desc">
										
									</div>
		        				</div>
							</s:else>
        				</s:if>
        				<s:else>
        					<!-- NOTHING -->
        				</s:else>
					</s:iterator>
        		</div>
        		<div class="clear"></div>
        	</div>
        	</s:iterator>
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