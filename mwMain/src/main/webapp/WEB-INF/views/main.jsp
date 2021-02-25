<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	session.setAttribute("memidx", "40");
	session.setAttribute("memnic", "메이웨더");
	session.setAttribute("memphoto", "mw.jpg");
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
 <body>
     
 	<%@ include file="/WEB-INF/views/include/headerWithLoc.jsp"%>

	
		<div class="content" id="content" name="content">
	
				<!-- 메인 wrap -->
				<div class="content_wrap">
					
					<!-- 메인 -->
					<div class="mainForm" id="mainForm"></div>
					
					<!-- 방명록 버튼 -->
					<div class="moveToGb" id="moveToGb" style="display: none;"></div>
					
					<!-- 방명록 리스트 -->
		    		<div class="gblistForm" id="gblistForm" style="display: none;"></div>
	
					<!-- 방명록 등록 (모달 창) -->
			    	<form id="gbregForm">	
			    		<div class="regModal_wrapper" style="display: none;">
			    			<div class="regModal">
			    			
			    				<div class="regModal_header">
		                             <div class="regModal_back">
		                                 <button type="button" class="reg_modal_close_btn" onclick="closeRegModal()" ><img width="20" src="<c:url value="/image/back.png"/>"></button>
		                             </div>
		                             <div class="regModal_title">방명록 남기기</div>
		                         </div>
			    					
			    				<div class="regModal_body"></div>
			    				
			    				<div class="regModal_footer">
		                           <button type="button" id="reg_submit_btn" onclick="regGuestbook()">보내기</button>
		                       </div>
		                       
			    			</div>
			    		</div>
			    	</form>  
			    	
			    	<!-- 방명록 수정 (모달 창) -->
			    	<form id="gbUpdateForm">	
			    		<div class="updateModal_wrapper" style="display: none;">
			    			<div class="updateModal">
			    			
			    				<div class="regModal_header">
		                             <div class="regModal_back">
		                                 <button type="button" class="reg_modal_close_btn" onclick="closeUpdateModal()"><img width="20" src="<c:url value="/image/back.png"/>"></button>
		                             </div>
		                             <div class="regModal_title">방명록 수정하기</div>
		                         </div>
			    					
			    				<div class="updateModal_body"></div>
			    				
			    				<div class="regModal_footer">
		                           <button type="button" id="reg_submit_btn" onclick="updateGuestbook()">수정하기</button>
		                       </div>
		                       
			    			</div>
			    		</div>
			    	</form>  
			    	
			    	<!-- 방명록 삭제 (모달 창) -->
			    	<form id="gbDeleteForm">	
			    		<div class="deleteModal_wrapper" style="display: none;">
			    			<div class="deleteModal">
			    			
			    				<div class="regModal_header">
		                             <div class="regModal_back">
		                                 <button type="button" class="reg_modal_close_btn" onclick="closeDeleteModal()"><img width="20" src="<c:url value="/image/back.png"/>"></button>
		                             </div>
		                             <div class="regModal_title">방명록 삭제하기</div>
		                         </div>
			    					
			    				<div class="deleteModal_body"></div>
			    				
			    				<div class="regModal_footer">
		                           <button type="button" id="reg_submit_btn" onclick="deleteGuestbook()">삭제하기</button>
		                       </div>
		                       
			    			</div>
			    		</div>
			    	</form> 
					
				</div>
			

	    	 
	    </div>
	    	


 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>



