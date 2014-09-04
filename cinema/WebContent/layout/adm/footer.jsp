<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<div class="center footMenuWrape">
    <ul class="footmenuBar">
        <li><a href="<%= application.getInitParameter("domain_admin") + "movies.action" %>" title="">Movies</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "trailers.action" %>" title="">Trailers</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "posters.action" %>" title="">Posters</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "sliders.action" %>" title="">Sliders</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "tickets.action" %>" title="">Tickets</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "schedules.action" %>" title="">Schedules</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "screens.action" %>" title="">Screens</a></li>
		<li><a href="<%= application.getInitParameter("domain_admin") + "reviews.action" %>" title="">Reviews</a></li>
    </ul>
    <div class="clear"></div>
    <script type="text/javascript">
    	$(document).ready(function() {
    		var docHeight = $(window).height();
    		if($(document).height() === docHeight) {
    			var footerElement = $(".footerFull");
    			footerElement.css('marginTop',(docHeight - footerElement.offset().top - 25));
    		}
    	});
    </script>
</div>