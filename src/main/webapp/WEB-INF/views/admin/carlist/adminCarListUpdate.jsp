<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		//목록으로 버튼 클릭 시
		$("#listBtn").click(function() {
			location.href = "/admin/carlist/carList";
		})
		//수정완료 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("수정하시겠습니까?")) {
				$("#update").attr({
					"method" : "POST",
					"action" : "/admin/carlist/carListUpdate"
				})
				$("#update").submit();
			}

		})
	})
</script>
<div>
	<div>
		<h2 class="sub-header">차량 수정</h2>
	</div>
	<div class="table-responsive">
		<form id="update" name="update">
			<input type="hidden" id="car_model_number" name="car_model_number"
				value="${vo.car_model_number}">
			<table class="table table-bordered">
				<tr>
					<td>차량명</td>
					<td><input type="text" name="car_name" id="car_name"
						value="${vo.car_name}"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="car_price" id="car_price"
						value="${vo.car_price}"></td>
				</tr>
				<tr>
					<td>연료옵션</td>
					<td>${vo.car_fuel}<br>[수정]&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;
						<input type="radio" name="car_fuel" id="car_fuel" value="휘발유"
						checked>휘발유&nbsp;&nbsp;&nbsp; <input type="radio"
						name="car_fuel" id="car_fuel" value="전기">전기
					</td>
				</tr>
				<tr>
					<td>최대 승차 인원</td>
					<td>${vo.car_number_passengers}<br>[수정]&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;
						<select name="car_number_passengers" id="car_number_passengers">
							<option value="5인">5인</option>
							<option value="6인">6인</option>
							<option value="7인">7인</option>
							<option value="8인">8인</option>
							<option value="9인">9인</option>
							<option value="10인">10인</option>
							<option value="11인">11인</option>
							<option value="12인">12인</option>
					</select></td>
				</tr>
				<tr>
					<td>일반 보험</td>
					<td><input type="text" name="car_insurance" id="car_insurance"
						value="${vo.car_insurance}"></td>
				</tr>
				<tr>
					<td>고급 보험</td>
					<td><input type="text" name="car_adv_insurance"
						id="car_adv_insurance" value="${vo.car_adv_insurance}"></td>
				</tr>
				<tr>
					<td>차량 옵션</td>
					<td>${vo.car_option}<br>[수정]&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="car_option" id="car_option"
						value="네비게이션">네비게이션 <input type="checkbox"
						name="car_option" id="car_option" value="운전석 에어백">운전석 에어백
						<input type="checkbox" name="car_option" id="car_option"
						value="블랙박스">블랙 박스
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="car_image" id="car_image"
						value="${vo.car_image}"></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<input type="button" name="updateBtn" id="updateBtn"
			class="btn btn-primary" value="수정완료"> <input type="button"
			name="listBtn" id="listBtn" class="btn btn-primary" value="목록으로">
	</div>
</div>
