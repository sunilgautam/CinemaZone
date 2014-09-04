<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Seats</title>
<%@ include file="/layout/adm/scripts.jsp" %>
</head>
<body style="background:#104E7F;">	
	<div class="seat-details-wrapper">
		<h2>Please select your seats</h2>
		<div class="left details blue">Available</div>
		<div class="left details gray">Unavailable</div>
		<div class="left details yellow">Current Selection</div>
		<div class="left details red">Other Classes</div>
		<div class="clear"></div>
	</div>
	<s:iterator value="seattypes" status="a">
		<s:property value="getValue(a)"/>
	</s:iterator>
	<div class="seat-pattern-wrapper">
		<table class="seat-pattern-style">
			<s:iterator value="seatrows" status="srows">
			<tr>
				<td class="row-legend">
				<s:property value="no" />
				</td>
				<s:iterator value="cells" status="irows">
				<s:if test="status==0">
				<td></td>
				</s:if>
				<s:elseif test="status==1">
				<td class="blue clickable"><s:property value="no" /></td>
				</s:elseif>
				<s:elseif test="status==2">
				<td class="gray"><s:property value="no" /></td>
				</s:elseif>
				</s:iterator>
			</tr>
			</s:iterator>
		</table>
		<div class="screen-part">
			SCREEN
		</div>
	</div>
</body>
</html>