<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>\
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="vo" items="${board_idx }">
<tr>
	<td>${vo.boardIdx }</td>
	<td><a href="/hyundo/board">${vo.title }</a></td>
	<td>${vo.contents }</td>
	<td>${vo.regDate }</td>
	<td>
		<i class="fa fa-file-o fa-2x" aria-hidden="true"></i>
		<i class="fa fa-trash fa-2x" data-num="${vo.boardIdx }" aria-hidden="true"></i>
	</td>
</tr>
</c:forEach>
