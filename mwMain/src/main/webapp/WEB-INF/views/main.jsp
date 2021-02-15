<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	session.setAttribute("memidx", "10");
	session.setAttribute("memnic", "메이웨더");
	session.setAttribute("memloc", "0.00,0.00");	
%>
<!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title> 메인 </title>
 
 <link rel="styleSheet" href="<c:url value="/css/default.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/main.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/weather.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/guestbook.css"/>">
 
 <%@ include file="/WEB-INF/views/include/basicset.jsp"%>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
 
 <!-- 서버실행없이 외부제이슨 파일 읽기 위해 -->
<script type="text/javascript" src="resources/json/locationXY.json"></script>

 
 <style>
    

    
 </style>
</head>
 <body bgcolor="#f5f5f5">
     
 	<%@ include file="/WEB-INF/views/include/headerWithLoc.jsp"%>

	
		<div class="content" id="content" name="content">
	
			<div class="mainForm" method="get" enctype="multipart/form-data"> 
		    
		    	
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
	    	
	    </div>
	    	
	</div>


 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>




<script type="text/javascript" src="<c:url value="/js/location.js"/>" charset="UTF-8"></script> 
<script type="text/javascript" src="<c:url value="/js/guestbook.js"/>" charset="UTF-8"></script> 


<script>

		var memIdx = '<%=(String)session.getAttribute("memidx")%>';
		var memNic = '<%=(String)session.getAttribute("memnic")%>';
		var memLoc = '<%=(String)session.getAttribute("memloc")%>';


 		var latitude;			// GPS 위도 
		var longitude;			// GPS 경도
		var x;					// X 좌표 (기상청 기준)
		var y;					// Y 좌표 (기상청 기준)
		
		var wn_data;			// 초단기실황 데이터
		var wbt_data;			// 동네예보 데이터
		var tmp_min;			// 일일 최저 기온
		var tmp_max;			// 일일 최고 기온 
		var tmp_now;			// 현재 기온
		var rain_now;			// 현재 강수량 
		var pty_now;			// 현재 강수형태
		var sky_now;			// 현재 강수형태(한글)

		

		$(document).ready(function() {

			// GPS 위도/경도 요청 -> 기상청 x,y좌표로 변환 -> 서버에 전송
			getLocation();
			
		
		})
		
		
		
		/* 시간대별 Button 클릭 이벤트 */
		$('#weatherBtn').click(function() {
			
			alert(x);
			alert(wn_data[1].category);
			alert(wbt_data[1].category);
			
			var weatherHtml = '<form id="weatherByTimeForm" method="GET" enctype="multipart/form-data">'
							+ 	'<div class="weatherBT_title"><span class="font5">시간대별 일기 예보</span></div>'
							+ 	'<div class="weatherBT_content">'
							+ 		'<div class="weatherBT_table">' // 테이블 삽입 반복 
							+ 			'<table>'
							+ 				'<tr style="height:20px;"><td id="weatherTable_time" class="font7">오후 00시</td></tr>'
							+ 				'<tr style="height:40px;"><td id="weatherTable_img"><img width="30" src="<c:url value="/image/weatherTest.png"/>"></td></tr>'
							+				'<tr style="height:100px;"><td id="weatherTable_tmp" class="font5">0°</td></tr>'
							+ 				'<tr style="height:40px;"><td id="weatherTable_rain" class="font7">00%</td></tr>'
							+ 				'<tr style="height:10px;"><td id="weatherTable_rain_percent"><input type="button"></td></tr>'
							+ 			'</table>'
							+ 		'</div>'
							+		'<div class="weatherBT_detail">'
							+			'<table>'
							+				'<tr><td class="onleft">오늘, 오후 00:00</td><td></td></tr>'
							+				'<tr><td class="onleft">소나기</td>'
							+					'<td class="onright">체감 온도 0°</td></tr>'
							+				'<tr><td class="onleft"><img width="15" src="<c:url value="/image/weatherTest.png"/>">강수량</td>'
    						+					'<td class="onright">0 % </td></tr>'
							+				'<tr><td class="onleft"><img width="15" src="<c:url value="/image/weatherTest.png"/>">비</td>'
							+					'<td class="onright">0.00 mm</td></tr>'
							+				'<tr><td class="onleft"><img width="15" src="<c:url value="/image/weatherTest.png"/>">바람</td>'
							+					'<td class="onright">서남서 0 m/s</td></tr>'
							+			'</table>'
							+		'</div>'
							+	'</div>'
							+ '</form>';
							
			 
		   $('#content').html(weatherHtml);
			
			
		});
		
		

</script>

 </body>
 </html> 