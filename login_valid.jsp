<%@page import="java.sql.*"%>f
<%
    try {

        Connection con;
        String name = request.getParameter("nama");
        String pass = request.getParameter("kataLaluan");

        session.setAttribute("name", name);

        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

        String query = "SELECT * FROM `pengguna` WHERE nama = '" + name + "' AND kataLaluan = '" + pass + "'";
        Statement st = con.createStatement();
        rs = st.executeQuery(query);
        if (rs.next()) {

            response.sendRedirect("index_login_jsp.jsp");

        } else {

            response.sendRedirect("login_failed.html");
        }

        String idPengguna = rs.getString("idPengguna");
        int idPenggunaInt = rs.getInt("idPengguna");

        session.setAttribute("idPengguna", idPengguna);
        session.setAttribute("idPenggunaInt", idPenggunaInt);

    } catch (Exception e) {

    }

%>

