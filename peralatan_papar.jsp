<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    //INNER JOIN peralatan & pengguna = idPeralatan, idPengguna, nama, namaPeralatan, tarikh, status;
    String query = "SELECT peralatan.idPeralatan, pengguna.idPengguna, pengguna.nama, peralatan.namaPeralatan, peralatan.tarikh, peralatan.status from peralatan INNER JOIN pengguna on peralatan.idPengguna= pengguna.idPengguna order by peralatan.tarikh DESC";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);


%>

<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <style>



        h1 {
            font-family: 'Roboto', sans-serif;
            margin-left: 650px;
            font-size: 50px;
            display: flex;

        }

        h4 {
            position : absolute;
            left : 580px;
            top : -36px;
            font-family: 'Roboto', sans-serif;
            font-size : 40px;

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
            margin-top: 110px;
            padding: 5px;
            border-radius: 20px;

            width: 70%; /*lebar*/

            height: 10%;
            border: 5px solid #000;

            font-family: 'Roboto', sans-serif;

            text-align: center;
        }

        #tarikh {
            width: 100px;
            font-size: 20px;


        }

        #akt {

            width: 300px;

        }

        #id1 {
            width: 1px;
        }

        #id2 {
            width: 1px;
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

        #button {
            margin-top: 150px;
            margin-left: 10px;



        }

        #button:hover {


            border: 1px solid black;
        }

        #button1 {

            margin-left: 30px;

            background-color: white;
            color: black;

            font-weight: bold;

            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin: 0px 0px -5000px 80px;

            transition : background-color 0.2s;
            transition : color 0.2s;



        }

        #button1:hover {

            background-color: white;
            color: black;
            border: 1px solid black;
            border-radius : 30px;




        }

        h1 {
            margin-top: 30px;
            margin-left: 630px;

            color: white;

            text-shadow: 3px 3px black;

        }

        .parent {

            border: 1px solid black;
            margin: 1rem;
            padding: 2rem 2rem;
            text-align: center;

            border: hidden;

            position: absolute;
            margin-left: 300px;
            margin-top: 80px;
        }
        .child {


            margin-right: -55px;
            display: inline-block;

            vertical-align: middle;
        }

        * {
            font-size: 20px;
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
        <li><a href="index_login_jsp.jsp" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Pinjaman Peralatan Masjid</a></li>
    </ul>

    <style>
        #tab {
            background-color: white;
            color: black;
        }
    </style>

<center>


    <div class='parent'>

        <div class='child'>
            <form action="peralatan_tambah.html">
                <h2><button id="button1" type="submit"><span class="material-symbols-outlined">
add
</span>
                        Buat Pinjaman Peralatan</button></h2>
            </form>
        </div>

        <div class='child'>
            <form action="peralatan_delete.jsp">
                <h2><button id="button1" type="submit"><span class="material-symbols-outlined">
delete
</span>
                        Buang Pinjaman Peralatan</button></h2>
            </form>
        </div>


    </div>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>PENGGUNA</h5>





    <h1>Senarai Peralatan</h1>
    <table>

        <tr id="bd">
            <th id="id1"> <b>ID Peralatan</b></th>

            <th id="id3"> <b>Nama Pengguna</b></th>
            <th id="per"> <b>Nama Peralatan</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
            <th id="tarikh"> <b>Status</b></th>

            <%  while (rs.next()) {%>

        </tr>

        <tr id="kedua">
        <td><%=rs.getString("idPeralatan")%></td>

        <td><%=rs.getString("nama")%></td>
        <td><%=rs.getString("namaPeralatan")%></td>
        <td><%=rs.getString("tarikh")%></td>
        <td><%=rs.getString("status")%></td>

        </tr>
        <%  }%>




    </table>
</center>
</body>