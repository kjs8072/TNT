<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="TNT_Bean.*, TNT_DAO.*, java.util.*" %>
<jsp:useBean id="data" class="java.util.ArrayList" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="data"></jsp:setProperty>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<title>출결관리</title>
</head>
<body>
<table border="1">
		<tr>
			<th>출석번호</th>
			<th>학생번호</th>
			<th>날짜</th>
			<th>입실시간</th>
			<th>퇴실시간</th>
			<th>외출시간</th>
			<th>복귀시간</th>
			<th>출석구분</th>
		</tr>
		<%
			for(AttendBean ab : (ArrayList<AttendBean>) data) {
		%>
		<tr>
			<td><%=ab.getAttendance_num() %></td>
			<td><%=ab.getStudent_num() %></td>
			<td><%=ab.getAttendance_date() %></td>
			<td><%=ab.getEntering_time() %></td>
			<td><%=ab.getLeaving_time() %></td>
			<td><%=ab.getOutgo_time() %></td>
			<td><%=ab.getReturn_time() %></td>
			<td><%=ab.getAttendance_division() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>