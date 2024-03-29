<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<div class="schedule-movie-model">
	<h3><s:text name="schedule.schedule"></s:text> (<s:property value="screenName" /> : <s:date name="scheduleDateName" format="EEEE dd/MM/yyyy" />)</h3>
	<s:form id="frm_addschedule" name="frm_addschedule" action="schedules-schedule-process" onsubmit="doSchedule(this); return false;" method="POST" theme="simple">
	    <table class="form_schedule">
	    	<tr>
	        	<td class="schedule-sr-cell" style="height:20px;">
	                <label class="header">#</label>
	            </td>
	            <td class="schedule-time-cell" style="height:20px;">
	                <label class="header">Show time</label>
	            </td>
	            <td class="schedule-movie-cell" style="height:20px;">
	                <label class="header">Movie</label>
	            </td>
	        </tr>
	        <s:iterator begin="1" end="7" var="rowSrNo">
			<tr>
	        	<td class="schedule-sr-cell">
	                <label class="labelClass" for=""><s:property value="#rowSrNo"/></label>
	            </td>
	            <td class="schedule-time-cell" style="width: 100px;">
	                <s:select 
	                	name="timeSlots%{#rowSrNo}" id="timeSlots%{#rowSrNo}" cssClass="dropList schedule-time" headerKey="0" headerValue="Select"
	                	list="#{  '1':'10:00 AM' , '2':'10:15 AM' , '3':'10:30 AM' , '4':'10:45 AM' , '5':'11:00 AM' , '6':'11:15 AM' , '7':'11:30 AM' , '8':'11:45 AM' , '9':'12:00 PM' , '10':'12:15 PM' ,
									  '11':'12:30 PM' , '12':'12:45 PM' , '13':'01:00 PM' , '14':'01:15 PM' , '15':'01:30 PM' , '16':'01:45 PM' , '17':'02:00 PM' , '18':'02:15 PM' , '19':'02:30 PM' , '20':'02:45 PM' ,
									  '21':'03:00 PM' , '22':'03:15 PM' , '23':'03:30 PM' , '24':'03:45 PM' , '25':'04:00 PM' , '26':'04:15 PM' , '27':'04:30 PM' , '28':'04:45 PM' , '29':'05:00 PM' , '30':'05:15 PM' ,
									  '31':'05:30 PM' , '32':'05:45 PM' , '33':'06:00 PM' , '34':'06:15 PM' , '35':'06:30 PM' , '36':'06:45 PM' , '37':'07:00 PM' , '38':'07:15 PM' , '39':'07:30 PM' , '40':'07:45 PM' ,
									  '41':'08:00 PM' , '42':'08:15 PM' , '43':'08:30 PM' , '44':'08:45 PM' , '45':'09:00 PM' , '46':'09:15 PM' , '47':'09:30 PM' , '48':'09:45 PM' , '49':'10:00 PM' , '50':'10:15 PM' ,
									  '51':'10:30 PM' , '52':'10:45 PM' , '53':'11:00 PM' , '54':'11:15 PM' , '55':'11:30 PM' , '56':'11:45 PM' , '57':'00:00 AM' }"
	                ></s:select>
	            </td>
	            <td class="schedule-movie-cell" style="width: 180px;">
	                <s:select name="movieId%{#rowSrNo}" id="movieId%{#rowSrNo}" list="moviesList" cssClass="dropList schedule-movie" headerKey="0" headerValue="Select"></s:select>
	            </td>
	        </tr>
			</s:iterator>
	        <tr>
	            <td colspan="3" style="text-align:center; height: 40px;">
	            	<s:hidden name="screenId" id="screenId" value="%{screenId}"></s:hidden>
					<s:hidden name="scheduleDate" id="scheduleDate" value="%{scheduleDate}"></s:hidden>
	                <s:submit cssClass="myButton" value="%{getText('schedule.schedule')}"></s:submit>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="3" style="text-align:center;">
	                <div id="schedule-form-message-element" class="schedule-form-message">
	                	
	                </div>
	            </td>
	        </tr>
	    </table>
	</s:form>
</div>