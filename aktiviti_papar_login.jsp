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

        ::selection{
            background-color: black;
            color: white;
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

            width: 60%; /*lebar*/

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

        td {
            background-color: gray;
            padding: 10px;
            border-radius: 20px;
            margin: 5px;
        }



        th {
             color: white;
            //background-color: black;
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
        #tab {
            background-color: black;
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
        * {
            font-size: 20px;
        }

        #senarai {
           
            color: white;
            text-shadow: 3px 3px black; 
            font-size: 50px;
        }
        
        #tab:hover {
            color: black;
        }
        
         #kedua {
            height: 90px;
        }


    </style>
</head>

<body> 

    <ul>
        <li><a href="index_login_jsp.jsp" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a style=" background-color: white" id="tab">Papar Aktiviti Terkini</a></li>

        <!--#ef3a25-->
    </ul>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>PENGGUNA</h5>

<center>

    <h1><span id="senarai">Senarai Aktiviti</span></h1>
    <table>

        <tr id="bd">
            <th id="bil"> <b>Bil</b></th>
            <th id="akt"> <b>Nama Aktiviti</b></th>
            <th> <b>Butiran Aktiviti</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
                <%                    int bil = 1;

                    while (rs.next()) {%>

        </tr>

        <tr id="kedua">
        <td><%=bil%></td>
        <td><%=rs.getString("namaAktiviti")%></td> 
        <td><%=rs.getString("butiranAktiviti")%></td>
        <td><%=rs.getString("tarikh")%></td>
</tr>

        <%
                bil = bil + 1;
            }%>    
    </table>
</center>
</body>