<%@page import="java.sql.*" %>
<%

   
    String bank = request.getParameter("bank");
  
    String amaun = request.getParameter("amaun");
    String tarikh = request.getParameter("tarikh");
    
    
    String idPengguna = (String) session.getAttribute("idPengguna");
    
    int idPenggunaInt = (int) session.getAttribute("idPenggunaInt");
    
    
    

    out.println(bank);
    out.println(amaun);
    out.println(tarikh);
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    Statement st = con.createStatement();

    int i = st.executeUpdate("insert into sumbangan values (null, " + idPenggunaInt + ", '" + bank + "', " + amaun + ", '" + tarikh + "');");
    
   
    if (i > 0) {
        response.sendRedirect("data_insert_success.html");
    } else {
        response.sendRedirect("data_insert_failed.html");

    }


%>


