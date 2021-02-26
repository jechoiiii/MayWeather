<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <header>

	    <img src="<c:url value="/image/logo/mwlogo.png"/>" width="119px" class="logoimage">

		<div class="header_loc" id="header_loc">
    		<button id="btnLocc" onclick="btnLoc_click()" class="font2">서울</button>
    	</div>
    	<!-- TEST -->
    	<input type="button" class="font6" value="방명록" id="gblist_btn" onclick="getMoveToGb()">
    	
    	

   </header>