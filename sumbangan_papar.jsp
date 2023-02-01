<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    int idPenggunaInt = (int) session.getAttribute("idPenggunaInt");

    String query = "SELECT * FROM `sumbangan` where idPengguna=" + idPenggunaInt + "";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);


%>

<head>
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>

        * {
            font-size: 20px;
            text-align: center;
        }

        h1 {
            font-family: 'Roboto', sans-serif;
            margin-left: 595px;
            font-size: 50px;
            display: flex;

            color: white;
            text-shadow: 3px 3px black;
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


        table {



            background-color: white;
            margin-top: 110px;
            padding: 5px;
            border-radius: 20px;

            width: 70%; /*lebar*/

            height: 10%;
            border: 5px solid #000;

            font-family: 'Roboto', sans-serif;

            margin-left: 250px;
        }

        #tarikh {
            width: 100px;

        }

        #akt {

            width: 100px;

        }

        #idd {
            width: 100px;
        }

        td {
            background-color: gray;
            padding: 10px;
            border-radius: 20px;
            margin: 5px;
        }



        th {
            color: white;
            background-color: #1260cc;
            padding: 10px;
            border-radius: 20px;
        }

        .material-symbols-outlined {

            font-size:25px;
            font-variation-settings:
                'FILL' 0,
                'wght' 700,
                'GRAD' 0,
                'opsz' 48


        }

        #tab:hover {
            color: black;
            background-color: white;

        }

        #tarikh {
            font-size: 20px;
        }

        h4 {
            position : absolute;
            left : 580px;
            top : -36px;
            font-family: 'Roboto', sans-serif;
            font-size : 40px;

        }

        #button {
            margin-top: 20px;
            margin-left: 10px;

            color: black;
            background-color: white;
        }

        #button:hover {
            border: 1px solid black;
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

        #kedua {
            height: 70px;
        }

    </style>
</head>

<body> 

    <ul>
        <li><a href="sumbangan_tambah.html" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Buat Sumbangan atas Talian</a></li>
    </ul>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>PENGGUNA</h5>


<center>

    <h1>Senarai Sumbangan</h1>
    <form action="sumbangan_tambah.html">
        <h2><button id="button" type="submit"><span class="material-symbols-outlined">
add
</span>
                Buat Sumbangan Baharu</button></h2>

    </form>

    <table>

        <tr id="bd">
            <th id="idd"> <b>ID Sumbangan</b></th>
            
            <th> <b>No Akaun Bank</b></th>
            <th> <b>Amaun(RM)</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
                <%   while (rs.next()) {%>

        </tr>

        <tr id="kedua">
        <td><%=rs.getString("idSumbangan")%></td>
        
        <td><%=rs.getString("maklumatBank")%></td>
        <td><%=rs.getString("amaun")%></td>
        <td><%=rs.getString("tarikh")%></td>
        
        </tr>

        <%  }%>

    </table>
</center>
</body>