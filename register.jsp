<%@page import="java.sql.*" %>
<%
    String email = request.getParameter("emel");
    String name = request.getParameter("nama");
    String pass = request.getParameter("kataLaluan");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    Statement st = con.createStatement();

    int i = st.executeUpdate("insert into pengguna values(null, '" + email + "','" + name + "','" + pass + "')");
    
    if (i > 0) {
        //out.println("Data Inserted Successfully");
        response.sendRedirect("register_berjaya.html");
        
    } else {
        out.println("Data Failed");
                   
    }
%>


