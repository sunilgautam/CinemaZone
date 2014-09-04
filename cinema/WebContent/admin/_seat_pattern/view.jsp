<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<div class="seat-pattern-main-wrapper">
	<div class="type-legend">
	<s:iterator value="seattypes" status="stype">
		<div class="left">
		<s:property/>
		</div>
	</s:iterator>
	<div class="clear"></div>
	</div>
	
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
</div>