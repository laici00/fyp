<%@page import="java.sql.*"%>
<%
    
    String idAktiviti = request.getParameter("idAktiviti");
    
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    Statement st = con.createStatement();

    try {
     
        int i = st.executeUpdate("DELETE FROM aktiviti WHERE idAktiviti = " + idAktiviti);
        response.sendRedirect("aktiviti_kemaskini.jsp");

    } catch (Exception e) {
        response.sendRedirect("data_insert_failed.html");
    }


%>
