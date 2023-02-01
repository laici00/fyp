<%@page import="java.sql.*"%>
<%

    String name = request.getParameter("name");
    String id = (String) session.getAttribute("idPengguna");
    
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    //String query = "SELECT * FROM `sterling_order` WHERE OrderID = '" + name + "'";
    String query = "SELECT * FROM `aduan` where idPengguna = " + id;
    Statement st = con.createStatement();
    rs = st.executeQuery(query);
%>

<html>
    <head>
        <title>Laman Web Pengurusan Masjid</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <style>
            h4 {
                position : absolute;
                left : 580px;
                top : -36px;
                font-family: 'Roboto', sans-serif;
                font-size : 40px;
            }

            h2 {
                margin-top: 100px;
                font-family: 'Roboto', sans-serif;
                font-size: 40px;
                color: white;
            }

            label {
                font-family: 'Roboto', sans-serif;
                font-size: 30px;
                color: white;
            }

            input[type=Submit], input[type=reset] {
                border-radius: 30px;
                text-align : center;
                font-size: 25px;
                font-family: 'Roboto', sans-serif;

                cursor: pointer;
                background-color: white;
                padding: 10px 20px;
                transition : color 0.2s, background-color 0.2s;
            }

            .rectangle {
                position: absolute;
                border-radius: 20px;
                height: 320px;
                width: 600px;
                background-color: #1260cc;

                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;

                margin-top: -280px; /* importanttt !!!  */

                z-index:-999;
            }

            #tab:hover {
                background-color: white;
                color: black;
            }

            #nama1 {
                width: 100px;

                border-radius: 30px;

                text-align : center;
                font-size: 30px;
                font-family: 'Roboto', sans-serif;
            }

            #nama2 {

                height: 100px;

                border-radius: 30px;

                text-align : center;
                font-size: 30px;
                font-family: 'Roboto', sans-serif;
            }
            
            h5 {
                position : absolute;
                right : 490px;
                top : -12px;
                font-family: 'Roboto', sans-serif;
                font-size : 20px;
                color: #406aff;
                
                text-shadow: 1px 1px black;


            }
        </style>

        <script>
            function valid() {
                if (document.getElementById("nama1").value === "") {
                    alert("Tiada Aduan dihantar, Sila buat aduan terlebih dahulu!");
                    return false;
                }
                return valid1();

            }

            function valid1() {

                if (confirm("Adakah anda pasti?")) {

                } else {
                    confirm("Penghapusan Peralatan Dibatalkan!");
                    return false;
                }
            }

        </script>


    </head>
    <body>
        <ul>
            <li><a href="javascript:history.back()" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
            <li><a id="tab">Buang Aduan Sedia Ada</a></li>
        </ul>
        <h4>Sistem Pengurusan Masjid</h4>
        <h5>PENGGUNA</h5>
    <center>
        <h2>Buang Maklumat Aduan</h2>

        <form method="post" action="aduan_delete_berjaya.jsp">
            <table>



                <tr>
                    <td> <label>Masukkan ID Aduan </label> </td>
                    <td> <select name="id" id="nama1">

                            <%                while (rs.next()) {%>

                            <option value="<%=rs.getString("idAduan")%>"><%=rs.getString("idAduan")%></option>

                            <%  }%>

                        </select> </td>
                </tr>
                <tr>
                    <td> <br> </td>
                </tr>
            </table>
            <br>
            <input type="Submit" value="Hantar" onclick="return valid();">
            <input type="reset" value="Set Semula">
        </form>
        <div class="rectangle"></div>
        <br>
    </center>

</body>
</html>
