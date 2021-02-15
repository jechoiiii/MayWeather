<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>방명록 리스트 TEST </title>
 <link rel="styleSheet" href="<c:url value="/css/default.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/main.css"/>">
 <link rel="styleSheet" href="<c:url value="/css/guestbook.css"/>">
 <%@ include file="/WEB-INF/views/include/basicset.jsp"%>
 <style>
 
 </style>
 </head>
 <body bgcolor="#f5f5f5">
 	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="content" id="content" name="content">
       
    	<div class="listForm" id="listForm">
    		
    		
    		<div class="listTitle">
    			<button type="button" onclick="backBtn" class="gb_back"><img width="15" src="<c:url value="/image/back.png"/>"></button>
    			00님의 GuestBook
    			<button type="button" onclick="modalOpen" class="gbwrite_modal"><img width="30" src="<c:url value="/image/icon/write.png"/>"></button>
    		</div>
    		
    		<div class="list">
    			<table class="listTable">
    			
    				<tr class="gblist_width">
    					<td rowspan="2" class="gblist_memImgR">
    						<img width="30" class="gblist_memImg" src="<c:url value="/image/blue.jpg"/>">
    					</td>
						<td class="gblist_info">닉네임</td>
						<td rowspan="3" class="gblist_uploadPhoto">
							<img height="60" src="<c:url value="/image/ootdTest.jpg"/>">
						</td>
    				</tr>
    				<tr class="gblist_info">
						<td class="font7">서울 종로구 · 2021.01.01</td>
    				</tr>
    				<tr class="gblist_con">
						<td colspan="2" class="gblist_content">잘 보고 갑니다~</td>
    				</tr>
   
   					<c:forEach items="${list}" var="guestbook">

	     				<tr class="gblist_width">
	    					<td rowspan="2" class="gblist_memImgR">
	    						<img width="30" class="gblist_memImg" src="<c:url value="/image/blue.jpg"/>">
	    					</td>
							<td class="gblist_info">${guestbook.writerName}</td>
							<td rowspan="3" class="gblist_uploadPhoto">
								<img height="60" src="<c:url value="/image/ootdTest.jpg"/>">
							</td>
	    				</tr>
	    				<tr class="gblist_info">
							<td class="font7">${guestbook.writerLoc} · <fmt:formatDate value="${guestbook.regDate}" pattern="yyyy.MM.dd." /></td>
	    				</tr>
	    				<tr class="gblist_con">
							<td colspan="2" class="gblist_content">${guestbook.content}</td>
	    				</tr>  					
   					
   					</c:forEach>
    			
    			</table>
    		</div>
    	
 
    	</div>

	</div>
	
	
 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


 </body>
 </html> 