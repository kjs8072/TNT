<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="TNT_DAO.*, TNT_Bean.*" %>

<jsp:useBean id="adao" class="TNT_DAO.AttendDAO"></jsp:useBean>
<jsp:useBean id="abean" class="TNT_Bean.AttendBean"></jsp:useBean>
<jsp:setProperty property="*" name="abean"></jsp:setProperty>
<jsp:setProperty property="*" name="adao"></jsp:setProperty>

<jsp:useBean id="sdao" class="TNT_DAO.StudentDAO"></jsp:useBean>
<jsp:useBean id="sbean" class="TNT_Bean.StudentBean"></jsp:useBean>
<jsp:setProperty property="*" name="sbean"></jsp:setProperty>
<jsp:setProperty property="*" name="sdao"></jsp:setProperty>


<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");

	if(action.equals("attendance")){
		ArrayList<AttendBean> list = adao.getAttendList(1);
		request.setAttribute("data", list);		//요청 페이지에 값을 setting. list에 있는 값을 "data"에 넣어서 addrbook_list.jsp에 값을 넘김
		pageContext.forward("TNT_attend_list.jsp");		//리스트를 보여주는 페이지(TNT_attend_list.jsp)로 이동 ( data값을 넘겨줌.)
		//out.println("attendance");
	} else if(action.equals("mypage")){
		ArrayList<StudentBean> list = sdao.getInfoList();
		request.setAttribute("stu", list);		//요청 페이지에 값을 setting. list에 있는 값을 "data"에 넣어서 TNT_mypage.jsp에 값을 넘김
		pageContext.forward("TNT_mypage.jsp");
	}
%>