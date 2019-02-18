<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- <script>
	function Login_check() {
		document.form
	}
</script> -->
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<body>
	<h2>Login Form</h2>
	<hr>
	<!-- <a href="">메인화면으로 돌아가기</a> -->
	<form method="post" action="Login_control.jsp">
		<input type="hidden" name="action" value="login">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="userid"></td>
			<tr>
				<th>PASSWORD</th>
				<td><input type="password" name="passwd"></td>
			<tr>
				<th>Login Type</th>
				<td><input type="radio" name="user" value="student_id" checked>
					학생<br> <input type="radio" name="user" value="staff_id">
					교직원<br></td>
			</tr>
			<tr>
				<td colspan="1" align="center"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>