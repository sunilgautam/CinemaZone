<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Schedule</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script type="text/javascript">
		$(document).ready(function() {
		$(function() {
               $( "#searchDate" ).datepicker({
                   dateFormat: 'dd/mm/yy'
               });
           });
			
    	var validator = $("#frm_search_schedule").validate({
    		rules: {
    			searchDate: "required"
    		},
    		messages: {
    			searchDate: "*"
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
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<s:actionmessage />
						<s:actionerror />
					</ul>
				</div>
				<div class="schedule-wrapper">
					<div class="schedule-search-wrapper">
						<s:form id="frm_search_schedule" name="frm_search_schedule" action="schedules-view" method="POST" theme="simple">
			    		<table class="form_table">
			        		<tr>
			        			<td class="label_cell" style="width:80px;">
			                		<label class="labelClass" for=""><s:text name="schedule.searchdate"></s:text></label>
			            		</td>
			            		<td class="control_cell" style="width:250px;">
			                		<s:textfield name="searchDate" id="searchDate" cssClass="inpText" />
			            		</td>
			            		<td class="control_cell">
			                		<s:submit cssClass="myButton" value="%{getText('common.search')}"></s:submit>
			            		</td>
			        		</tr>
			        	</table>
			        	</s:form>
					</div>
					<s:iterator value="screenSchedules" var="screenSchedule">
					<div class="schedule-screen-wrapper">
						<div class="schedule-screen-header">
							<h3><s:property value="#screenSchedule.screenName" /></h3>
						</div>
						<div class="schedule-screen-schedule-wrapper">
							<s:iterator value="#screenSchedule.daySchedules" var="daySchedule">
							<div class="schedule-screen-schedule-view">
								<div class="schedule-screen-schedule-header">
									<label class="header"><s:date name="#daySchedule.dateName" format="EEEE dd/MM/yyyy" /></label>
								</div>
								<div class="schedule-screen-schedule-body ">
									<table class="form_schedule">
								    	<tr>
								        	<td class="schedule-sr-cell" style="height:20px;">
								                <label class="header"><s:text name="schedule.view.srno" /></label>
								            </td>
								            <td class="schedule-time-cell" style="height:20px;">
								                <label class="header"><s:text name="schedule.view.showtime" /></label>
								            </td>
								            <td class="schedule-movie-cell" style="height:20px;">
								                <label class="header"><s:text name="schedule.view.movie" /></label>
								            </td>
								        </tr>
								        <s:iterator value="#daySchedule.schedules" var="schedule" status="scheduleSrNo">
									        <tr>
									        	<td class="schedule-sr-cell">
									                <label class="label-schedule" for=""><s:property value="#scheduleSrNo.index+1" /></label>
									            </td>
									            <td class="schedule-time-cell">
									                <label class="label-schedule" for=""><s:property value="#schedule.scheduleTime" /></label>
									            </td>
									            <td class="schedule-movie-cell">
									                <label class="label-schedule" for=""><s:property value="#schedule.movieName" /></label>
									            </td>
									        </tr>
										</s:iterator>
									</table>
								</div>
							</div>
							</s:iterator>
							<div class="clear"></div>
						</div>
					</div>
					</s:iterator>
					<s:a action="schedules" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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