<%@page import="java.sql.*"%>
<%
    String status = request.getParameter("status");

    String idPeralatan = request.getParameter("idPeralatan");
    
    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    Statement st = con.createStatement();

    try {

        
        int i = st.executeUpdate("UPDATE peralatan SET status ='" + status + "'WHERE idPeralatan =" + idPeralatan);
        
        
        response.sendRedirect("peralatan_papar_admin.jsp");

    } catch (Exception e) {
        response.sendRedirect("data_insert_failed.html");
    }


%>

%>


<%=status%>
<%=idPeralatan%>