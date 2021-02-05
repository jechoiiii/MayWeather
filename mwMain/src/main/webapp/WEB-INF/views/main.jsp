<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title> 메인 </title>
 
 <link rel="styleSheet" href="<c:url value="/css/default.css"/>">
 
 <%@ include file="/WEB-INF/views/include/basicset.jsp"%>
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
 
 <style>
 
 	
	.content{
	    margin-top: 100px;
	    height: max;
	}
 	
 	#mainForm {
 		width: 90%;
 		margin: 0 20px;
 	}
 	
 	/* 위치 ------------------------- */
 	.location {
 		width: 100%;
 		length: 20%;
 		border: 1px solid #aaa;
 		text-align: center;
 		padding: 10px;
 	}
 	
 	
 	/* 날씨 ------------------------- */
 	.weather {
 		width: 100%;
 		length: 50%;
 		border: 1px solid #aaa;
 		text-align: center;
 		
 	}
 
  	.weather_icon {
 		width: 45%;
 		/* float:left; */
 	}
 	
 	.weather_now {
 		width: 45%;
 		/* float: left; */
 	}
 	
 	
 	/* 오늘의 코디 추천 ------------------------- */
 	.todayCodi {
 		width: 95%;
 		length: 20%;
 		border: 1px solid #aaa;
 		background-color: white;
 		text-align: center;
 	}
 	
 	.todayCodi_ootd {
 		width: 45%;
 		/* float: left; */
 	}
 	
 	.todayCodi_item { 
 		width: 45%;
 		/* float: left; */ 	
 	}
 	
 	
	/* Today's Pick' ------------------------- */
 	.todayPick {
 		width: 95%;
 		length: 50%;
 		margin: 10px;
 		background-color: #64c2eb;
 		border: 1px solid #aaa;
 		text-align: center;
 	}
 	

 
 </style>
</head>
 <body bgcolor="#f5f5f5">
     
 	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	
		<div class="content" id="content" name="content">
	
			<form id="mainForm" method="get" enctype="multipart/form-data"> 
		    
		    	
		    	<div class="location">
		    		<button id="btnLoc" onclick="btnLoc_click()">
		    		종로구
		    	</div>
		    	
		    	<div class="weather">
		    	
		    		<div class="weather_more">
		    			<input type="button" value="시간대별" id="btnWeather">
		    		</div>
		    		
		    		<div class="weather_icon">
		    			<img width="80" src="<c:url value="/image/weatherTest.png"/>">
		    		</div>
		    		
		    		<div class="weather_now">
		    			<table>
		    				<tr>
		    					<td>약한 비</td>
		    					<td>6도</td>
		    					<td>최고: 7도 최저: -3도</td>
		    				</tr>
		    			</table>
		    		</div>
		  
		    	</div>
		    	
		    	
		    	<div class="todayCodi">
		    	
		    		<div class="todayCodi_ootd">
		    			<table>
		    				<tr>
		    					<td><img height="50" src="<c:url value="/image/ootdTest.jpg"/>"></td>
		    				</tr>
		    				<tr>
		    					<td>뫄뫄님의 Look</td>
		    				</tr>
		    			</table>	
		    		</div>
		    		
		    		<div class="todayCodi_item">
		    			<table>
		    				<tr>
		    					<td>---- 오늘의 코디 추천 ----</td>
		    				</tr>
		    				<tr>
		    					<td>오늘은 롱패딩과 어그부츠 어떠세요? :)</td>
		    				</tr>
		    				<tr>
		    					<td>
		    						<img width="40" src="<c:url value="/image/codiRecTest.png"/>">
		    						<img width="40" src="<c:url value="/image/codiRecTest.png"/>">
		    						<img width="40" src="<c:url value="/image/codiRecTest.png"/>">
		    					</td>
		    				</tr>
		    			</table>
		    		</div>
		    		
		    		<input type="button" value="코디할래요" id="btnToCloset">
		    		
		    	</div>
		    	
		    	<div class="todayPick">
		    	
		    		<h4>Today's Pick</h4>
		    		
		    		<div class="top3_ootd">
		    			<table>
		    				<tr>
		    					<td rowspan="3">
		    						<img width="50" src="<c:url value="/image/ootdTest.jpg"/>">
		    					</td>
		    				</tr>
		    				<tr>
		    					<td>뫄뫄님</td>
		    					<td>하트</td>
		    					<td>15</td>
		    				</tr>
		    			</table>
		    		</div>
		    		
		    	</div>
		    	
			</form>
	    	
	    </div>
	    	
	</div>


 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>



 </body>
 </html> 