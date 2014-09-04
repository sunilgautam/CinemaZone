<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="cinema.domain.pojo.AdminInfo"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<div class="menuContainer">
	<ul class="menuBar">
		<li><a href="<%= application.getInitParameter("domain_admin") + "movies.action" %>" title="">Movies</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "trailers.action" %>" title="">Trailers</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "posters.action" %>" title="">Posters</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "sliders.action" %>" title="">Sliders</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "tickets.action" %>" title="">Tickets</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "schedules.action" %>" title="">Schedules</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "screens.action" %>" title="">Screens</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "reviews.action" %>" title="">Reviews</a></li>
	</ul>
</div>
<div id="signingBlock" style="margin-right: 7px;">
	<ul>
		<li style="float: right;"><a href="<%= application.getInitParameter("domain") + "logout.action" %>" title="Logout">Logout</a>
		</li>
		<li style="float: right;">&nbsp;,&nbsp;</li>
		<li style="float: right;">
			<span class="welcome">Hi
				<span id="userspan">
					<%
						try
						{
							if (session.getAttribute(cinema.util.Constants.ADMIN_HANDLE) != null) 
							{
								AdminInfo aInfo = (AdminInfo) session.getAttribute(cinema.util.Constants.ADMIN_HANDLE);
								if (aInfo != null) 
								{
									out.write(aInfo.getUserName());
								} 
								else 
								{
									response.sendRedirect(cinema.util.Constants.DEFAULT_LOGIN_URI_JSP);
								}
							} 
							else 
							{
								response.sendRedirect(cinema.util.Constants.DEFAULT_LOGIN_URI_JSP);
							}
						}
						catch(Exception ex)
						{
							response.sendRedirect(cinema.util.Constants.DEFAULT_LOGIN_URI_JSP);
						}
					%>
				</span>
			</span>
		</li>
	</ul>
</div>
<div class="clear"></div>