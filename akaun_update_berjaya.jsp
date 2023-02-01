<%@page import="java.sql.*"%>
<%

    /**/
    String idPengguna = (String) session.getAttribute("idPengguna");
    String nama = request.getParameter("nama");
    String emel = request.getParameter("emel");
    String kataLaluan = request.getParameter("kataLaluan");

    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    Statement st = con.createStatement();

    int i = st.executeUpdate("UPDATE pengguna SET nama ='" + nama + "', emel = '" + emel + "', kataLaluan = '" + kataLaluan + "' WHERE idPengguna =" + idPengguna);

    response.sendRedirect("akaun_papar.jsp");

    
%>
