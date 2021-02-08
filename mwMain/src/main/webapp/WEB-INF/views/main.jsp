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

    .mainForm {
        max-width: 500px;
        height: 660px;
        padding-left: 20px;
        padding-right: 20px;
        text-align: center;
    }
    
    img {
    	border-radius: 15px;
    	/* box-shadow: 2px 2px 2px #ddd; */
    }
    
   	.font1 {
   		font-size: 1.5em;
   	}
   	
   	.font2 {
   		font-size: 1.3em;
   	}
   	
   	.font3 {
   		font-size: 1.2em;
   	}
   	
   	.font4 {
   		font-size: 1.1em;
   		font-weight: 900;
   	}
   	
   	.font5 {
   		font-size: 0.9em;
   		font-weight: bold;
   	}

	.font6 {
		font-size: 0.8em;
	}    
	
	.font7 {
		font-size: 0.7em;
	}   
	
	.font8 {
		font-size: 0.6em;
	} 
	
	.font_left {
		font-size: 0.9em;
		text-align: left;
	}

    /* 위치 */
    .location {
        width: 100%;
        height: 3%;
        text-align: center;
    }
 
    /* 날씨 */
    .weather {
        width: 100%;
        height: 30%;
        text-align: center;
    }
    
    .weather_btn {
        text-align: right;
    }
    
    #weatherBtn {
        background-color: #ffd74e;
        padding: 5px;
        border-radius: 10px;
        border: 0px;
        color: black;
    }
    
    .weather_icon {
    	width: 50%;
        padding-top: 20px;
        padding-left: 50px;
        padding-right: 10px;
        float: left;
    }
    
    .weather_now {
    	width: 50%;
        padding-top: 30px;
        padding-left: 20px;
        float: left;
    }
    
    .weather_now table {
    	border-collapse: separate;
    	border-spacing: 0 5px;	
    }
    
    /* 오늘의 코디 추천 */
    
    .todayCodi_ootd, .todayCodi_item div, .todayCodi_recomm, .todayCodi_recomm div, .todayCodi_recomm td, .todayCodi_recomm tr, 
    .todayCodi h5, .todayCodi_btn {
    	background-color: white;
    	/* border: 1px solid; */
    }
    
    h5 {
    	font-weight: 900;
    }

    
    .todayCodi {
        width: 100%;
        height: 33%;
        text-align: center;
        background-color: white;
        padding-top: 20px;
        padding-bottom: 20px;
    }
    
    .todayCodi_ootd {
        width: 40%;
        height: 140px;
        float: left;
        padding-left: 20px;
        padding-top: 10px;
        font-size: 0.9em;
        display: inline-block;
        font-size: 0.8em;
        /* border: 1px solid; */
    }

    .todayCodi_ootd_border {	
    	width: 95%;
    	height: 100%;
    	padding: 5px;
    	padding-left: 9px;
    	background-color: #f5f5f5;
    }
    
    .todayCodi_ootd_border table {
    	inline-height: center;
    }
    
    .todayCodi_ootd td, .todayCodi_ootd tr {
    	background-color: #f5f5f5;
    	color: black;
    }
    
    .todayCodi_ootd_border td {
    	padding-top: 5px;
    }
    
    .todayCodi_recomm {
    	width: 60%;
    	height: 140px;
    	float: left;
    	/* border: 1px solid;  */
    }
    
    .todayCodi_item {
        width: 100%;
        height: 80px;
        float: left;
        font-size: 0.9em;
        /* border: 1px solid; */
    }
    
    .todayCodi_item table, .todayCodi_item td {
    	width: 95%;
    	margin: auto;
    	padding: 5px;
    }
    
    .todayCodi_item_img {
    	width: 85%;
    	height: 45px;
    	padding-left: 10px;
    	float: left;
        /* border: 1px solid; */
        display: flex;
    }
    
    .todayCodi_item_img1 {
    	flex: 1;
    }
    
    .todayCodi_item_img2 {
    	flex: 1;
    }
    
    .todayCodi_item_img3 {
    	flex: 1;
    }    
    
    .todayCodi_btn {
    	width: 100%;
    	height: max;
        padding-top: 15px;
        clear: both;
        font-weight: 1.5em;
    }
    
    #btnToCloset {
        background-color: #64c2eb;
        width: 200px;
        border: 0px;
        border-radius: 5px;
        padding: 5px;
        color: white;
        font-weight: 1.5em;
        font-size: 0.8em;
    }
    
    /* 오늘의 OOTD */
    
   .todayPick_title, .todayPick h5{
    	background-color: #64c2eb;
    }
    
    .todayPick {
        width: 100%;
        height: 23%;
        margin-top: 30px;
        text-align: center;
        background-color: #64c2eb;
    }
    
    .todayPick_title {
    	padding-top: 3px;
    	color: white;
    }
    
    .top3_ootd {
    	width: 100%;
        padding-right: 10px;
        padding-left: 10px;
        background-color: #64c2eb;
    }
    
    .top3_ootd td {
    	background-color: white;
    }
    
    .todayPick table {
    	margin: auto;
    	vertical-align: center;
    }

    .top3_ootd1 {
   		background-color: #64c2eb;
     	float: left;
 		width: 33%;
    }

    .top3_ootd2 {
    	background-color: #64c2eb;
        float: left;
    	width: 33%;
    }
    
    .top3_ootd3 {
    	background-color: #64c2eb;
     	float: left;
    	width: 33%;
    }

    .top3_ootd_border {
    	margin: auto;
    	width: 90px;
    	height: 100px;
    	background-color: white;
    	border-radius: 15px;
    	padding: 3px;
    	padding-top: 8px;
    }
    
 
 </style>
</head>
 <body bgcolor="#f5f5f5">
     
 	<%@ include file="/WEB-INF/views/include/headerWithLoc.jsp"%>

	
		<div class="content" id="content" name="content">
	
			<div class="mainForm" method="get" enctype="multipart/form-data"> 
		    
		    	
				<div class="location">
		    		<button id="btnLoc" onclick="btnLoc_click()"></button>
		    		종로구
		    	</div>
		    	
		    	<div class="weather">
		    	
		    		<div class="weather_btn"> 
		    			<!-- <input type="button" class="font5" value="시간대별" id="weatherBtn"> -->
		    			<a href="<c:url value="/weather"/>" id="weatherBtn">시간대별</a>
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
			
			
			$.ajax({ 
				url : '/weather',
				type : 'get',
				processData  : false, 
				contentType : false,
				cache: false,
				success : function(){
					console.log('시간대별 날씨 뷰 이동 성공');
				}
			}); 

			
			
		});
		
		

</script>

 </body>
 </html> 