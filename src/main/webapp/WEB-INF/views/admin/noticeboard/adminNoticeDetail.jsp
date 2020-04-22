<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		//목록으로 버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/noticeboard/notice";
		})
		//저장버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("저장하시겠습니까?")) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/memreservation/adminMemReservationUpdate"
				})
				$("#detail").submit();
			}
		})
	})
</script>
<div class="contetnContainer">
	<h2 class="sub-header">공지사항 상세 조회</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="inq_number" name="inq_number"
				value="${vo.nt_title}" />
			<table class="table table-bordered">
				<tr>
					<td>공지종류</td>
					<td>${vo.nt_heading}</td>
					<td>작성자</td>
					<td>관리자</td>
					<td>작성일</td>
					<td>${vo.nt_regdate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="5">${vo.nt_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="5">${vo.nt_content}</td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="cancelBtn"class="btn btn-primary">
			<input type="button" value="수정(삭제)" id="updateBtn" class="btn btn-primary">
		</div>
	</div>
</div>

