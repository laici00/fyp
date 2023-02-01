<%@page import="java.sql.*"%>
<%
    
    String id = request.getParameter("idPeralatan");
    
   
    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
   
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    
    
    Statement st = con.createStatement();

    try {
        
        int i = st.executeUpdate("DELETE FROM peralatan WHERE idPeralatan = " + id);
        

        response.sendRedirect("peralatan_papar_admin.jsp");

    } catch (Exception e) {
        response.sendRedirect("data_insert_failed.html");
    }


%>
