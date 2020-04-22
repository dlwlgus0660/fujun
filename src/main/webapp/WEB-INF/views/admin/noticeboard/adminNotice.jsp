<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<style type="text/css">
td{
text-align: center;
}
</style>

<script type="text/javascript" src="/resources/include/js/board.js"></script>

	<h2 class="sub-header">공지사항 관리</h2>
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="tac">공지 종류</th>
					<th class="tac">제목</th>
					<th class="tac">이미지</th>
					<th class="tac">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터출력 -->
				<c:choose>
					<c:when test="${not empty NoticeList }">
						<c:forEach var="Notice" items="${NoticeList}">
							<tr>
								<td>${Notice.nt_heading }</td>
								<td><a href="${path}/admin/noticeboard/adminNoticeDetail?nt_title=${Notice.nt_title}">${Notice.nt_title }</a></td>
								<td>${Notice.nt_image }</td>
								<td>${Notice.nt_regdate }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">공지가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="well">
			<form class="form-inline" id="f_search">
				<input type="hidden" name="page" id="page" /> <input type="hidden"
					name="pageSize" id="pageSize" />

			<!-- 검색 리스트 추가 해야됌 -->

			<!-- 옵션박스 / 검색 -->
			<div class="form-group">
				<select id="search" name="search" class="form-control">
					<option value="b_title">제목</option>
					<option value="b_name">내용</option>
				</select> <input type="text" name="keyword" id="keyword" placeholder="예약번호, 예약자명" />
				<button type="button" class="btn btn-primary" id="searchBtn">찾기</button>
			</div>
			</form>
		</div>
		<%-- <!-- 페이지 네비게이션 시작 -->
		<div id="boardPage">
		<tag:paging page="${param.page }" total="${total }" list_size="10"/>
		</div>
	</div> --%>
	</div>
