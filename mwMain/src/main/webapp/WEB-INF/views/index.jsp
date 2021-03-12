<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>+WEATHER WEAR+</title>

<link rel="styleSheet" href="<c:url value="/css/default.css"/>">

<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

</head>

<body bgcolor="#f5f5f5">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="content" id="content" name="content">
       
    	<input type="button" value="메인으로 이동" id="btnMain">
    	
    	
    	
    	
		<div class="location" id="location">
    		<!-- <button id="btnLoc" onclick="btnLoc_click()"></button>
    		종로구 -->
    		<input type="button" class="font6" value="방명록" id="gbookBtn"> 
    		
    	</div>
    	
    	<div class="weather">
    	
    		
    		<div class="weather_btn"> 
    			<input type="button" class="font6" value="시간대별" id="weatherBtn"> 
    		</div>
    		
    		<div class="weather_icon">
    			<img width="100" src="<c:url value="/image/weatherTest.png"/>">
    		</div>
    		
    		<div class="weather_now">
    			<table>
    				<tr>
    					<td colspan="2" class="font4" id="sky_now">약한 비</td>
    				</tr>	
    				<tr>
    					<td colspan="2" class="font0" id="tmp_now">0°</td>
    				</tr>	
    				<tr>
    					<td colspan="2" class="font4" id="rain_now">0%</td>
    				</tr>	
    				<tr>
    					<td class="font5" id="tmp_max">0° /</td>
    					<td class="font5" id="tmp_min"> -0°</td>
    				</tr>			    				
    			</table>
    		</div>
  
    	</div>
    	
    	
    	<div class="todayCodi">
    	
    		<div class="todayCodi_ootd">
    			<div class="todayCodi_ootd_border">
	    			<table>
	    				<tr>
	    					<td><img height="90" src="<c:url value="/image/ootdTest.jpg"/>"></td>
	    				</tr>
	    				<tr>
	    					<td class="font5">뫄뫄님의 LOOK</td>
	    				</tr>
	    			</table>	
    			</div>
    		</div>
    		
    		<div class="todayCodi_recomm">
    		
	    		<div class="todayCodi_item">
	    			<table>
	    				<tr>
	    					<td class="font4"> -- 오늘의 코디 추천 -- </td>
	    				</tr>
	    				<tr>
	    					<td class="font_left">
	    						00님 <br>오늘 000과 0000 어때요? :)
	    					</td>
	    				</tr>
	    			</table>
	    		</div>
	    		
	    		<div class="todayCodi_item_img">
	    			<div class="todayCodi_item_img1">
							<img width="45" src="<c:url value="/image/codiRecTest.png"/>">
	    			</div>
	    			<div class="todayCodi_item_img2">
							<img width="45" src="<c:url value="/image/codiRecTest.png"/>">
	    			</div>
	    			<div class="todayCodi_item_img3">
							<img width="45" src="<c:url value="/image/codiRecTest.png"/>">
	    			</div>
	    		</div>	
	    		
    		</div>
    		
    		
    		<div class="todayCodi_btn">
	    		<input type="button" value="코디할래요 >" id="btnToCloset">	    		
    		</div>

    		
    	</div>
    	
    	<div class="todayPick">
    	
    		<div class="todayPick_title">
    			<h5>Today's PICK</h5>
    		</div>
    		
    		<div class="top3_ootd">
    		
		    	<div class="top3_ootd1">
		    		<div class="top3_ootd_border">
		    			<table>
		    				<tr>
		    					<td colspan="3">
		    						<img width="70" src="<c:url value="/image/ootdTest.jpg"/>">
		    					</td>
		    				</tr>
		    				<tr>
		    					<td class="font7">00님</td>
		    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
		    					<td class="font7">00</td>
		    				</tr>
		    			</table>
			    	</div>
	    		</div>
	    		
	    		<div class="top3_ootd2">
	    			<div class="top3_ootd_border">
		    			<table>
		    				<tr>
		    					<td colspan="3">
		    						<img width="70" src="<c:url value="/image/ootdTest.jpg"/>">
		    					</td>
		    				</tr>
		    				<tr>
		    					<td class="font7">00님</td>
		    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
		    					<td class="font7">00</td>
		    				</tr>
		    			</table>
	    			</div>
	    		</div>
	    		
	    		<div class="top3_ootd3">
	    			<div class="top3_ootd_border">	
		    			<table>
		    				<tr>
		    					<td colspan="3">
		    						<img width="70" src="<c:url value="/image/ootdTest.jpg"/>">
		    					</td>
		    				</tr>
		    				<tr>
		    					<td class="font7">00님</td>
		    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
		    					<td class="font7">00</td>
		    				</tr>
		    			</table>
	    			</div>
	    		</div>

    		</div>
    		
    	</div>

    	
    	
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>