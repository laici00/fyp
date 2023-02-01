<%@page import="java.sql.*" %>
<%

    /**/
    String nama = request.getParameter("nama");
    String tarikh = request.getParameter("tarikh");

    int idPenggunaInt = (int) session.getAttribute("idPenggunaInt");
 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    Statement st = con.createStatement();

    int i = st.executeUpdate("insert into peralatan values(null, '" + idPenggunaInt + "','" + nama + "','" + tarikh + "', 'Pending')");
    out.println(nama + idPenggunaInt + tarikh);

   
    if (i > 0) {
        response.sendRedirect("data_insert_success.html");
    } else {
        response.sendRedirect("data_insert_failed.html");

    }
     

%>