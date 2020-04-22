<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#listBtn").click(function() {
			location.href = "/admin/carlist/carList";
		});

		$("#insertBtn").click(function() {
			location.href = "/admin/carlist/carListInsertForm";
		});
	});
</script>
<%@ include file="header.jsp"%>
</head>
<body>
	<c:if test="${msg == 'success'}">
		<h2>${sessionScope.AdminName}님 환영합니다.</h2>
	</c:if>
	<input type="button" value="차량 조회" id="listBtn">
	<input type="button" value="차량 등록" id="insertBtn">
</body>
</html>