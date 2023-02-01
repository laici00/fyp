<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
    
    //INNER JOIN Aduan & Pengguna = idAduan, idPengguna, nama, emel, namaAduan, butiranAduan, tarikh;
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
            text-decoration: none;
        }
        
        

        h1 {
            font-family: 'Roboto', sans-serif;
            margin-left: 650px;
            font-size: 50px;
            display: flex;

            color: white;
            
            text-shadow: 3px 3px black;
        }

        h5 {
            position : absolute;
            right : 532px;
            top : -12px;
            font-family: 'Roboto', sans-serif;
            font-size : 20px;
            color: gold;
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

            width: 85%; /*lebar*/

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

            font-size : 40px;

        }

        #tab {
            background-color: white;

        }

        #tab:hover {
            color: black;
        }

        #button1 {
            background-color: black;
            font-weight: bold;
            color: white;
            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin-top: 50px;
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
            text-shadow: 2px 2px black;
        }

        table {
            text-align: center;

            text-decoration : none;
        }
        
        #deleteText{
              color: #ff0035;

            transition: color 0.2s;

            text-shadow: 1px 1px black;
            
            background-color: gray;
            padding: 15px;
            border-radius: 40px;
        }
        
        #deleteText:hover {
            color: orange;
        }
        
        #kedua {
            height: 90px;
        }

    </style>

    <script>
        function valid() {


            if (confirm("Adakah anda pasti?")) {
                return true;
            } else {

                return false;
            }
        }


    </script>

</head>

<body> 

    <ul>
        <li><a href="index_admin.html" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Papar Aduan</a></li>
    </ul>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>ADMIN</h5> 


<center>
    <h1>Senarai Aduan</h1>

    <table>

        <tr id="bd">
            <th id="idd"> <b>Bil</b></th>
            <th id="idp"> <b>ID Pengguna</b></th>
            <th id="idp"> <b>Nama Pengguna</b></th>
            <th id="idp"> <b>Emel Pengguna</b></th>
            <th id="akt"> <b>Nama Aduan</b></th>
            <th> <b>Butiran Aduan</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
            <th id="tarikh"> <b>Hapus</b></th>
                <%         int bil = 1;
       while (rs.next()) {%>
        </tr>

        <tr id="kedua">
        <td><%=bil%></td>
        <td><%=rs.getString("idPengguna")%></td>
        <td><%=rs.getString("nama")%></td>
        <td><%=rs.getString("emel")%></td>
        <td><%=rs.getString("namaAduan")%></td> 
        <td><%=rs.getString("butiranAduan")%></td>
        <td><%=rs.getString("tarikh")%></td>

        <td> <a id="deleteText" href="aduan_delete_berjaya.jsp?id=<%=rs.getString("idAduan")%>" onclick="return valid();">Hapus</a> </td>

        </tr>
        <%  bil = bil + 1;
            }
        %>
    </table>
    
     <button id="button" onclick="window.print();"><span class="material-symbols-outlined">
            description
        </span>
         Hasilkan Laporan</button>

     <style>
         
         #button {
             margin-left: 15px;
             margin-top: 30px;
             
             background-color: white;
             color: black;
         }
         
         @media print {
             #button, #button, h5 {
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