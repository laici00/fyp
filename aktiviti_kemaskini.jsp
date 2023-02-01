<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    String query = "SELECT * FROM `aktiviti` ORDER BY tarikh DESC";
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

            margin-top: 40px;

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

            width: 80%; /*lebar*/

            height: 10%;
            border: 5px solid #000;

            font-family: 'Roboto', sans-serif;

            text-align: center;
        }

        #tarikh {
            width: 100px;

        }

        #akt {

            width: 300px;

        }

        #idd {
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

        .material-symbols-outlined {

            font-size:25px;
            font-variation-settings:
                'FILL' 0,
                'wght' 700,
                'GRAD' 0,
                'opsz' 48


        }

        h4 {
            position : absolute;
            left : 580px;
            top : -36px;
            font-family: 'Roboto', sans-serif;
            font-size : 40px;

        }

        #tab {
            background-color: black;
        }

        .parent {

            border: 1px solid black;
            margin: 1rem;
            padding: 2rem 2rem;
            text-align: center;

            border: hidden;

            position: absolute;
            margin-left: 100px;
            margin-top: -10px;
        }
        .child {


            margin-right: -55px;
            display: inline-block;

            vertical-align: middle;


        }

        #button1 {

            margin-left: 40px;

            background-color: white;
            font-weight: bold;
            color: black;
            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin: 0px 0px -1000px 0px;


            transition : color 0.2s, background-color 0.2s;

            margin-top: 18px;



        }

        #button1:hover {


            color: black;
            border: 1px solid black;
            border-radius : 30px;




        }

        #button2 {

            margin-left: 20px;
            margin-top: 20px;


            background-color: black;
            font-weight: bold;
            color: white;
            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            transition : background-color 0.2s;
            transition : color 0.2s;




        }

        #button2:hover {

            background-color: white;
            color: black;
            border: solid black;
            border-radius : 30px;


        }

        #tarikh {
            font-size: 18px;
        }

        * {
            font-size: 21px;
            text-decoration:none;

        }

        #update {
            text-align: center;
        }

        #updateText{
            color: #71a9f7;

            transition: color 0.2s;

            text-shadow: 1px 1px black;

            background-color: gray;
            padding: 10px;
            border-radius: 40px;
        }

        #updateText:hover{
            color: orange;
        }


        #delete {
            text-align: center;
        }

        #deleteText {
            color: #ff0035;

            transition: color 0.2s;

            text-shadow: 1px 1px black;

            background-color: gray;
            padding: 10px;
            border-radius: 40px;


        }

        #deleteText:hover {
            color: orange;
        }

        #nama2 {

            height: 100px;

            border-radius: 30px;

            text-align : center;
            font-size: 30px;
            font-family: 'Roboto', sans-serif;
        }

        textarea {
            resize: none;

        }

        #tab {
            background-color: white;
        }

        #tab:hover {
            color: black;
        }

        h5 {
            position : absolute;
            right : 532px;
            top : -12px;
            font-family: 'Roboto', sans-serif;
            font-size : 20px;
            color: gold;

            text-shadow: 2px 2px black;
        }

        #kedua {
            height: 90px;
        }



    </style>
</head>

<body> 

    <ul>
        <li><a href="index_admin.html" onclick="" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Aktiviti</a></li>

    </ul>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>ADMIN</h5>

<center>

    <h1>Senarai Aktiviti</h1>


    <form action="aktiviti_tambah.html">
        <h2><button id="button1" type="submit"><span class="material-symbols-outlined">
add
</span>
                Tambah Aktiviti Baharu</button></h2>
    </form>

    <table>

        <tr id="bd">
            <th id="idd"> <b>Bil</b></th>
            <th id="akt"> <b>Nama Aktiviti</b></th>
            <th> <b>Butiran Aktiviti</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
            <th id="tarikh"> <b>Kemaskini?</b></th>
            <th id="tarikh"> <b>Hapus?</b></th>
                <%              int bil = 1;
                    while (rs.next()) {%>

        </tr>

        <!--<td><%=rs.getString("idAktiviti")%></td>-->

        <tr id="kedua">
            <td><%=bil%></td>
            <td><%=rs.getString("namaAktiviti")%></td> 
            <td><%=rs.getString("butiranAktiviti")%></td>
            <td><%=rs.getString("tarikh")%></td>

            <td id="update"><a href="aktiviti_update.jsp?idAktiviti=<%=rs.getString("idAktiviti")%>&namaAktiviti=<%=rs.getString("namaAktiviti")%>&butiranAktiviti=<%=rs.getString("butiranAktiviti")%>&tarikh=<%=rs.getString("tarikh")%>" name="update" id="updateText" ">Kemaskini</a></td>

            <td id="delete"><a href="aktiviti_delete_berjaya.jsp?idAktiviti=<%=rs.getString("idAktiviti")%>" name="delete" id="deleteText" onclick="return valid();">Hapus</a></td>


        </tr>
        <script>
            function valid() {
                if (confirm("Adakah Anda Pasti?")) {
                    alert("Data Dihapuskan!");
                } else {
                    return false;
                }
            }

        </script>


        <%
                bil = bil + 1;
            }%>
    </table>

    <button id="button" onclick="window.print();">
        <span class="material-symbols-outlined">
            description
        </span>
        Hasilkan Laporan</button>

    <style>
        #button {
            margin-left: 20px;
            margin-top: 30px;

            color: black;
            background-color: white;
        }


        @media print {
            #button1, #button, h5 {
                visibility: hidden;
            }

            h1 {
                text-shadow: none;

                margin-left: 30px;
            }


        }
    </style>
</center>
</body>