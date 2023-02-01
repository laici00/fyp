<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

  
    String query = "SELECT * FROM `aktiviti`";
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
                color: white;
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
                background-color: black;

                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;

                margin-top: -280px; /* importanttt !!!  */

                z-index:-999;
            }

            #tab {
                background-color: black;
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
        </style>
        
        <script>
            function valid() {


                if (confirm("Adakah anda pasti?")) {
                } else {
                    confirm("Penambahan Peralatan Dibatalkan!");
                    return false;
                }
            }

        </script>
        

    </head>
    <body>
        <ul>
            <li><a href="aktiviti_kemaskini.jsp" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
            <li><a style="color: #ef3a25; " href="#" id="tab">Buang Aktiviti Sedia ada</a></li>
        </ul>
        <h4>Sistem Pengurusan Masjid</h4>
    <center>
        <h2>Buang Maklumat Aktiviti</h2>

        <form method="post" action="aktiviti_delete_berjaya.jsp">
            <table>

                <tr>
                    <td> <label>Masukkan ID Aktiviti: </label> </td>
                    <td> <select name="id" id="nama1">


                            <%                while (rs.next()) {%>

                            <option value="<%=rs.getString("idAktiviti")%>"><%=rs.getString("idAktiviti")%></option>

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
