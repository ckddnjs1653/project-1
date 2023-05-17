<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="./css/header.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">
<link href="./css/sideMenu.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">

</head>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
	<!-- header -->

	<!-- sideMenu -->
	<jsp:include page="../inc/sideMenuMember.jsp" />
	<!-- sideMenu -->

	<!-- main -->
	<main>
	<br><br>

		<h1>찜한 매장</h1>
		<!-- 로그인 세션 제어 -->
		<c:if test="${empty user_id }">
			<c:redirect url="./MemberLogin.foo" />
		</c:if>


		<c:forEach var="dto" items="${likeList}">
			<table border="1">
				<tr>
					<td colspan="2">
					<a href="./restaurantForm.fd?rest_id=${dto.rest_id}">${dto.name }</a></td>
				</tr>
				<tr>
					<td colspan="2">${dto.rest_tel }</td>
				</tr>
				<tr>
					<td colspan="2">${dto.descriptions }</td>
				</tr>
			</table>
			<br>
			<br>
		</c:forEach>
		
		
		
<!-- 페이징처리 -->
<%
int count = (int)request.getAttribute("count");
int pageSize = (int)request.getAttribute("pageSize");
int currentPage = (int)request.getAttribute("currentPage");
String pageNum = (String)request.getAttribute("pageNum");

System.out.println(count);
System.out.println(pageSize);
System.out.println(currentPage);

if(count != 0) {
	int pageBlock = 5;
	int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
	int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	
	if(startPage > pageBlock) {
%>

				<a href="./MemberLike.foo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	
<%
	}
	for(int i = startPage; i <= endPage; i++) {
%>


				<a href="./MemberLike.foo?pageNum=<%=i%>">[<%=i%>]</a>
				
				
<%
	}
	if(endPage < pageCount) {
%>


				<a href="./MemberLike.foo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				
				
<%
	}
}
%>
		
		
	</main>

<!-- footer -->
	<jsp:include page="../inc/footerDiv.jsp" />
<!-- footer -->

</body>
</html>