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
 <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="css/landing-page.min.css" rel="stylesheet">
<title>출결관리</title>
</head>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#" style="color:blue">TUTER & TUTEE</a>
      <a class="btn btn-primary" href="#">Sign In</a>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">Tuter & Tutee</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text" class="form-control form-control-lg" placeholder="Enter your email...">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary" href="TNT_control.jsp?action=attendance">Sign up!</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>
  <br>
<table border="1" align="center">
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