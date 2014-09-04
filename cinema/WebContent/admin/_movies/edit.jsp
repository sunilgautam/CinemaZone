<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Movie - edit</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script type="text/javascript">
		$(document).ready(function() {
		$(function() {
               $( "#releaseDate" ).datepicker({
                   dateFormat: 'dd/mm/yy'
               });
           });
			
    	var validator = $("#frm_editmovie").validate({
    		rules: {
    			movieName: "required",
	    	    director: "required",
	    	    cast: "required",
	    	    genre: "required",
	    	    lang: "required",
	    	    synopsis: "required",
	    	    cbRating: "required",
	    	    releaseDate: "required"
    		},
    		messages: {
                movieName: "<s:text name="movie.blank.name"></s:text>",
	    	    director: "<s:text name="movie.blank.director"></s:text>",
	    	    cast: "<s:text name="movie.blank.cast"></s:text>",
	    	    genre: "<s:text name="movie.blank.genre"></s:text>",
	    	    lang: "<s:text name="movie.blank.lang"></s:text>",
	    	    synopsis: "<s:text name="movie.blank.synopsis"></s:text>",
	    	    cbRating: "<s:text name="movie.blank.cbRating"></s:text>",
	    	    releaseDate: "<s:text name="movie.blank.releaseDate"></s:text>"
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
	        <div class="content-box-header">
	            <h3><s:text name="screen.add"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:form id="frm_editmovie" name="frm_editmovie" action="movies-edit-process" method="POST" theme="simple">
			    <table class="form_table">
			    	<tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.view.id"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="movie.getMovieId()"/></label>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.name"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="movieName" id="movieName" maxlength="100" cssClass="inpText" value="%{movie.getMovieName()}" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.director"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="director" id="director" maxlength="200" cssClass="inpText" value="%{movie.getDirector()}" />
			            </td>
			        </tr>
			        <tr valign="top">
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.cast"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textarea name="cast" id="cast" cols="40" rows="4" cssStyle="resize:auto; overflow: auto;" cssClass="inpText" value="%{movie.getCast()}"></s:textarea>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.genre"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select 
			                	name="genre" id="genre" cssClass="dropList" 
			                	headerValue="%{getText('movie.select.genre')}" headerKey="" value="%{movie.getGenre()}"
			                	list="#{ 'Action':'Action' ,'Action/Thriller':'Action/Thriller' ,'Action/Drama':'Action/Drama' ,'Action/Romance':'Action/Romance' ,
										'Action/Sci-Fi':'Action/Sci-Fi' ,'Action/Adventure':'Action/Adventure' ,'Action/Horror':'Action/Horror' ,'Action/Comedy':'Action/Comedy' ,
										'Adventure':'Adventure' ,'Animation':'Animation' ,'Animation/Mythology':'Animation/Mythology' ,'Biograophy':'Biograophy' ,'Biograophy/Drama':'Biograophy/Drama' ,
										'Children Film':'Children Film' ,'Comedy':'Comedy' ,'Comedy/Romance':'Comedy/Romance' ,'Comedy/Drama':'Comedy/Drama' ,'Crime':'Crime' ,
										'Crime/Drama':'Crime/Drama' ,'Crime/Thriller':'Crime/Thriller' ,'Crime/Adventure':'Crime/Adventure' ,'Crime/Romance':'Crime/Romance' ,
										'Crime/Social':'Crime/Social' ,'Drama':'Drama' ,'Fantasy':'Fantasy' ,'Ghost':'Ghost' ,'Horror':'Horror' ,'Horror/Comedy':'Horror/Comedy' ,
										'Mythology':'Mythology' ,'Political/Drama':'Political/Drama' ,'Political/Thriller':'Political/Thriller' ,'Romance':'Romance' ,
										'Romance/Drama':'Romance/Drama' ,'Romance/Social':'Romance/Social' ,'Romance/Fantasy':'Romance/Fantasy' ,'Satire':'Satire' ,
										'Sci-Fi':'Sci-Fi' ,'Social':'Social' ,'Social/Drama':'Social/Drama' ,'Suspense':'Suspense' ,'Suspense/Thriller':'Suspense/Thriller' ,
										'Thriller':'Thriller' ,'Thriller/Romance':'Thriller/Romance' }"
			                ></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.lang"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select 
			                	name="lang" id="lang" cssClass="dropList" 
			                	headerValue="%{getText('movie.select.lang')}" headerKey="" value="%{movie.getLang()}"
			                	list="#{ 'Hindi':'Hindi' ,'English':'English' ,'Marathi':'Marathi' }"
			                ></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.duration"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select 
			                	name="hours" id="hours" cssClass="dropList" cssStyle="width:90px;" value="%{movie.getHours()}"
			                	list="#{ '00':'00' , '01':'01' , '02':'02' , '03':'03' , '04':'04' }"
			                ></s:select>
			                <label>&nbsp;:&nbsp;</label>
			                <s:select 
			                	name="minutes" id="minutes" cssClass="dropList" cssStyle="width:90px;" value="%{movie.getMinutes()}"
			                	list="#{ '01':'01' , '02':'02' , '03':'03' , '04':'04' ,'05':'05' , '06':'06' , '07':'07' , '08':'08' , '09':'09' , '10':'10' ,
			                			'11':'11' , '12':'12' , '13':'13' , '14':'14' ,'15':'15' , '16':'16' , '17':'17' , '18':'18' , '19':'19' , '20':'20' ,
			                			'21':'21' , '22':'22' , '23':'23' , '24':'24' ,'25':'25' , '26':'26' , '27':'27' , '28':'28' , '29':'29' , '30':'30' ,
			                			'31':'31' , '32':'32' , '33':'33' , '34':'34' ,'35':'35' , '36':'36' , '37':'37' , '38':'38' , '39':'39' , '40':'40' ,
			                			'41':'41' , '42':'42' , '43':'43' , '44':'44' ,'45':'45' , '46':'46' , '47':'47' , '48':'48' , '49':'49' , '50':'50' ,
			                			'51':'51' , '52':'52' , '53':'53' , '54':'54' ,'55':'55' , '56':'56' , '57':'57' , '58':'58' , '59':'59' , '00':'00' }"
			                ></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.releaseDate"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="releaseDate" maxlength="10" id="releaseDate" cssClass="inpText" value="%{movie.getReleaseDate()}" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.cbRating"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select 
			                	name="cbRating" id="cbRating" cssClass="dropList" value="%{movie.getCbRating()}"
			                	list="#{ 'U':'U' , 'U/A':'U/A' , 'A':'A' , 'S':'S' }"
			                ></s:select>
			            </td>
			        </tr>
			        <tr valign="top">
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="movie.synopsis"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textarea name="synopsis" id="synopsis" cols="40" rows="6" cssStyle="resize:auto; overflow: auto;" cssClass="inpText" value="%{movie.getSynopsis()}"></s:textarea>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <s:hidden name="movieId" value="%{movie.getMovieId()}"></s:hidden>
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('common.update')}"></s:submit>
			                <s:a action="movies" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
			            </td>
			        </tr>
			    </table>
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
        <%@ include file="/layout/adm/footer.jsp" %>
    </div>
</div>
</body>
</html>