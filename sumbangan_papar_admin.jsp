<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    //INNER JOIN Sumbangan & Pengguna = idSumbangan, idPengguna, nama, emel, maklumatBank, amaun, tarikh;
    String query = "SELECT sumbangan.idSumbangan, sumbangan.idPengguna, pengguna.nama, pengguna.emel, sumbangan.maklumatBank, sumbangan.amaun, sumbangan.tarikh FROM sumbangan INNER JOIN pengguna ON sumbangan.idPengguna=pengguna.idPengguna";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);


%>

<head>
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>

        * {
            font-size: 20px;
            font-family: 'Roboto', sans-serif;
        }

        h1 {
            font-family: 'Roboto', sans-serif;
            margin-left: 650px;
            font-size: 50px;
            display: flex;
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
        }

        #tarikh {
            width: 100px;

        }

        #idp {

            width: 50px;

        }

        #ids {
            width: 50px;
        }

        #namap {
            width: 100px;
        }

        #emelp {
            width: 200px;
        }

        #mbank {
            width: 300px;
        }

        #amaun {
            width: 80px;
            font-size: 20px;

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

        #tab {
            background-color: white;
        }

        #tab:hover {
            color: black;
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
        }


        h1 {

            margin-left: 600px;
            color: white;

            text-shadow: 3px 3px black;
        }

        table {
            margin-top: 10px;
            text-align: center;
        }

        #jumlah {

            margin-left: 540px;
            font-size: 50px;

            color: white;
            text-shadow: 4px 4px black;

            background-color: gray;
            border: 4px solid black;

            padding: 28px;

            padding-bottom: 10px;



            border-radius: 40px;

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
        <li><a href="index_admin.html" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Buat Sumbangan atas Talian</a></li>


    </ul>



    <h4>Sistem Pengurusan Masjid</h4>
    <h5>ADMIN</h5>


<center>


    <h1>Senarai Sumbangan</h1>

    <table>

        <tr id="bd">
            <th id="ids"> <b>Bil</b></th>
            <th id="ids"> <b>ID Sumbangan</b></th>

            <th id="namap"> <b>Nama Pengguna</b></th>
            <th id="emelp"> <b>Emel Pengguna</b></th>
            <th id="mbank"> <b>No. Akaun Bank</b></th>
            <th id="amaun"> <b>Amaun</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>

            <%                int amaun = 0;
                int bil = 1;
                while (rs.next()) {%>

        </tr>

        <tr id="kedua">
            <td><%=bil%></td>
            <td><%=rs.getString("idSumbangan")%></td>

            <td><%=rs.getString("nama")%></td>
            <td><%=rs.getString("emel")%></td>
            <td><%=rs.getString("maklumatBank")%></td>
            <td>RM<%=rs.getString("amaun")%></td>
            <td><%=rs.getString("tarikh")%></td>
        </tr>

        <%
                bil = bil + 1;
                amaun = amaun + rs.getInt("amaun");
            }
        %>

    </table>
        
    
<h6><span>Jumlah Amaun : <em>RM <%=amaun%></em></span></h6>

<button id="button" onclick="window.print();"><span class="material-symbols-outlined">
            description
        </span>
    Hasilkan Laporan</button>


    <style>
        
        em {
            color: #1dd55f;
            font-size: 85px;
            
            text-shadow: 3px 3px black;
        }
        
        h6 span  {
            background-color: gray;
            padding: 24px;
            padding-top: 36px;
            
            border-radius: 40px;
            border: solid black;
            
            color: white;
            
          
            margin-right: 70px;
            
            

        }
        
        span {
            font-size: 40px;
        }
        
        h6,i {
            font-family: 'Roboto', sans-serif;
            font-size : 60px;
            size: 50px;
            
            
            
            text-shadow: 3px 3px black;
            
            text-align: right;
            
            margin-right: 100px;
            margin-top: 30px;
            
          
        }
        
        #button {
            color: black;
            background-color: white;
            
            margin-top: -240px;
            margin-right: 250px;
        }
        
      
        
        @media print {
            h5 {
                visibility: hidden;
            }
            
            h1 {
                text-shadow: none;
                
                margin-left: 30px;
            }
            
            h6 {
                text-shadow: none;
            }
        }
        
        
    </style>
</center>
</body>