<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    String id = (String) session.getAttribute("idPengguna");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    //INNER JOIN aduan & pengguna = idAduan, idPengguna, nama, emel, namaAduan, butiranAduan, tarikh;
    String query = "SELECT Aduan.idAduan, aduan.idPengguna, pengguna.nama, pengguna.emel, aduan.namaAduan, aduan.butiranAduan, aduan.tarikh from aduan inner join pengguna on aduan.idpengguna = pengguna.idPengguna ORDER BY tarikh DESC";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);

%>

<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <style>

        * {
            font-size: 20px;
        }


        h1 {
            font-family: 'Roboto', sans-serif;
            margin-left: 650px;
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


        #button {


            background-color: black;
            font-weight: bold;
            color: white;
            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin: 0px 0px -5000px 80px;

            transition : background-color 0.2s;
            transition : color 0.2s;
        }

        #button:hover {

            background-color: white;
            color: black;
            border: solid black;
            border-radius : 30px;
        }

        h2 {
            margin-top: -40px;
        }


        #nama {

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

        #nama:hover {

            border-radius : 30px;
            padding: 14px 16px;

            background-color: white;
            color: black;


        }

        table {
            background-color: white;
            margin-top: 45px;
            padding: 5px;
            border-radius: 20px;

            width: 80%; /*lebar*/

            height: 10%;
            border: 5px solid #000;

            font-family: 'Roboto', sans-serif;
        }

        #tarikh {
            width: 100px;
            font-size: 18px;

        }

        #akt {

            width: 300px;

        }

        #idd {
            width: 10px;
        }

        #idp {
            width: 10px;
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


        h4 {
            position : absolute;
            left : 580px;
            top : -36px;
            font-family: 'Roboto', sans-serif;
            font-size : 40px;

        }

        #tab:hover {
            color: black;
            background-color: white;

        }

        #button1 {

            font-weight: bold;

            background-color: white;

            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin-top: 45px;
            margin-left: -10px;

            transition : background-color 0.2s;
            transition : color 0.2s;

        }

        #button1:hover {

            background-color: white;
            color: black;
            border: 1px solid black;
            border-radius : 30px;

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
            height: 90px;
        }
    </style>
</head>

<body> 

    <ul>
        <li><a href="aduan_tambah.html" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Papar Aduan</a></li>


    </ul>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>PENGGUNA</h5>

<center>

    <h1>Senarai Aduan</h1>

    <form action="aduan_delete.jsp">
        <h2><button id="button1" type="submit"><span class="material-symbols-outlined">
delete
</span>
                Buang Aduan yang dihantar </button></h2>
    </form>
    <table>

        <tr id="bd">
            <th id="idp"> <b>Bil</b></th>
            <th id="idp"> <b>ID Aduan</b></th>
            <th id="idp"> <b>Nama Pengguna</b></th>
            <th id="idp"> <b>Emel Pengguna</b></th>
            <th id="akt"> <b>Nama Aduan</b></th>
            <th> <b>Butiran Aduan</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
                <%               
int bil = 1;
 while (rs.next()) {%>
        </tr>


        <tr id="kedua">
            <td><%=bil%></td>
            <td><%=rs.getString("idAduan")%></td>
            <td><%=rs.getString("nama")%></td>
            <td><%=rs.getString("emel")%></td>
            <td><%=rs.getString("namaAduan")%></td> 
            <td><%=rs.getString("butiranAduan")%></td>
            <td><%=rs.getString("tarikh")%></td>
        </tr>
        <% bil = bil + 1;
            }%>

    </table>
</center>
</body>