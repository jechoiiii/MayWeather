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

</head>
 <body>
     
 	<%@ include file="/WEB-INF/views/include/headerWithLoc.jsp"%>

	
		<div class="content" id="content" name="content">
	    	 
			<!-- 메인 wrap -->
			<div class="content_wrap">
				<!-- 메인 -->
				<div class="mainForm" id="mainForm"></div>
	    	 </div>
	    	 
	    </div>
	    	


 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>



<script>

	/* 회원 js에 있음 */
	var originJsessionId = '${cookie.JSESSIONID.value}';
	var jsessionId = '${sessionScope.jsessionId}';
	
	var memIdx = '${sessionScope.memIdx}';
	var memName = '${sessionScope.memName}';
	var memId = '${sessionScope.memId}'; 
	var memLoc = '${sessionScope.memLoc}';
	var memGender = '${sessionScope.memGender}';
	var memPhoto = '${sessionScope.memPhoto}';
	var memEmailchk = '${sessionScope.memEmailchk}';

        
</script>

 </body>
 


<script type="text/javascript" src="<c:url value="/js/location.js"/>" charset="UTF-8"></script> 
<script type="text/javascript" src="<c:url value="/js/guestbook.js"/>" charset="UTF-8"></script> 
 

 </html> 