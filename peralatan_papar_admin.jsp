<%@page import="java.sql.*"%>
<%
    Connection con;
    String name = request.getParameter("name");

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    //INNER JOIN peralatan & pengguna = idPeralatan, idPengguna, nama, emel, namaPeralatan, tarikh, status;
    String query = "SELECT peralatan.idPeralatan, pengguna.idPengguna, pengguna.nama, pengguna.emel, peralatan.namaPeralatan, peralatan.tarikh, peralatan.status FROM peralatan INNER JOIN pengguna ON peralatan.idPengguna= pengguna.idPengguna ORDER BY peralatan.tarikh DESC";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);


%>

<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <style>

        
        table {
            font-size: 20px;
        }


        h1 {
            font-family: 'Roboto', sans-serif;
            margin-left: 650px;
            font-size: 50px;
            display: flex;

            margin-top: 70px;
            margin-left: 630px;


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

            width: 65%; /*lebar*/

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




    </style>
</head>

<body> 


    <ul>
        <li><a href="index_admin.html" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
        <li><a id="tab">Pinjaman Peralatan Masjid</a></li>
    </ul>

    <style>
        #tab {
            background-color: white;
            color: black;
        }

        h1 {
            margin-top: 20px;
            color: white;

            text-shadow: 3px 3px black;
        }

        table {
            margin-top: 30px;
        }

        #button1 {
            background-color: white;
            font-weight: bold;
            color: black;
            padding: 10px 38px;
            font-size: 25px;
            border-radius: 30px;

            border: none;
            cursor: pointer;

            margin-top: 50px;
            margin-left: 10px;

            transition : background-color 0.2s;
            transition : color 0.2s;



        }

        #button1:hover {


            border: 1px solid black;
            border-radius : 30px;

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

        #status {
            width: 300px;
        }

        #kedua {
            height: 90px;
        }
    </style>

<center>

    <h4>Sistem Pengurusan Masjid</h4>
    <h5>ADMIN</h5>

    <h1>Senarai Peralatan</h1>

    <table>

        <tr id="bd">
            <th id="id1"> <b>Bil</b></th>
            <th id="id2"> <b>ID Pengguna</b></th>
            <th id="id3"> <b>Nama Pengguna</b></th>
            <th id="id4"> <b>Emel Pengguna</b></th>
            <th id="per"> <b>Nama Peralatan</b></th>
            <th id="tarikh"> <b>Tarikh</b></th>
            <th id="status"> <b>Status</b></th>

            <th id="status"> <b>Approved/Rejected</b></th>

            <th id="status"> <b>Hapus</b></th>



            <%                int bil = 1;
                while (rs.next()) {


            %>



        </tr>
        <tr id="kedua">

            <td><%=bil%></td>
            <td><%=rs.getString("idPengguna")%></td> 
            <td><%=rs.getString("nama")%></td> 
            <td><%=rs.getString("emel")%></td> 
            <td><%=rs.getString("namaPeralatan")%></td>
            <td><%=rs.getString("tarikh")%></td>
            <td id="test"><%=rs.getString("status")%></td>


        <style>

            * {
                text-decoration: none;
            }

            #test {
            }

            #status {
                text-align: center;

                background-color: #6666ff;

            }


            #approve {
                color: lime;
                text-decoration: none;

                transition: color 0.2s;

                background-color: #a6a6a6;
                padding: 10px;
                border-radius: 20px;
            }

            #reject {
                color: #ff3333;
                text-decoration: none;

                transition: color 0.2s;

                background-color: #a6a6a6;
                padding: 10px;
                border-radius: 20px;
            }

            #hapus {
                color: red;
                transition: color 0.2s;

            }

            #approve, #reject, #hapus {
                text-shadow: 1px 1px black;
            }

            #approve:hover, #reject:hover, #hapus:hover {
                color: orange;
            }


        </style>




        <td id="">
            <a href="status.jsp?idPeralatan=<%=rs.getString("idPeralatan")%>&status=Diterima" name="approve" id="approve" onclick="return valid();">Terima</a>
            <a href="status.jsp?idPeralatan=<%=rs.getString("idPeralatan")%>&status=Ditolak" name="reject" id="reject" onclick="return valid();">Tolak</a>
        </td>

        <td id="">
            <a href="peralatan_delete_admin_berjaya.jsp?idPeralatan=<%=rs.getString("idPeralatan")%>" name="hapus" id="hapus" onclick="return valid();">Hapus</a>
        </td>
        </tr>


        <% bil = bil + 1;
            }
        %>


        <script>
            function valid() {
                if (confirm("Adakah Anda Pasti?")) {
                    return true;
                } else {
                    return false;
                }
            }

        </script>

        <button id="button" onclick="window.print();"> <span class="material-symbols-outlined">
            description
        </span>
            Hasilkan Laporan</button>

        <style>
            #button {
                background-color: white;
                color: black;

                margin-top: 300px;
            }
            
            @media print {
                #button1, #button, h5 {
                 visibility: hidden;
             }
             
             
             
             
             
             h1 {
                 text-shadow: none;
                 
                  margin-left: 30px;
             }
             
             #approve, #reject, #hapus {
                 visibility: hidden;
             }
             
            
            }

            

            </style>
        </table>
    </center>
</body>


