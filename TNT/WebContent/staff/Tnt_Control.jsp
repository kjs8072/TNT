<%@page import="TNT_DAO.TestvuVO"%>
<%@page import="TNT_DAO.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="bean" class="TNT_Bean.TntBean" />
<jsp:useBean id="student" class="TNT_DAO.StudentVO" />
<jsp:useBean id="grade" class="TNT_DAO.GradeVO" />
<jsp:useBean id="vu" class="TNT_DAO.TestvuVO" />

<jsp:setProperty property="*" name="bean" />
<jsp:setProperty property="*" name="student"/>
<jsp:setProperty property="*" name="vu" />

<%
	request.setCharacterEncoding("UTF-8");

	//앞(main)에서 받은 parameter인 "action"값을 action에 담음
	String action = request.getParameter("action");

	//action의 값이 "list인지 확인"
	if (action.equals("list")) {

		//bean에 있는 getStudents를 실행하고 나온 값을 arrylist type으로 studentVO에 넣음
		ArrayList<StudentVO> list = bean.getStudents();

		//list에 넣은 값을 "list"로 설정?
		request.setAttribute("list", list);

		//앞의 데이터(list)를 가지고 student_info.jsp로 가져감
		pageContext.forward("Student_Info.jsp");

	}

	else if (action.equals("gradelist")) {
		ArrayList<TestvuVO> list = bean.getScore();
		request.setAttribute("list", list);
		pageContext.forward("ranking.jsp");
	}
%>