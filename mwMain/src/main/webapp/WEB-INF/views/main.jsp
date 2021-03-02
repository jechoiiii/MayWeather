<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	session.setAttribute("memidx", "50");
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
		                                 <button type="button" class="reg_modal_close_btn" onclick="closeRegModal()" ><img width="20" src="/image/main/back.png"></button>
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
		                                 <button type="button" class="reg_modal_close_btn" onclick="closeUpdateModal()"><img width="20" src="/image/main/back.png"></button>
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
		                                 <button type="button" class="reg_modal_close_btn" onclick="closeDeleteModal()"><img width="20" src="/image/main/back.png"></button>
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



        
</script>

 </body>
 


<script type="text/javascript" src="<c:url value="/js/location.js"/>" charset="UTF-8"></script> 
<script type="text/javascript" src="<c:url value="/js/guestbook.js"/>" charset="UTF-8"></script> 
 

 </html> 