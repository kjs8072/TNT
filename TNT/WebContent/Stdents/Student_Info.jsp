<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="TNT_DAO.*, TNT_Bean.*, java.util.ArrayList, java.sql.Date"%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="list"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보</title>
</head>
<body>
	<%-- <a href=".jsp"> 바로가기 링크할 떄 사용 
	</a>--%>
	<h2>학생 정보</h2>
	<%
		//언어 설정
		request.setCharacterEncoding("UTF-8");
		StudentBean student = new StudentBean();
		StudentDAO tnt = new StudentDAO();

		tnt.getStudents();
	%>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>전화</th>
			<th>주소</th>
			<th>최종학력</th>
			<th>학교</th>
			<th>전공</th>
		</tr>
		<%
			for (StudentBean st : (ArrayList<StudentBean>)list) {
		%>
		<tr>
			<td><%=st.getStudent_num()%></td>
			<td><%=st.getStudent_name()%></td>
			<td><%=st.getStudent_birth()%></td>
			<td><%=st.getStudent_gender()%></td>
			<td><%=st.getStudent_phone()%></td>
			<td><%=st.getStudent_address()%></td>
			<td><%=st.getStudent_complete_edu()%></td>
			<td><%=st.getStudent_univ_coll()%></td>
			<td><%=st.getStudent_major()%></td>
		</tr>
		<%
			}
		%>
	</table>


</body>
</html>