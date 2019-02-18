<%@page import="TNT_Bean.TestvuBean"%>
<%@page import="TNT_Bean.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="bean" class="TNT_DAO.StudentDAO" />
<jsp:useBean id="student" class="TNT_Bean.StudentBean" />
<jsp:useBean id="grade" class="TNT_Bean.GradeBean" />
<jsp:useBean id="vu" class="TNT_Bean.TestvuBean" />

<jsp:setProperty property="*" name="bean" />
<jsp:setProperty property="*" name="student" />
<jsp:setProperty property="*" name="vu" />

<%
	request.setCharacterEncoding("UTF-8");

	//앞(main)에서 받은 parameter인 "action"값을 action에 담음
	String action = request.getParameter("action");

	//action의 값이 "list인지 확인"
	if (action.equals("list")) {

		//bean에 있는 getStudents를 실행하고 나온 값을 arrylist type으로 studentVO에 넣음
		ArrayList<StudentBean> list = bean.getStudents();

		//list에 넣은 값을 "list"로 설정?
		request.setAttribute("list", list);

		//앞의 데이터(list)를 가지고 student_info.jsp로 가져감
		pageContext.forward("Student_Info.jsp");

	}

	else if (action.equals("gradelist")) {
		ArrayList<TestvuBean> list = bean.getScore();
		request.setAttribute("list", list);
		pageContext.forward("ranking.jsp");
	}
%>