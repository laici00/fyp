<%@page import="java.sql.*"%>

<%
    if ((session.getAttribute("idPengguna") == null) || (session.getAttribute("idPengguna") == "")) {
        response.sendRedirect("index.html");
    }
    
%>
<%
    Connection con;
    
    String idPengguna = (String) session.getAttribute("idPengguna");
    
    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    String query = "SELECT * FROM `pengguna` WHERE  idPengguna = " + idPengguna;
    Statement st = con.createStatement();
    rs = st.executeQuery(query);
    
    if (rs.next()) {
    
    

%>

<html>
    <head>

        <title>Laman Web Pengurusan Masjid</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script>
            function valid() {
                if (confirm("Adakah Anda Pasti?")) {

                } else {
                    return false;
                }
            }

        </script>
        <style>


            h1 {
                font-family: 'Roboto', sans-serif;
                margin-left: 70px;
                font-size: 100px;
                display: flex;

                color: white;
                text-shadow: 3px 2px black;
            }

            #date {
                color: white;
                text-shadow: 3px 2px black;
            }

            h3 {
                font-family: 'Roboto', sans-serif;
                margin-left: 80px;
                font-size: 55px;
                display:flex;
                margin-top: 0px;

            }

            h2 {
                margin-top: -40px;
            }

            h4 {
                position : absolute;
                left : 580px;
                top : -36px;
                font-family: 'Roboto', sans-serif;
                font-size : 40px;
                color: black;
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

            #daftar {

                border-radius : 30px;

                color: black;
                float: right;
                margin : 10px 23px 0px 0px;
                position: absolute;
                right : 0px;

                font-family: 'Roboto', sans-serif;
                font-size : 20px;
                text-decoration: none;

                padding: 14px 16px;

                transition: border 0.2s, background-color 0.2s, color 0.2s;


            }

            #daftar:hover {

                border-radius : 30px;
                padding: 14px 16px;

                background-color: black;
                color: white;


            }


            #nama {

                border-radius : 30px;

                color: white;
                float: right;
                margin : 10px 200px 0px 0px;
                position: absolute;
                right : 50px;



                font-family: 'Roboto', sans-serif;
                font-size : 20px;
                text-decoration: none;

                padding: 14px 16px;

                transition: border 0.2s, background-color 0.2s, color 0.2s;

            }

            #nama:hover {

                border-radius : 30px;
                padding: 14px 16px;

                background-color: white;
                color: black;


            }

            #idPengguna {

                border-radius : 30px;

                color: white;
                float: right;
                margin : 10px 200px 0px 0px;
                position: absolute;
                right : 0px;

                font-family: 'Roboto', sans-serif;
                font-size : 20px;
                text-decoration: none;

                padding: 14px 16px;

                transition: border 0.2s, background-color 0.2s, color 0.2s;

            }

            #idPengguna:hover {

                border-radius : 30px;
                padding: 14px 16px;

                background-color: white;
                color: black;
            }

            i {
                transition: color 0.2s;
                text-transform: capitalize;
            }

            i:hover {
                color: #406aff;

            }

            #title {
                background-color: white;
                color: black;
            }

            #txt {
                color: white;
                margin-left: 85px;
                margin-top: -60px;
                
                text-shadow: 3px 3px black;
            }

            #date, #txt{
                color: #c6e5ff;
            }
            
           

        </style>

    </head>
    <body>

        <%  //String namaPengguna = (String) session.getAttribute("name");
        
            String namaPengguna = rs.getString("nama");

            if (namaPengguna == null) {
                namaPengguna = "";
            }

            if (idPengguna == null) {
                idPengguna = "";
            }

        %>  

        <a id="daftar" href="logout.html" onclick="return valid();">Log Keluar</a>
        <a id="daftar" href="akaun_papar.jsp" style="right: 140px;">Semak Akaun</a>

        <ul>
            <li><a id="title" title="Kembali ke Laman Utama!" >Laman Utama</a></li>
            <li><a style="background-color: white; color: black; " title="Nama Anda"><i> <%=namaPengguna%> </i></a></li>
        </ul>



        <h4 >Sistem Pengurusan Masjid</h4>
        <h5>PENGGUNA</h5>

        <h1 style="margin:100px 0px -5px 80px;">Bismillah,</h1>
        <h1 style="margin:0px 0px -5px 80px;"> Selamat Datang!</h1>

        <h3 id="date"></h3>
        <script>
            n = new Date();
            y = n.getFullYear();
            m = n.getMonth() + 1;
            d = n.getDate();
            document.getElementById("date").innerHTML = "Tarikh : " + d + "/" + m + "/" + y;
        </script>

    <body onload="startTime()">

        <h3 id="txt"></h3>

        <script>
            function startTime() {
                const today = new Date();
                let h = today.getHours();
                let m = today.getMinutes();
                let s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('txt').innerHTML = "Masa : " + h + ":" + m + ":" + s;
                setTimeout(startTime, 1000);
            }

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                // add zero in front of numbers < 10
                return i;
            }
        </script>

    </body>

    <a id="aktiviti" href="aktiviti_papar_login.jsp">Papar Aktiviti Terkini</a>
    <a id="peralatan" href="peralatan_papar.jsp">Pinjaman Peralatan Masjid</a>
    <a id="sumbangan" href="sumbangan_tambah.html">Buat Sumbangan atas Talian</a>
    <a id="aduan" href="aduan_tambah.html">Buat Aduan</a>

</body>
</html>

<%
    }
%>
