<%@page import="java.sql.*" %>
<%
    /* */
    String nama = request.getParameter("nama");
    String butiran = request.getParameter("butiran");
    String tarikh = request.getParameter("tarikh");
    
    String idPengguna = (String) session.getAttribute("idPengguna");
    
    int idPenggunaInt = (int) session.getAttribute("idPenggunaInt");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    Statement st = con.createStatement();

    int i = st.executeUpdate("insert into aduan values (null, " + idPenggunaInt + ", '" + nama + "', '" + butiran + "', '" + tarikh + "');");

    //int i = st.executeUpdate("insert into aduan values(null, '" + nama + "','" + butiran + "','" + tarikh + "','" + idPengguna + "')"); 
    //int i = st.executeUpdate("insert into test values('test','test')"); 
    if (i > 0) {
        response.sendRedirect("data_insert_success.html");
    } else {
        response.sendRedirect("data_insert_failed.html");

    }
%>


