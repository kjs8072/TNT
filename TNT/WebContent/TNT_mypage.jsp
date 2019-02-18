<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="TNT_Bean.*, java.util.*" %>
<jsp:useBean id="stu" class="java.util.ArrayList" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="stu"></jsp:setProperty>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결관리</title>
</head>
<body>
<table border="1">
		<tr>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>연락처</th>
			<th>주소</th>
			<th>학교</th>
			<th>학과</th>
		</tr>
		<%
			for(StudentBean ab : (ArrayList<StudentBean>) stu) {
		%>
		<tr>
			<td><%=ab.getStudent_name() %></td>
			<td><%=ab.getStudent_birth() %></td>
			<td><%=ab.getStudent_gender() %></td>
			<td><%=ab.getStudent_phone() %></td>
			<td><%=ab.getStudent_address() %></td>
			<td><%=ab.getStudent_univ_coll() %></td>
			<td><%=ab.getStudent_major() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>