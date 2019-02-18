<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList, TNT_Bean.*, TNT_DAO.*"%>
<%@ page import="java.util.ArrayList, TNT_Bean.*"%>

<jsp:useBean id="bean" class="TNT_Bean.AttendBean"></jsp:useBean>
<jsp:useBean id="TNT" class="TNT_DAO.StudentDAO"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />
<jsp:setProperty property="*" name="TNT" />

<%
   request.setCharacterEncoding("UTF-8");
   String action = request.getParameter("action");

   if (action.equals("insert")) {
      //   bean.insertDB(TNT);
      response.sendRedirect("membership_messageform.jsp");

   }
   /* else if
   
   (action.equals("main")) {
   //   bean.insertDB(TNT);
         response.sendRedirect("메인화면 공백.jsp");
          */
   /* } */
   else if (action.equals("login")) {
      //   bean.insertDB(TNT);
      response.sendRedirect("login_control.jsp");

   }
   
   else if (action.equals("check2")) {
         if (bean.funcstaff_check(TNT.getStaff_id())==0){
            out.println("<script>alert('ok');history.back();</script>");   
            
         }   else
            out.println("<script>alert('no');history.back();</script>");
   }   
%>