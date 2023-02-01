<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("nama");
    String pass = request.getParameter("kataLaluan");

    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    String query = "SELECT * FROM `admin` WHERE nama = '" + name + "' AND kataLaluan   = '" + pass + "'";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);
    if (rs.next()) {
        response.sendRedirect("index_admin.html");
        
    } else {
    
    response.sendRedirect("login_admin_failed.html");
    }

%>