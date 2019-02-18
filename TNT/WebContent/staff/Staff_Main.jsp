<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script>
		function list1() {
			document.form1.action.value = "list";
			//console.log("asdfasdf");
			document.form1.submit();
		}

		function gradeList() {
			document.form1.action.value = "gradelist";
			document.form1.submit();
		}
	</script>
<meta charset="EUC-KR">
<title>Staff Main</title>

</head>
<body>
	<form name="form1" method="post" action="<%= request.getContextPath() %>/TNT/Tnt_Control.jsp">
		<input type="hidden" name="action" value="MyPage">
		<table>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="MY PAGE"> <input type="button" value="LIST"
					onclick="list1()"> <input type="button" value="GRADE"
					onclick="gradeList()">
			</tr>
		</table>
	</form>

	
</body>
</html>