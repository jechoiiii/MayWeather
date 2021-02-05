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

<script>
	
		
		
			// 위치 --------------------------------------------------------------------
			
			var latitude;	// GPS 위도 
			var longitude;	// GPS 경도
			var x;			// X 좌표 (기상청 기준)
			var y;			// Y 좌표 (기상청 기준)
			
			function getLocation() {

				if (navigator.geolocation) { // GPS를 지원하면
					navigator.geolocation.getCurrentPosition(function(p) {
						latitude = p.coords.latitude;
						longitude = p.coords.longitude;
						
						// 위도/경도 -> 기상청 좌표x / 좌표 y 변환
						var rs = dfs_xy_conv("toXY",latitude,longitude);
						x = rs['x'];
						y = rs['y'];
						
						console.log(rs);
						console.log('latitude : '+ latitude, 'longitude : '+ longitude);
				        console.log('x좌표 : '+ x);
				        console.log('y좌표 : '+ y);
						
				  	}, function(error) {
								console.error(error);
				  	}, {
				  		enableHighAccuracy	: false,
				  		maximumAge			: 0,
				  		timeout				: Infinity
				  	});
				} else {
				  alert('GPS를 지원하지 않습니다');
				}
			}
		
		 	
			// LCC DFS 좌표변환을 위한 기초 자료 -----------------------------
		    
		        var RE = 6371.00877; // 지구 반경(km)
			    var GRID = 5.0; // 격자 간격(km)
			    var SLAT1 = 30.0; // 투영 위도1(degree)
			    var SLAT2 = 60.0; // 투영 위도2(degree)
			    var OLON = 126.0; // 기준점 경도(degree)
			    var OLAT = 38.0; // 기준점 위도(degree)
			    var XO = 43; // 기준점 X좌표(GRID)
			    var YO = 136; // 기1준점 Y좌표(GRID)
			 	var X;
			 	var Y;
			    
			    // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
			    
			    function dfs_xy_conv(code, v1, v2) {
			    	
			        var DEGRAD = Math.PI / 180.0;
			        var RADDEG = 180.0 / Math.PI;
			
			        var re = RE / GRID;
			        var slat1 = SLAT1 * DEGRAD;
			        var slat2 = SLAT2 * DEGRAD;
			        var olon = OLON * DEGRAD;
			        var olat = OLAT * DEGRAD;
			
			        var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
			        sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
			        var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
			        sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
			        var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
			        ro = re * sf / Math.pow(ro, sn);
			        var rs = {};
			       
			        if (code == "toXY") {
			            rs['lat'] = v1;
			            rs['lng'] = v2;
			            var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
			            ra = re * sf / Math.pow(ra, sn);
			            var theta = v2 * DEGRAD - olon;
			            if (theta > Math.PI) theta -= 2.0 * Math.PI;
			            if (theta < -Math.PI) theta += 2.0 * Math.PI;
			            theta *= sn;
			            rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
			            rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
			        }
			        else {
			            rs['x'] = v1;
			            rs['y'] = v2;
			            var xn = v1 - XO;
			            var yn = ro - v2 + YO;
			            ra = Math.sqrt(xn * xn + yn * yn);
			            if (sn < 0.0) - ra;
			            var alat = Math.pow((re * sf / ra), (1.0 / sn)); 
			            alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
			
			            if (Math.abs(xn) <= 0.0) {
			                theta = 0.0;
			            }
			            else {
			                if (Math.abs(yn) <= 0.0) {
			                    theta = Math.PI * 0.5;
			                    if (xn < 0.0) - theta;
			                }
			                else theta = Math.atan2(xn, yn);
			            }
			            var alon = theta / sn + olon;
			            rs['lat'] = alat * RADDEG;
			            rs['lng'] = alon * RADDEG;
			        }
			       
			        return rs;
			    }


		$(document).ready(function() {
			getLocation();
		});
		
	
	
	
	</script>

 </body>
 </html> 