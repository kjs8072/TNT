<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script>
   function stud_check() {
      document.form1.action.value="check1";
      document.form1.submit();
   }

</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body align="center">
<form name="form1" method="get" action="student_control.jsp">
<input type="hidden" name="action" value="insert">
<table border="2">
<h1>회원가입 </h1> 
<tr><th>아이디</th><td><input type="text" name="student_id">
<input type="button" value="중복확인" onclick="stud_check()"></td></tr>
<tr><th>비밀번호</th><td colspan="2"><input type="password" name="student_pw"></td></tr>
<tr><th>비밀번호확인</th><td colapan="2"><input type="password" name="student_pw"></td></tr>
<tr><th>이름</th><td colspan="2"><input type="text" name="student_name"></td></tr>
<tr><th>성별</th><td colspan="2">
<input type="radio" name="gender" value="남자" >남자 <input type="radio"name="gender" value="여자">여자</td></tr>
<tr><th>핸드폰번호</th><td colspan="2"><input type="text" name="student_phone"></td></tr>
<tr><th>주소</th><td colspan="2"><input type="text" name="student_adress"></td></tr>
<tr><th>학교</th><td colspan="2"><input type="text" name="student_univ_coll"></td></tr>
<tr><th>학과</th><td colspan="2"><input type="text" name="student_major"></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="저장"><input type="reset" value="취소">
</table>
</form>
</body>
</html>