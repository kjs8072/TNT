<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student_main</title>
<script>
	function mypage(){
		document.form1.action.value="mypage";
		document.form1.submit();
	}   

</script>
<h2>student_main</h2>
</head>
<body>
	<form name="form1" method="post" action="TNT_control.jsp">
		<input type="hidden" name="action" value="attendance">
		<input type="submit" value="출결정보">
		<input type="button" value="Mypage" onclick="mypage()"></td></tr>
	</form>
</body>
</html>
