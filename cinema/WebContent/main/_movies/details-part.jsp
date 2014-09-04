<%@page import="net.sourceforge.jtds.jdbc.DateTime"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

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
	<!-- <tr>
		<td>
			<p>
			<label class="labelClass details-label" for=""><s:text name="movie.view.synopsis"></s:text></label>
			<label class="labelClass left" for=""><s:property value="movieInfo.synopsis"/></label>
			</p>
		</td>
	</tr> -->
</table>