<%@page import="java.sql.*"%>
<%
    
    /**/
    String nama = request.getParameter("Naktiviti");
    String butiran = request.getParameter("Baktiviti");
    String tarikh = request.getParameter("Taktiviti");
    
    
    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");

    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    
    Statement st = con.createStatement();

    try {
   
        int i = st.executeUpdate("insert into aktiviti values (null, '" + nama + "', '" + butiran + "', '" + tarikh + "')");
        
        response.sendRedirect("data_insert_success.html");

    } catch (Exception e) {
        response.sendRedirect("data_insert_failed.html");
    }


%>
