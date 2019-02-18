<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="TNT_Bean.*, TNT_DAO.*, java.util.ArrayList, java.sql.Date"%>

<jsp:useBean id="list" class="java.util.ArrayList" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="list"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 순위</title>
</head>
<body>
	<%-- <a href=".jsp"> 바로가기 링크할 떄 사용 
	</a>--%>
	<h2>학생 정보</h2>
	<%
		//언어 설정
		request.setCharacterEncoding("UTF-8");
		TestvuBean testvu = new TestvuBean();
		StudentDAO tnt = new StudentDAO();

		tnt.getStudents();
	%>

	<table border="1">
		<tr>
			<th>이름</th>
			<th>과정명</th>
			<th>교과목명</th>
			<th>점수</th>
			<th>시험일</th>
			<th>시험구분</th>
			<th>시험결과</th>
		</tr>
		<%
			for (TestvuBean tu : (ArrayList<TestvuBean>) list) {
		%>
		<tr>

			<td><%=tu.getStudent_name()%></td>
			<td><%=tu.getCourse_name()%></td>
			<td><%=tu.getSubject_name()%></td>
			<td><%=tu.getScore()%></td>
			<td><%=tu.getTest_date()%></td>
			<td><%=tu.getTest_division()%></td>
			<td><%=tu.getTest_result()%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>