<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title> 메인 </title>
 
 <link rel="styleSheet" href="<c:url value="/css/default.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/main.css"/>">
 
 <%@ include file="/WEB-INF/views/include/basicset.jsp"%>
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
 
 <style>
    

    .header_loc {
    	position: absolute;
    	top: 35px;
    	left: 145px;
    }
    
    #btnLocc {
  		width: 100px;
    	background-color: #64c2eb;
    	color: black;
    	border: 0px;
    	text-align: center;
    }
    
    .header_time {
    	width: 100px;
    	position: absolute;
    	background-color: #64c2eb;
    	color: grey;
    	border: 0px;
    	text-align: center;
    }
    
    
 </style>
</head>
 <body bgcolor="#f5f5f5">
     
 	<%@ include file="/WEB-INF/views/include/headerWithLoc.jsp"%>

	
		<div class="content" id="content" name="content">
	
			<div class="mainForm" method="get" enctype="multipart/form-data"> 
		    
		    	
				<div class="location">
		    		<!-- <button id="btnLoc" onclick="btnLoc_click()"></button>
		    		종로구 -->
		    	</div>
		    	
		    	<div class="weather">
		    	
		    		<div class="weather_btn"> 
		    			 <!-- <input type="button" class="font5" value="시간대별" id="weatherBtn"> -->
		    			<a href="<c:url value="/weather"/>" id="weatherBtn" class="font6">시간대별</a>
		    		</div>
		    		
		    		<div class="weather_icon">
		    			<img width="100" src="<c:url value="/image/weatherTest.png"/>">
		    		</div>
		    		
		    		<div class="weather_now">
		    			<table>
		    				<tr>
		    					<td class="font4">약한 비</td>
		    				</tr>	
		    				<tr>
		    					<td class="font2">6°</td>
		    				</tr>	
		    				<tr>
		    					<td class="font5">최고: 7° 최저: -3°</td>
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
			    						00님 <br>오늘 롱패딩과 어그부츠 어때요? :)
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
				    					<td class="font7">뫄뫄님</td>
				    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
				    					<td class="font7">15</td>
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
				    					<td class="font7">뫄뫄님</td>
				    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
				    					<td class="font7">15</td>
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
				    					<td class="font7">뫄뫄님</td>
				    					<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>
				    					<td class="font7">15</td>
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



<script>


	
		$(document).ready(function() {

			// GPS 위도/경도 요청 -> 기상청 x,y좌표로 변환 -> 서버에 전송
			//getLocation();
			
			
		});
		
		
		$('#weatherBtn').click(function() {
			
			//location.href="weather.jsp";
			
			//var form = document.createElememt('weatherByTimeForm');
			
			
			/* $.ajax({ 
				url : '/weather',
				type : 'get',
				processData  : false, 
				contentType : false,
				cache: false,
				success : function(){
					console.log('시간대별 날씨 뷰 이동 성공');
				}
			});  */

			
			
		});
		
		

</script>

 </body>
 </html> 