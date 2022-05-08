<%@ page import ="java.sql.*" %>
<%
    
	String userid = request.getParameter("admin_name");   
    String pwd = request.getParameter("admin_password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336FinalProjectBuyMe","root", "Kareena1101#");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin_staff_member where login_name='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("adminAccount.jsp");
    } else {
        out.println("Invalid password <a href='adminlogin.jsp'>try again</a>");
    }
%>