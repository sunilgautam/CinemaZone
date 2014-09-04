<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Schedules</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	window.history.forward(1);
    	$(document).ready(function(){
    		$( "#tabs-pay-type" ).tabs();
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
           			<label class="labelClass selectSeatHeader" for=""><s:text name="booking.details.payment"></s:text></label>
           			<div id="tabs-pay-type" class="mainPay">
           				<s:form id="frm_payment_details" name="frm_payment_details" action="booking-post-payment" method="POST" theme="simple">
           				<ul>
							<li><a href="#tabs-cr-dr-type">Credit/Debit Cards</a></li>
						</ul>
			            <div id="tabs-cr-dr-type" class="payOpt">
			            	<table class="form_table">
						        <tr>
						        	<td class="label_cell">
						                <h5><s:text name="booking.payment.cardtype"></s:text> :</h5>
						            </td>
						            <td class="control_cell">
						                <s:select name="cardType" id="cardType" cssClass="dropList" list="booking.paymentDetail.cardTypes">
			                			</s:select>
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <h5><s:text name="booking.payment.cardnumber"></s:text> :</h5>
						            </td>
						            <td class="control_cell">
						                <s:textfield name="cardNo" id="cardNo" autocomplete="OFF" maxlength="16" type="text" cssStyle="background: none repeat scroll 0 0 #F9D574; border-left: 1px solid #7D7D7D; border-top: 1px solid #7D7D7D;text-align: left;width:200px;" />
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <h5><s:text name="booking.payment.expdate"></s:text> :</h5>
						            </td>
						            <td class="control_cell">
						                <s:select name="expiryMonth" id="expiryMonth" cssClass="dropList" cssStyle="width:80px;" headerKey="" headerValue="MM" list="booking.paymentDetail.expiryMonths">
			                			</s:select>
			                			<s:select name="expiryYear" id="expiryYear" cssClass="dropList" cssStyle="width:80px;" headerKey="" headerValue="YY" list="booking.paymentDetail.expiryYears">
			                			</s:select>
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <h5><s:text name="booking.payment.securecode"></s:text> :</h5>
						            </td>
						            <td class="control_cell">
						                <s:textfield name="cvv" id="cvv" autocomplete="OFF" maxlength="3" cssStyle="background: none repeat scroll 0 0 #ffffff; border-left: 1px solid #7D7D7D; border-top: 1px solid #7D7D7D;text-align: left;width:100px;" maxlength="100" />
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <h5><s:text name="booking.payment.cardname"></s:text> :</h5>
						            </td>
						            <td class="control_cell">
						                <s:textfield name="cardName" id="cardName" autocomplete="OFF" maxlength="50" cssStyle="background: none repeat scroll 0 0 #ffffff; border-left: 1px solid #7D7D7D; border-top: 1px solid #7D7D7D;text-align: left;width:200px;" maxlength="100" />
						            </td>
						        </tr>
						        <tr>
						        	<td class="label_cell">
						                <h5><s:text name="booking.payment.totalamt"></s:text> :</h5>
						            </td>
						            <td class="control_cell">
						                <label class="labelClass" style="font-size: 13px;" for="">
					           				<s:property value="booking.transaction.grandTotal" />
					           			</label>
						            </td>
						        </tr>
						        <tr>
						            <td colspan="2" class="control_cell" style="text-align: center;" valign="top">
						            	<s:hidden name="secureTransKey" id="secureTransKey" value="%{booking.secureTransKey}"></s:hidden>
						                <s:submit cssClass="submitPayment" value="%{getText('booking.payment.make')}"></s:submit>
						            </td>
						       	</tr>
						       	<tr>
						            <td colspan="2" class="control_cell" style="text-align: center;" valign="top">
						                <s:a action="schedules" title="" cssClass="anchor margin10"><s:text name="common.cancel"></s:text></s:a>
						            </td>
						        </tr>
						    </table>
						</div>
						</s:form>
					</div>
           		</div>
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
           		<div class="details-selection-wrapper">
           			<label class="labelClass selectSeatHeader" for=""><s:text name="booking.details.total"></s:text></label>
           			<label class="labelClass selectionLabel left" style="width: 40%" for="">
           				<s:text name="booking.details.total.tickets"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" style="width: 50%" for="">
           				<s:property value="booking.transaction.amount" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" style="width: 40%" for="">
           				<s:text name="booking.details.total.conv"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" style="width: 50%" for="">
           				<s:property value="booking.transaction.convenienceFees" />
           			</label>
           			
           			<label class="labelClass selectionLabel left" style="font-size: 13px; width: 40%" for="">
           				<s:text name="booking.details.total.grand"></s:text> :
           			</label>
           			<label class="labelClass selectionValue left" style="font-size: 13px; width: 50%" for="">
           				<s:property value="booking.transaction.grandTotal" />
           			</label>
           			<div class="clear"></div>
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