<script>


		window.onload = function() {
			
			setMainPage();
	        
			
			clock();
			// gbList에서만 무한 스크롤이 작동하도록 만드는 변수
			
		}
		
		var gbListScroll = false;

		$(document).ready(function() {

			// 무한스크롤 
			$(document).scroll(function() {
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
				
				//console.log(gbListScroll);
				if(maxHeight <= currentScroll && gbListScroll) {
					setTimeout(function() {
						pageView(pageNum);
					}, 200)
				}
				
			})
			
		
		})
		
		
		var myHostUrl = 'http://localhost:8080/main';
		var uploadFileUrl = '/fileupload/guestbook/';
		
		/* 나중에멤버 현재 로그인된 idx 받을 것! 현재 헤더안에 저장한 test용 값으로 하고 있음*/
		<%-- var ownIdx = '<%=(String)session.getAttribute("ownidx")%>'; --%>
		var gbOwnerIdx = 0;
		
		var memIdx = '<%=(String)session.getAttribute("memidx")%>';
		var memNic = '<%=(String)session.getAttribute("memnic")%>';
		var memPhoto = '<%=(String)session.getAttribute("memphoto")%>';
		var memLoc = '<%=(String)session.getAttribute("memloc")%>';
		
		var file;				// 방명록 첨부 사진 
		var page = 1;			// 방명록 페이지
		var gbNo = 0;			// 방명록 번호
		
		var ownerChk = false;	// 로그인한 계정 != 방명록주인 
		var writerChk = false;	// 로그인한 계정 != 작성자
		
		// gbList에서만 무한스크롤이 작동하도록 만드는 변수
		var gblistScroll = false;	

		
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
		
		var wbt_fcstTime;		// 예보시간
		var wbt_tmp;			// 3시간 기온
		var wbt_rain;			// 3시간 강수확률
		var wbt_sky;			// 하늘상태 
	
		
		
		/* 메인 ---------------------------------------------------------------------------------------------------------------------  */
		
		// 메인 페이지 구성  
		function setMainPage() {
			
			hideGbookList();
			hideMoveToGb();
			showMainForm();
			
			
			var mainhtml = 	  '<div class="header_time"></div><input type="button" class="font6" value="방명록" id="gblist_btn" onclick="getMoveToGb()">'
							+ '<div class="weather">'
							+ 		'<div class="weatherBT_btn"><input type="button" class="font6" value="시간대별" id="weatherBt_btn" onclick="getWeatherBT()"></div>'
							+ 		'<div class="weather_icon">'
							+ 			'<img width="100" src="<c:url value="/image/weatherTest.png"/>">'
							+ 		'</div>'
							+ 		'<div class="weather_now">'
							+ 			'<table>'
							+ 				'<tr><td colspan="2" class="font4" id="sky_now">약한 비</td></tr>	'
							+ 				'<tr><td colspan="2" class="font0" id="tmp_now">0°</td></tr>	'
							+ 				'<tr><td colspan="2" class="font4" id="rain_now">0%</td></tr>'
							+ 				'<tr><td class="font5" id="tmp_max">0° /</td><td class="font5" id="tmp_min"> -0°</td></tr>'
							+			'</table>'
							+ 		'</div>'
							+ '</div>'
							
							+ '<div class="todayCodi">'
							+ 		'<div class="todayCodi_ootd">'
							+ 			'<div class="todayCodi_ootd_border">'
							+ 				'<table>'
							+ 					'<tr><td><img height="90" src="<c:url value="/image/ootdTest.jpg"/>"></td></tr>'
							+ 					'<tr><td class="font5">뫄뫄님의 LOOK</td></tr>'
							+ 				'</table>'
							+ 			'</div>'
							+ 		'</div>'
							+ 		'<div class="todayCodi_recomm">'
							+ 			'<div class="todayCodi_item">'
							+ 				'<table>'
							+ 					'<tr><td class="font4"> -- 오늘의 코디 추천 -- </td></tr>'
							+ 					'<tr><td class="font_left">00님 <br>오늘 000과 0000 어때요? :)</td></tr>'
							+ 				'</table>'
							+ 			'</div>'
							+ 			'<div class="todayCodi_item_img">'
							+ 				'<div class="todayCodi_item_img1"><img width="45" src="<c:url value="/image/codiRecTest.png"/>"></div>'
							+ 				'<div class="todayCodi_item_img2"><img width="45" src="<c:url value="/image/codiRecTest.png"/>"></div>'
							+ 				'<div class="todayCodi_item_img3"><img width="45" src="<c:url value="/image/codiRecTest.png"/>"></div>'
							+ 			'</div>'
							+ 		'</div>'
							+ 		'<div class="todayCodi_btn"><input type="button" value="코디할래요 >" id="btnToCloset"></div>'
							+ '</div>'
							
							+ '<div class="todayPick">'
							+ 		'<div class="todayPick_title"><h5>Todays PICK</h5></div>'
							+ 		'<div class="top3_ootd">'
							+ 			'<div class="top3_ootd1">'
							+ 				'<div class="top3_ootd_border">'
							+ 					'<table>'
							+ 						'<tr><td colspan="3"><img width="70" src="<c:url value="/image/ootdTest.jpg"/>"></td></tr>'
							+ 						'<tr>'
							+							'<td class="font7">00님</td>'
							+ 							'<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>'
							+ 							'<td class="font7">00</td>'
							+ 						'</tr>'
							+ 					'</table>'
							+ 				'</div>'
							+ 			'</div>'
							+ 			'<div class="top3_ootd2">'
							+ 				'<div class="top3_ootd_border">'
							+ 					'<table>'
							+ 						'<tr><td colspan="3"><img width="70" src="<c:url value="/image/ootdTest.jpg"/>"></td></tr>'
							+ 						'<tr>'
							+							'<td class="font7">00님</td>'
							+ 							'<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>'
							+ 							'<td class="font7">00</td>'
							+ 						'</tr>'
							+ 					'</table>'
							+ 				'</div>'
							+ 			'</div>'
							+ 			'<div class="top3_ootd3">'
							+				'<div class="top3_ootd_border">'
							+ 					'<table>'
							+ 						'<tr><td colspan="3"><img width="70" src="<c:url value="/image/ootdTest.jpg"/>"></td></tr>'
							+ 						'<tr>'
							+							'<td class="font7">00님</td>'
							+ 							'<td><img width="10" src="<c:url value="/image/icon/heart.png"/>"></td>'
							+ 							'<td class="font7">00</td>'
							+ 						'</tr>'
							+ 					'</table>'
							+ 				'</div>'
							+ 			'</div>'
							+ 		'</div>'
							+ '</div>';
							
		    $('#mainForm').html(mainhtml);
		    
		 	// GPS 위도/경도 요청 -> 기상청 x,y좌표로 변환 -> 서버에 전송
			getLocation();
			
			
			
		}
		
		
		
		/* 실시간 날짜 시계 구하기 */
        var clockTarget = $('.header_time');
        
        function getTime() {
			var date = new Date(); 
		    var month = date.getMonth() + 1;
		    var clockDate = date.getDate();
		    var day = date.getDay();
		    var week = ['일', '월', '화', '수', '목', '금', '토'];
		    var hours = date.getHours();
		    var minutes = date.getMinutes();
		    
		    hours = hours < 10 ? '0' + hours : hours;
		    minutes = minutes < 10 ? '0' + minutes : minutes;
		    
				// 월은 0부터 1월이기때문에 +1일을 해주고 
			    // 시간 분은 10보다 작으면 앞에0을 붙혀주기 
		    clockhtml = month +'월\n'+clockDate+'일\n'+week[day]+'요일\n'+ hours + ':' + minutes;
		    
		    clockTarget.html(clockhtml);
        }
        
        
       	function clock() {
       		setInterval(getTime, 3 * 1000);
       	}
        

		
		
		/* 시간대별 날씨  ------------------------------------------------------------------------------------------------------------------------------------ */
		
		function getWeatherBT() {
			
			var wbtHtml = '<form id="weatherByTimeForm" method="GET" enctype="multipart/form-data">'
				+ 	'<div class="weatherBT_title"><span class="font5">시간대별 일기 예보</span></div>'
				+ 	'<div class="weatherBT_content">';
				+		'<div class="weatherBT_tableWrap">'
				
			for(var i=0; i<wbt_data.length; i++){
				var wbt_category = wbt_data[i].category;
				var wbt_fcstValue = wbt_data[i].fcstValue;
				var wbt_fcstDate = wbt_data[i].fcstDate;
				wbt_fcstTime = wbt_data[i].fcstTime;
				
				// 3시간 기온
				if(wbt_category=='T3H') {
					wbt_tmp = wbt_fcstValue;
				}
				
				// 3시간 강수확률
				if(wbt_category=='POP') {
					wbt_rain = wbt_fcstValue;
				}
				
				// 하늘상태 --------> 이미지 변환 처리 필요 * 
				if(wbt_category='SKY') {
					wbt_sky = wbt_fcstValue;
				}
				
				wbtHtml += 		'<div class="weatherBT_table">' // 테이블 삽입 반복 
							+ 			'<table>'
							+ 				'<tr style="height:20px;"><td id="weatherTable_time" class="font7">'+wbt_fcstTime+'시</td></tr>'
							+ 				'<tr style="height:40px;"><td id="weatherTable_img"><img width="30" src="<c:url value="/image/weatherTest.png"/>"></td></tr>'
							+				'<tr style="height:100px;"><td id="weatherTable_tmp" class="font5">'+wbt_tmp+'°</td></tr>'
							+ 				'<tr style="height:40px;"><td id="weatherTable_rain" class="font7">'+wbt_rain+'%</td></tr>'
							+ 				'<tr style="height:10px;"><td id="weatherTable_rain_percent"><input type="button"></td></tr>'
							+ 			'</table>'
							+ 		'</div>';
			}			
						
				wbtHtml += 		'</div>'
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
						
			$('#mainForm').html(wbtHtml);

		}

		
		
		
		
		/* 방명록 -------------------------------------------------------------------------------------------------------------------------------------------  */
		
		// 무한 스크롤 
		


        /* 방명록 등록 모달 ----------------------------------------------- */
		
		/* 등록 모달 창 만들기 */
        function setRegModal() {
            
        	var reghtml = '<table class="regModal_table"><input type="hidden" id="gbOwnerNo" name="gbOwnerNo" value="'+gbOwnerIdx+'">'
						+	'<tr class="gbGreetArea" height="100">'
						+		'<td class="gbTableExp" colspan="2"><span class="font3">잘 보셨나요?</span><br><span class="font5">'+gbOwnerIdx+'님에게 인사를 남겨보세요:)</span></td>'
						+		'<td class="gbTableImg"><img width="65" src="http://localhost:8080/main/image/guestbook.png"></td>'
						+	'</tr>'
						+	'<tr class="gbInsertArea1" height="90">'
						+		'<td class="gbInsertPhoto"><label for="gbContentPhoto"><img width="30" src="http://localhost:8080/main/image/camera.png"></label>'
						+			'<input type="file" id="gbContentPhoto" name="gbContentPhoto" accept="image/jpeg,image/png,image/gif" style="display:none;" onchange="chkImage(this)"></td>'
						+		'<td id="gbPreview" class="gbPreview" colspan="2">'
						+			'<div class="deletePreviewImg">'
						+			'</div>'
						+		'</td>'
						+	'</tr>'
						+	'<tr class="gbInsertArea2" height="210">'
						+		'<td class="gbInsertText" colspan="3">'
						+			'<textarea id="gbContent" name="gbContent" cols="204" wrap="hard" placeholder="'+gbOwnerIdx+'님의 스타일은 어떤가요? &#13;&#10;하고 싶은 말을 여기에 적어보세요."></textarea></td>'
						+	'</tr>'
						+	'<tr class="gbSecretArea" height="50">'
						+		'<td colspan="3">비밀글 <input type="checkbox" id="gbcheck" name="gbcheck"></td>'
						+ 	'</tr>'
						+ '</table>';
            
            
    		 $('.regModal_body').html(reghtml);

        }
		

		
		var maxFileSize = 1024 * 1024 * 2;	// 파일 용량 제한: 2MB
		
		/* 파일 용량 체크 */ 
		function chkImage(el) {
			
			console.log(el);
			
			// files로 해당 파일 정보 얻기 
			var imgfile = el.files;
			
			if(imgfile[0].size > maxFileSize) {
				// 용량 초과시 
				alert('2MB 이하의 파일만 등록할 수 있습니다.\n현재파일 용량 : '+ (Math.round(file[0].size / 1024 / 1024*100) / 100)+ 'MB');
				
			} else {
				console.log('용량 이하입니다.');
				readImage(event);
			}
		}
		
		
		/* 첨부 파일 미리보기 */ 
		function readImage(event){
			
			console.log(event);
			
			var gbPreview = document.querySelector('#gbPreview');
			
			// FileReader 객체 생성
			var reader = new FileReader();
			
			// 이미지가 로드가 된 경우
			reader.onload = function(event) {
				var img = document.createElement('img');
				img.setAttribute('src', event.target.result);
				img.setAttribute('width', 60);
				gbPreview.appendChild(img);
			};
			
			console.log(gbPreview);
			
			// reader 가 이미지 읽도록 하기 
			reader.readAsDataURL(event.target.files[0]);
			
		} 
        
		
		

        /* 등록 모달 창 열기 */
        function openRegModal() {
        	setRegModal();
        	$('.regModal_wrapper').css('display', '');
        }
        
        /* 등록 모달 창 닫기 */ 
        function closeRegModal() {
        	$('.regModal_wrapper').css('display', 'none');
        }

		
        /* 방명록 등록 */
        function regGuestbook() {
        	
        	// 로그인 체크 추가 **

        	var form = $('#gbregForm')[0];
        	var formData = new FormData(form);
       
        	
        	for (var key of formData.keys()) {
				console.log(key);
				}
			for (var value of formData.values()) {
			  	console.log(value);
			}
			
			var content = $('#gbContent');
			var secret_check;		// 비밀글 체크여부
        	
        	// 내용은 필수로 받기
         	if(!content.val()) {
        		alert('내용을 입력해주세요');
        		
        	} else {    		
            	$('input:checkbox[name="gbcheck"]').each(function(){
            		if($(this).is(":checked") == true) {
            			secret_check = 'Y';
            			console.log('비밀글');
            		} else  {
            			secret_check = 'N';
            			console.log('공개글');
            		}
            	})
            	
           	// gbSecret를 FormData에 추가 
           	formData.append('gbSecret', secret_check);
            	
            	
           	$.ajax({
           		type: 'POST',
              		enctype : 'multipart/form-data',
   	            processData : false,
   	            contentType : false,
   	            cache : false,
   	            timeout : 600000,
               	url: myHostUrl + '/guestbook/reg',
               	data: formData,
   	           	success: function (data) {
   	           		
   	           		console.log('등록 데이터 ajax 전송 성공');
   	           		console.log(data);
   	           		
   	           		// 리스트 출력  
   	           		getGbookList();
   	           		// 모달창 닫기
   	           		closeRegModal();
   	           	
   	            },
   	            error: function (e) {
   	                alert('등록 데이터 ajax 에러' + e);
   	            }
          		})
        		
        		
        	}
        	
        }
		
        
        
 


        
        
        
 		/* 방명록 수정 모달 ----------------------------------------------- */
		
		/* 수정 모달 창 만들기 */
        function setUpdateModal(gbNo) {
 			
        	console.log(gbNo);
 			
        	// 수정할 게시물 정보 가져와서 수정 폼에 넣기
        	$.ajax({
        		type: 'GET',
	            cache : false,
	            timeout : 600000,
            	url: myHostUrl + '/guestbook/update/' + gbNo + '/form',
	           	success: function (gbInfo) {
	           		
	           		console.log('수정할 게시판 데이터 ajax로 받기 성공');
	           		console.log(gbInfo);
	           		
	           		var uformhtml = '<table class="regModal_table"><input type="hidden" id="gbOwnerNo" name="gbOwnerNo" value="'+gbOwnerIdx+'"><input type="hidden" id="gbNo" name="gbNo" value="'+gbNo+'">'
								+		'<tr class="gbGreetArea" height="100">'
								+			'<td class="gbTableExp" colspan="2"><span class="font3">잘 보셨나요?</span><br><span class="font5">'+gbOwnerIdx+'님에게 인사를 남겨보세요 :)</span></td>'
								+			'<td class="gbTableImg"><img width="65" src="http://localhost:8080/main/image/guestbook.png"></td>'
								+		'</tr>'
								+		'<tr class="gbInsertArea1" height="90">'
								+			'<td class="gbInsertPhoto"><label for="gbContentPhoto"><img width="30" src="http://localhost:8080/main/image/camera.png"></label>'
								+				'<input type="file" id="gbContentPhoto" name="gbContentPhoto" accept="image/jpeg,image/png,image/gif" style="display:none;" onchange="chkImage(this)"></td>'
								+			'<td id="gbPreview" class="gbPreview" colspan="2">'
								+				'<div class="deletePreviewImg">';
					
								if(gbInfo.contentPhoto != null) {
									uformhtml +=				'<img height="60" id="gbBeforePhoto" src="' + myHostUrl + uploadFileUrl + gbInfo.contentPhoto +'">';
									uformhtml +=				'<img width="8" id="deletePreview_btn" width="30" src="http://localhost:8080/main/image/icon/x.png" onclick="deletePreview()">';
								}			
								
					uformhtml +=				'</div>'
								+			'</td>'
								+		'</tr>'
								+		'<tr class="gbInsertArea2" height="210">'
								+			'<td class="gbInsertText" colspan="3">'
								+				'<textarea id="gbContent" name="gbContent" cols="204" wrap="hard">'+ gbInfo.content.replace(/(?:\r\n|\r|\n)/g,'<br/>') +'</textarea></td>'
								+		'</tr>'
								+		'<tr class="gbSecretArea" height="50">';
								
								if(gbInfo.secret == 'Y') {
									uformhtml += '<td colspan="3">비밀글 <input type="checkbox" id="gbcheck" name="gbcheck" checked="'+ gbInfo.secret +'" ></td>';
								} else {
									uformhtml += '<td colspan="3">비밀글 <input type="checkbox" id="gbcheck" name="gbcheck"></td>';
								}
	
					uformhtml +=		'</tr>'
								+ 	'</table>';
        			
					$('.updateModal_body').html(uformhtml);
	           		
	            },
	            error: function (e) {
	                alert('수정 데이터 ajax 에러' + e);
	            }
       		})
            
        }
 		
 		
 		
        var gbNo = 0;	// 게시글 번호 
        
        /* 수정 모달 창 열기 */
        function openUpdateModal(num) {
        	
        	gbNo = num;
        	
        	setUpdateModal(gbNo);
        	$('.updateModal_wrapper').css('display', '');
        }
        
        /* 수정 모달 창 닫기 */ 
        function closeUpdateModal() {
        	$('.updateModal_wrapper').css('display', 'none');
        }
      
        
        
		
		/* 파일 용량 체크 */ 
		function chkImage(el) {
			
			console.log(el);
			
			var maxFileSize = 1024 * 1024 * 2;	// 파일 용량 제한: 2MB
			
			// files로 해당 파일 정보 얻기 
			var imgfile = el.files;
			
			if(imgfile[0].size > maxFileSize) {
				// 용량 초과시 
				alert('2MB 이하의 파일만 등록할 수 있습니다.\n현재파일 용량 : '+ (Math.round(file[0].size / 1024 / 1024*100) / 100)+ 'MB');
				
			} else {
				console.log('용량 이하입니다.');
				changeImage(event);
			}
		}
		
        
     	/* 파일 변경 시, 미리보기 파일 변경 */ 
		function changeImage(event){
			
			console.log(event);
			
			var deletePreviewImg = document.querySelector('.deletePreviewImg');
			
     		// 이전 이미지 삭제
     		$('.deletePreviewImg').empty();
     		
			// FileReader 객체 생성
			var reader = new FileReader();
			
			// 이미지가 로드가 된 경우
			reader.onload = function(event) {			
				
				previewhtml = '<img width="60" height="auto" id="gbBeforePhoto" src="' + event.target.result +'">'
							+ '<img width="10" id="deletePreview_btn" width="30" src="http://localhost:8080/main/image/icon/x.png" onclick="deletePreview()">';
				
				$('.deletePreviewImg').html(previewhtml);
		
			};
			
			console.log(deletePreviewImg);
			
			// reader 가 이미지 읽도록 하기 
			reader.readAsDataURL(event.target.files[0]);
		} 
        
     	
     	/* 미리보기 삭제 버튼 클릭 시 -> 미리보기 삭제 */
		function deletePreview() {
			$('.deletePreviewImg').empty();
		}
     	
     	
        /* 방명록 수정 */
        function updateGuestbook() {
        	
        	console.log(gbNo);
        	
        	// .deletePreviewImg가 비어있으면 file input도 지우기
        	if(!$('#gbBeforePhoto').length) {
    			$('.gbInsertPhoto input[type=file]').remove();
        		console.log('저장할 파일 없음');
        	} 
        	
        	var form = $('#gbUpdateForm')[0];
        	var formData = new FormData(form);
        	
        	var secret_check;		// 비밀글 체크여부
        	    		
        	$('input:checkbox[name="gbcheck"]').each(function(){
        		if($(this).is(":checked") == true) {
        			secret_check = 'Y';
        		} else  {
        			secret_check = 'N';
        		}
        	})
        	
        	// gbSecret를 FormData에 추가 
        	formData.append('gbSecret', secret_check);
        	
			for (var key of formData.keys()) {
				  console.log(key);
				}
			for (var value of formData.values()) {
			  console.log(value);
			}
			
        	
        	$.ajax({
        		type: 'POST',
           		enctype : 'multipart/form-data',
	            processData : false,
	            contentType : false,
	            cache : false,
	            timeout : 600000,
            	url: myHostUrl + '/guestbook/update/' + gbNo,
            	data: formData,
	           	success: function (data) {
	           		
	           		console.log('수정 데이터 ajax 전송 성공');
	           		console.log(data);
	           		
	           		// 리스트 출력  
	           		getGbookList();
	           		// 모달창 닫기
	           		closeUpdateModal();
	           	
	            },
	            error: function (e) {
	                alert('수정 데이터 ajax 에러' + e);
	            }
       		})
        	
        	
        }

        
        
 		/* 방명록 삭제 모달 ----------------------------------------------- */
		
		/* 삭제 모달 창 만들기 */
        function setDeleteModal(gbNo) {
            
			console.log(gbNo);
			
        	var reghtml = '<table class="regModal_table"><input type="hidden" id="gbOwnerNo" name="gbOwnerNo" value="'+gbOwnerIdx+'">'
        				+ 	'<input type="hidden" id="gbNo" name="gbNo" value="'+gbNo+'">'
						+	'<tr class="greetArea" height="100">'
						+		'<td class="gbDelChk"><span class="font3">정말 삭제하시겠어요?</span></td>'
						+	'</tr>'
						+ '</table>';
            
            $('.deleteModal_body').html(reghtml);
        }

     	/* 삭제 모달 창 열기 */
        function openDeleteModal(num) {
        	
        	gbNo = num;
        	
        	setDeleteModal(gbNo);
        	$('.deleteModal_wrapper').css('display', '');
        }
        
        /* 수정 모달 창 닫기  */
        function closeDeleteModal() {
        	$('.deleteModal_wrapper').css('display', 'none');
        }
        
        /* 방명록 삭제 */
       	function deleteGuestbook() {
       		
        	console.log(gbNo);
        	
        	$.ajax({
        		type: 'POST',
	            processData : false,
	            contentType : false,
	            cache : false,
	            timeout : 600000,
            	url: myHostUrl + '/guestbook/delete/' + gbNo,
	           	success: function () {
	           		
	           		console.log('삭제 데이터 ajax 전송 성공');
	           		console.log(gbNo);
	           		
	           		// 리스트 출력  
	           		getGbookList();
	           		// 모달창 닫기
	           		closeDeleteModal();
	           	
	            },
	            error: function (e) {
	                alert('삭제 데이터 ajax 에러' + e);
	            }
       		})
       	}
        
        
        
        
		/* 메인 폼 */
		function showMainForm() {
			$('#mainForm').css('display', '');
		}
		
		function hideMainForm() {
			$('#mainForm').css('display', 'none');
		}
		
		/* moveToGb */
		function showMoveToGb() {
			$('#moveToGb').css('display', '');
		}
		
		function hideMoveToGb() {
			$('#moveToGb').css('display', 'none');
		}
		
		/* 게스트북 리스트 */
		function showGbookList() {
			$('#gblistForm').css('display','');
		}
		
		function hideGbookList() {
			$('#gblistForm').css('display','none');
		}
        
        
        
</script>

 </body>
 


<script type="text/javascript" src="<c:url value="/js/location.js"/>" charset="UTF-8"></script> 
<script type="text/javascript" src="<c:url value="/js/guestbook.js"/>" charset="UTF-8"></script> 
 

 </html> 