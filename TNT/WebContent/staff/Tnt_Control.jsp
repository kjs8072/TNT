<%@page import="TNT_DAO.TestvuVO"%>
<%@page import="TNT_DAO.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="bean" class="TNT_DAO.TntBean" />
<jsp:useBean id="student" class="TNT_DAO.StudentVO" />
<jsp:useBean id="grade" class="TNT_DAO.GradeVO" />
<jsp:useBean id="vu" class="TNT_DAO.TestvuVO" />

<jsp:setProperty property="*" name="bean" />
<jsp:setProperty property="*" name="student"/>
<jsp:setProperty property="*" name="vu" />

<%
	request.setCharacterEncoding("UTF-8");

	//��(main)���� ���� parameter�� "action"���� action�� ����
	String action = request.getParameter("action");

	//action�� ���� "list���� Ȯ��"
	if (action.equals("list")) {

		//bean�� �ִ� getStudents�� �����ϰ� ���� ���� arrylist type���� studentVO�� ����
		ArrayList<StudentVO> list = bean.getStudents();

		//list�� ���� ���� "list"�� ����?
		request.setAttribute("list", list);

		//���� ������(list)�� ������ student_info.jsp�� ������
		pageContext.forward("Student_Info.jsp");

	}

	else if (action.equals("gradelist")) {
		ArrayList<TestvuVO> list = bean.getScore();
		request.setAttribute("list", list);
		pageContext.forward("ranking.jsp");
	}
%>