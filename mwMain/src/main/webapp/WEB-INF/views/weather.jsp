<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title> 시간대별 날씨 </title>
 
 <link rel="styleSheet" href="<c:url value="/css/default.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/main.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/weather.css"/>">
 
 <%@ include file="/WEB-INF/views/include/basicset.jsp"%>
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
 
 <style>
 
 </style>
</head>
 <body bgcolor="#f5f5f5">
     
 	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	
		<div class="content" id="content" name="content">
	
			<form id="weatherByTimeForm" method="GET" enctype="multipart/form-data"> 
		    	
		    	
		    	<div class="weatherBT_title">
		    		<span class="font5">시간대별 일기 예보</span>
		    	</div>
		    	
		    	
		    	<div class="weatherBT_content">
		    	
		    		<div class="weatherBT_table">
		    			<!-- 테이블 반복 -->
		    			<table>
		    				<tr style="height:20px;">
		    					<td id="weatherTable_time" class="font7">오후 11시</td>
		    				</tr>
		    				<tr style="height:40px;">
		    					<td id="weatherTable_img"><img width="30" src="<c:url value="/image/weatherTest.png"/>"></td>
		    				</tr>
		    				<tr style="height:100px;"> 
		    					<td id="weatherTable_tmp" class="font5">6°</td>
		    				</tr>
		    				<tr style="height:40px;">
		    					<td id="weatherTable_rain" class="font7">20%</td>
		    				</tr>
		    				<tr style="height:10px;">
		    					<td id="weatherTable_rain_percent"><input type="button"></td>
		    				</tr>
		    			</table>
		    		</div>
		    		
		    		<div class="weatherBT_detail">
		    			<table>
		    				<tr>
		    					<td class="onleft">오늘, 오후 3:00</td>
		    					<td></td>
		    				</tr>
		    				<tr>
		    					<td class="onleft">소나기</td>
		    					<td class="onright">체감 온도 6°</td>
		    				</tr>
		    				<tr>
		    					<td class="onleft">
		    						<img width="15" src="<c:url value="/image/weatherTest.png"/>">
		    						강수량 
		    					</td>
		    					<td class="onright">0% </td>
		    				</tr>
		    				<tr>
		    					<td class="onleft">
		    						<img width="15" src="<c:url value="/image/weatherTest.png"/>">
		    						비
		    					</td>
		    					<td class="onright">0.00 밀리미터</td>
		    				</tr>
		    				<tr>
		    					<td class="onleft">
		    						<img width="15" src="<c:url value="/image/weatherTest.png"/>">
		    						바람
		    					</td>
		    					<td class="onright">서남서 2미터/초</td>
		    				</tr>
		    			</table>
		    		</div>
		    		
		  
		    	</div>
		    	
			</form>
	    	
	    </div>
	    

 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	


		$(document).ready(function() {

			
 			/* // 오늘 & 내일 날씨 불러오기
			$.ajax({
				
				url : 'http://localhost:8080/main/weatherbytime',
				type : 'GET',
				success : function(data) {
					$('.weather_table').append(data);
				},
				error : function(e) {
					console.log("에러발생 : "+ e);
				}
			});  */
			
			
		});

		
	
	
	
	</script>

 </body>
 </html> 