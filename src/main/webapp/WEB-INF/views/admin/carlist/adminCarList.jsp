<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="contentContainer">
	<div class="contentTit">
		<h2 class="sub-header">차량 조회</h2>
	</div>
	<!-----------------------리스트 시작---------------------------------->
	<div id="adminCarList" class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th id="car_model_number">모델 고유번호</th>
				<th id="car_name">차량명</th>
				<th id="car_image">이미지</th>
				<th id="car_option">차량 옵션</th>
				<th id="car_price">차량 가격</th>
				<th id="car_registe_date">등록일</th>
			</tr>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="${path}/admin/carlist/carListDetail?car_model_number=${row.car_model_number}">${row.car_model_number}</a></td>
							<td>${row.car_name}</td>
							<td>${row.car_image}</td>
							<td>${row.car_option}</td>
							<td>${row.car_price}</td>
							<td>${row.car_registe_date}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" class="tac">등록된 차량이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="well">
			<input type="hidden" name="page" id="page" /> <input type="hidden"
				name="pageSize" id="pageSize" />

			<div class="form-group">
				<input type="text" name="keyword" id="keyword" placeholder="차량명" />
				<input type="button" class="btn btn-primary" id="searchBtn"
					value="검색">
			</div>
		</div>
	</div>
</div>

