<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		//목록으로 버튼 클릭 시
		$("#carListBtn").click(function() {
			location.href = "/admin/carlist/carList";
		})
		//수정하기 버튼 클릭 시
		$("#updateBtn").click(function() {
			$("#detail").attr({
				"method" : "POST",
				"action" : "/admin/carlist/carListUpdateForm"
			})
			$("#detail").submit();

		})

		//삭제하기 버튼 클릭 시
		$("#deleteBtn").click(function() {
			confirm("삭제하시겠습니까?");
			$("#detail").attr({
				"method" : "POST",
				"action" : "/admin/carlist/carLsitDelete"
			})
			$("#detail").submit();
		})
	});
</script>
<div class="contetnContainer">
	<h2 class="sub-header">차량 상세 정보 조회</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="car_model_number" name="car_model_number"
				value="${vo.car_model_number}" />
		</form>
		<table class="table table-bordered">
			<tr>
				<td>모델 고유번호</td>
				<td>${vo.car_model_number}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${vo.car_registe_date}</td>

			</tr>
			<tr>
				<td>차량명</td>
				<td>${vo.car_name}</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>${vo.car_price}</td>
			</tr>
			<tr>
				<td>스틱옵션</td>
				<td>${vo.car_stick}</td>
			</tr>
			<tr>
				<td>연료옵션</td>
				<td>${vo.car_fuel}</td>
			</tr>
			<tr>
				<td>최대 승차 인원</td>
				<td>${vo.car_number_passengers}</td>
			</tr>
			<tr>
				<td>일반 보험</td>
				<td>${vo.car_insurance}</td>
			</tr>
			<tr>
				<td>고급 보험</td>
				<td>${vo.car_adv_insurance}</td>
			</tr>
			<tr>
				<td>차량 옵션</td>
				<td>${vo.car_option}</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>${vo.car_image}</td>
			</tr>
		</table>
		<div>
			<input type="button" value="목록으로" id="carListBtn"
				class="btn btn-primary"> <input type="button" value="수정하기"
				id="updateBtn" class="btn btn-primary"> <input type="button"
				value="삭제하기" id="deleteBtn" class="btn btn-primary">
		</div>

	</div>
</div>
