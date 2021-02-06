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
 		max-width: 800px;
 		margin: 0 20px;
 	}
 	
 	/* 위치 ------------------------- */
 	.location {
 		width: 100%;
 		length: 10%;
 		border: 1px solid #aaa;
 		text-align: center;
 		padding: 10px;
 	}
 	
 	
 	/* 날씨 ------------------------- */
 	.weather {
 		width: 100%;
 		length: 30%;
 		padding: 10px;
 		border: 1px solid #aaa;
 		text-align: center;
 		
 	}
 
  	.weather_icon {
 		width: 45%;
 		float:left;
 		padding-left: 20px;
 	}
 	
 	.weather_now {
 		width: 45%;
 		float: right;
 	}
 	
 	.weatherallnow {
 	
 	}
 	
 	
 	
 	/* 오늘의 코디 추천 ------------------------- */
 	.todayCodi {
 		width: 100%;
 		length: 30%;
 		border: 1px solid #aaa;
 		background-color: white;
 		text-align: center;
 	}
 	
 	.todayCodi_ootd {
 		width: 45%;
 		text-align: center;
 		float: left;
 	}
 	
 	.todayCodi_item { 
 		width: 45%;
 		text-align: center;
 		float: right;	
 	}
 	
 	.todayCodi_btn {
 		float: clear;
 	}
 	
 	
	/* Today's Pick' ------------------------- */
 	.todayPick {
 		width: 100%;
 		length: 30%;
 		border: 1px solid #aaa;
 		background-color: #64c2eb;
 		border: 1px solid #aaa;
 		text-align: center;
 	}
 	
 	.todayPick_title {
 		width: 100%;
 	}
 	
 	.top3_ootd {
 		width: 100%;
 		display: flex;
 	}
 	
 	.top3_ootd1{
 		flex: 1;
 	}
 	
 	.top3_ootd2{
 		flex: 1;
 	}
 	
 	.top3_ootd3{
 		flex: 1;
 	}


	table tr, table td {
		/* border: 1px solid; */
	}
 
 </style>
</head>
 <body bgcolor="#f5f5f5">
     
 	<%@ include file="/WEB-INF/views/include/headerWithLoc.jsp"%>

	
		<div class="content" id="content" name="content">
	
			<form id="mainForm" method="get" enctype="multipart/form-data"> 
		    
		    	
				<div class="location">
		    		<button id="btnLoc" onclick="btnLoc_click()">
		    		종로구
		    	</div>
		    	
		    	<div class="weather">
		    	
		    		<div class="weather_all"> 
		    			<input type="button" value="시간대별" onClick="location=<c:url value="/weatherByTime"/>">
		    		</div>
		    		
		    		<div class="weather_icon">
		    			<img width="80" src="<c:url value="/image/weatherTest.png"/>">
		    		</div>
		    		
		    		<div class="weather_now">
		    			<table>
		    				<tr>
		    					<td><h5>약한 비</h5></td>
		    				</tr>	
		    				<tr>
		    					<td><h4>6도</h4></td>
		    				</tr>	
		    				<tr>
		    					<td><h6>최고: 7도 최저: -3도</h6></td>
		    				</tr>			    				
		    			</table>
		    		</div>
		  
		    	</div>
		    	
		    	
		    	<div class="todayCodi">
		    	
		    		<div class="todayCodi_ootd">
		    			<table>
		    				<tr>
		    					<td><img height="70" src="<c:url value="/image/ootdTest.jpg"/>"></td>
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
		    		
		    		<div class="todayCodi_btn">
			    		<input type="button" value="코디할래요" id="btnToCloset">	    		
		    		</div>

		    		
		    	</div>
		    	
		    	<div class="todayPick">
		    	
		    		<div class="todayPick_title">Today's Pick</div>
		    		
		    		<div class="top3_ootd">
		    		
			    		<div class="top3_ootd1">
			    			<table>
			    				<tr>
			    					<td colspan="3">
			    						<img width="70" src="<c:url value="/image/ootdTest.jpg"/>">
			    					</td>
			    				</tr>
			    				<tr>
			    					<td>뫄뫄님</td>
			    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
			    					<td>15</td>
			    				</tr>
			    			</table>
			    		</div>
			    		
			    		<div class="top3_ootd2">
			    			<table>
			    				<tr>
			    					<td colspan="3">
			    						<img width="70" src="<c:url value="/image/ootdTest.jpg"/>">
			    					</td>
			    				</tr>
			    				<tr>
			    					<td>뫄뫄님</td>
			    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
			    					<td>15</td>
			    				</tr>
			    			</table>
			    		</div>
			    		
			    		<div class="top3_ootd3">
			    			<table>
			    				<tr>
			    					<td colspan="3">
			    						<img width="70" src="<c:url value="/image/ootdTest.jpg"/>">
			    					</td>
			    				</tr>
			    				<tr>
			    					<td>뫄뫄님</td>
			    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
			    					<td>15</td>
			    				</tr>
			    			</table>
			    		</div>
			    		
		    		</div>
		    		
		    	</div>
		    	
			</form>
	    	
	    </div>
	    	
	</div>


 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


<script>

<%@ include file="/js/location.js"%>

	
		window.onload = function () {
			
			// GPS 위도/경도 요청 -> 기상청 x,y좌표로 변환 -> 서버에 전송
			getLocation();
				
		}


	
	</script>

 </body>
 </html> 