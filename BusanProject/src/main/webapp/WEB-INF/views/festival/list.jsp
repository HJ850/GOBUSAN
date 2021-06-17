<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- header -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.navbar {
	list-style: none;
	float: left;
}
.home {
	width: 20px;
	height: 20px;
}
.homenav {
	width: 10px;
	height: 10px;
}
h1 {
	padding: 2em;
}
.box {
	list-style: none;
	float: left;
    border: 1px solid #e9e9e9;
    border-width: 1px 0px 1px 0px;
    padding: 0 2em;
}
.month {
	width: 142px;
	float: left;
    display: block;
    text-align: center;
    padding: 19px 0;
    font-weight: 600;
}
.list {
	list-style: none;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	gap: 10px;
}
</style>

<section class="ftco-section ftco-destination">
	<div style="background-image: url('/busan/resources/images/축제.jpg'); height: 320px;"></div>
	<div class="navbox">
        <div class="left">
           <ul class="navbar">
          	   <li><img class="home" alt="home" src="/busan/resources/images/home.jpg"/></li>
	           <li>home</li>
	           <li><img class="homenav" alt="homenav" src="/busan/resources/images/angle-right.jpg"/></li>
	           <li>축제</li>
           </ul>
        </div>
    </div>
	<h1 align="center">축제</h1>
	<div>
		<ul class="box">
	    	<li class="month"><a href="#">전체</a></li>
	    	<li class="month"><a href="#">1월</a></li>
	    	<li class="month"><a href="#">2월</a></li>
	    	<li class="month"><a href="#">3월</a></li>
	    	<li class="month"><a href="#">4월</a></li>
	    	<li class="month"><a href="#">5월</a></li>
	    	<li class="month"><a href="#">6월</a></li>
	    	<li class="month"><a href="#">7월</a></li>
	    	<li class="month"><a href="#">8월</a></li>
	    	<li class="month"><a href="#">9월</a></li>
	    	<li class="month"><a href="#">10월</a></li>
	    	<li class="month"><a href="#">11월</a></li>
	    	<li class="month"><a href="#">12월</a></li>
	    </ul>
    </div><br>
	<section class="ftco-section ftco-destination">
		<div class="item">
		  <ul class="list">
			<c:forEach items="${list}" var="list">
			<li style="width: 420px;">
				<div class="item">
    				<div class="destination">
    					<a href="view?num=${list.num}" class="img d-flex justify-content-center align-items-center" style="background-image: url(/busan/resources/upload/${list.fimg});">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<h3><a href="#">${list.title}</a></h3>
    						<span class="listing"><a href="view?num=${list.num}">자세히보기</a></span>
    					</div>
    				</div>
   				</div>
   			</li>
			</c:forEach>
	      </ul>
	    </div>
	    <div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${page.totalCount gt 0}">
				<%-- [이전] 출력 --%>
				<li class="page-item">
					<c:if test="${page.startPage gt page.pageBlock}">
						<a class="page-link" href="list?strPageNum=${page.startPage - page.pageBlock}&field=${field}&word=${word}">이전</a>
					</c:if>
				</li>

				<%-- 페이지 번호 --%>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
					<c:choose>
						<c:when test="${pageScope.i eq requestScope.pageNum}">
							<li class="page-item"><a class="page-link" href="list?strPageNum=${i}&field=${field}&word=${word}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="list?strPageNum=${i}&field=${field}&word=${word}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%-- [다음] 출력 --%>
				<li class="page-item">
					<c:if test="${ page.endPage lt page.pageCount}">
						<a class="page-link" href="list?strPageNum=${page.startPage + page.pageBlock}&field=${field}&word=${word}">다음</a>
					</c:if>
				</li>
			</c:if>
		</ul>
		<br>
		<div align="center">
			<form action="list" method="get">
				<select name="field">
					<option value="title">제목</option>
				</select>
				<input type="text" size="50" name="word">
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		</div>
	</div>
	</section>
</section>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>