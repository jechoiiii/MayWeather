<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>방명록 리스트 </title>
 <%@ include file="/WEB-INF/views/include/basicset.jsp"%>
 <style>
 
	.table {
		/* border: 1px solid #DDD; */
		width: 100%;
	}
	
	td, th {
		border-bottom: 1px solid #DDD;
		text-align: center;
		padding: 10px 0;
	}
	
	.nowpage {
		font-size: 1.5em;
		font-weight: bold;
	}
	
	.paging {
		text-align: center;
	}
	
	div.searchBox {
		border: 1px solid #CCC;
		margin: 15px 0;
		padding: 10px 20px;
		background-color: #EEE;
	}
 
 </style>
 </head>
 <body>
 	<%@ include file="/WEB-INF/views/include/header.jsp"%>

 	<main class="container">
		<div
			class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded shadow-sm">
			<div class="lh-1">
				<h1 class="h2 mb-0 text-white lh-1">GUESTBOOK</h1>
			</div>
		</div>
 	
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h3 class="border-bottom pb-2 mb-0">방명록</h3>
			
			<div class="d-flex text-muted pt-3">
				<table class="table  table-striped table-hover">
					<tr>
						<th>방명록 번호</th>
						<th>방명록 주인 번호</th>
						<th>작성자 번호</th>
						<th>작성자 이름</th>
						<th>작성자 사진</th>
						<th>작성자 위치</th>
						<th>내용</th>
						<th>사진</th>
						<th>작성날짜</th>
						<th>수정날짜</th>
						<th>비밀글 여부</th>
					</tr>

					<c:forEach items="${list}" var="guestbook">
						<tr>
							<td>${guestbook.gbookNo}</td>
							<td>${guestbook.memberNo}</td>
							<td>${guestbook.writerNo}</td>
							<td>${guestbook.writerName}</td>
							<td>${guestbook.writerPhoto}</td>
							<td>${guestbook.writerLoc}</td>
							<td>${guestbook.content}</td>
							<td>${guestbook.contentPhoto}</td>
							<td>
								<fmt:formatDate value="${guestbook.regDate}" pattern="yyyy.MM.dd." />
							</td>
							<td>
								<fmt:formatDate value="${guestbook.updateDate}" pattern="yyyy.MM.dd." />
							</td>
							<td>${guestbook.secret}</td>	
						</tr>
					</c:forEach>

				</table>
		</div>

 		
 	</div>
</main>

 	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


 </body>
 </html> 