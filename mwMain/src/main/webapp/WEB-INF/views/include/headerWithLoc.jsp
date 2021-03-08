<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <header>

	    <img src="<c:url value="/image/logo/mwlogo.png"/>" width="119px" class="logoimage" onclick="setMainPage()">

		<div class="header_loc" id="header_loc">
			<img height="20" src="https://maymayweather.ml/main/image/icon/location.png">
    		<button id="btnLocc" class="font4">서울</button>
    	</div>
    	<!-- 위치 설정 모달 -->
    	<div class="locationModal_wrapper" style="display: none;"></div>
    	
    	<!-- TEST -->
    	<input type="button" class="font6" value="방명록" id="gblist_btn" onclick="getMoveToGb()">
    	
    	

   </header>