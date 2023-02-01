<%@page import="java.sql.*"%>
<%

    String idPengguna = (String) session.getAttribute("idPengguna");
    //int idPengguna = 1;

    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    String query = "SELECT * FROM `pengguna` WHERE  idPengguna = " + idPengguna;
    Statement st = con.createStatement();
    rs = st.executeQuery(query);


%>

<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <style>

        * {
            font-size: 25px;
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

            width: 45%; /*lebar*/

            height: 10%;
            border: 5px solid #000;

            font-family: 'Roboto', sans-serif;
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

            background-color: white;
            font-weight: bold;

            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin: 100px 50px -5000px 80px;
            //  (atas)px, (leftright)px

            transition : background-color 0.2s;
            transition : color 0.2s;

        }

        #button1:hover {

            background-color: white;
            color: black;
            border: 1px solid black;
            border-radius : 30px;

        }

        td {
            text-align: center;
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
</head>

<body> 

    <ul>
        <li><a href="javascript:history.back()" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Semak Akaun</a></li>


    </ul>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>PENGGUNA</h5>

<center>
    <% if (rs.next()) {%>

    <h1>Maklumat Akaun</h1>
    <table>

        <tr id="bd" >


            <th id="idd" style="text-align: right;"> <b>ID Pengguna : </b></th>
            <td id="idp" style="text-align: left;"> <b><%=rs.getString("idPengguna")%></b></td>   
        </tr>


        <tr>
            <th style="text-align: right;">Nama Pengguna : </th>
            <td style="text-align: left;"><%=rs.getString("nama")%></td>
        </tr>

        <tr>
            <th style="text-align: right;">Emel Pengguna : </th>
            <td style="text-align: left;"><%=rs.getString("emel")%></td>
        </tr>

        <tr>
            <th style="text-align: right;">Kata Laluan : </th>
            <td id="pass" style="text-align: left;"><span id="passText"><%=rs.getString("kataLaluan")%> <span id="hover" title="" class="material-symbols-outlined">
ads_click
</span> </span></td>
        </tr>

        <style>
            
            #hover {
                color: black;
                margin-left: 30px;
            }
            
            #passText {
                background-color: #cccccc;

                transition: background-color 0.2s;

                border-radius: 20px;

                padding: 5px;
                padding-right: 12px;
                padding-left: 30px;
                
                color: #cccccc;
                
                transition: color 0.2s;

            }

            #passText:hover {
              
                color: black;
            }
            
            #button1 {
                
            }
        </style>

        <%   }

            session.setAttribute("nama", rs.getString("nama"));
            session.setAttribute("emel", rs.getString("emel"));
            session.setAttribute("kataLaluan", rs.getString("kataLaluan"));

        %>

    </table>
        <!--<form action="akaun_update.jsp?emel=<%=rs.getString("emel")%>&nama=<%=rs.getString("nama")%>&kataLaluan=<%=rs.getString("kataLaluan")%>" method="post"> -->
    <form action="akaun_update.jsp" method="post">
        <h2><button id="button1" type="submit"><span class="material-symbols-outlined">
edit
</span>
                Kemaskini Maklumat Akaun</button></h2>
    </form>


</center>
</body>