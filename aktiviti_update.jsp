<%@page import="java.sql.*"%>
<%
    Connection con;
    String idAktiviti = request.getParameter("idAktiviti");

    String namaAktiviti = request.getParameter("namaAktiviti");

    String butiranAktiviti = request.getParameter("butiranAktiviti");

    String tarikh = request.getParameter("tarikh");

    session.setAttribute("idAktiviti", idAktiviti);

    ResultSet rs;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projek_fyp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");

    String query = "SELECT * FROM `aktiviti`";
    Statement st = con.createStatement();
    rs = st.executeQuery(query);


%>

<html>
    <head>
        <title>Laman Web Pengurusan Masjid</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <style>
            h4 {
                position : absolute;
                left : 580px;
                top : -36px;
                font-family: 'Roboto', sans-serif;
                font-size : 40px;

            }

            h2 {
                margin-top: 100px;
                font-family: 'Roboto', sans-serif;
                font-size: 40px;
                color: white;
            }

            label {
                font-family: 'Roboto', sans-serif;
                font-size: 30px;
                color: white;
            }

            input[type=Submit], input[type=reset] {
                border-radius: 30px;
                text-align : center;
                font-size: 25px;
                font-family: 'Roboto', sans-serif;

                cursor: pointer;
                background-color: white;
                padding: 10px 20px;
                transition : color 0.2s, background-color 0.2s;
            }

            .rectangle {
                position: absolute;
                border-radius: 20px;
                height: 470px;
                width: 900px;
                background-color: #1260cc;

                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;

                margin-top: -430px; /* importanttt !!!  */

                z-index:-999;
            }

            #tab {

            }

            #tab:hover {
                background-color: white;
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

        </style>

        <script>

            function valid() {
                return akhir1();
                
                
                function akhir1() {

                    if (document.getElementById("nama").value === "") {
                        alert("Sila masukkan Nama Aktiviti!");
                        return false;
                    } else if (document.getElementById("nama2").value === "") {
                        alert("Sila masukkan Butiran Aktiviti!");
                        return false;
                    } else if (document.getElementById("tarikh").value === "") {
                        alert("Sila masukkan tarikh!");
                        return false;
                    } 
                    return akhir2();



                }
                
                function akhir2() {
                if (confirm("Adakah anda pasti?")) {
                    return true;
                } else {
                    return false;
                }
            }

            }


            

        </script>

    </head>
    <body>


        <ul>
            <li><a href="aktiviti_kemaskini.jsp" title="Kembali ke Laman Utama!" ><span id="left" class="material-symbols-outlined">navigate_before</span></a></li>
            <li><a id="tab">Kemaskini Aktiviti Sedia ada</a></li>
        </ul>
        <h4>Sistem Pengurusan Masjid</h4>
        <h5>ADMIN</h5>
    <center>
        <h2>Masukkan Maklumat Aktiviti Baharu</h2>

        <form method="post" action="aktiviti_update_berjaya.jsp">
            <table>

                <style>
                    #nama1 {
                        width: 100px;

                        border-radius: 30px;

                        text-align : center;
                        font-size: 30px;
                        font-family: 'Roboto', sans-serif;
                    }

                    #nama2 {

                        height: 100px;
                        width: 390px;

                        border-radius: 30px;

                        text-align : center;
                        font-size: 28px;
                        font-family: 'Roboto', sans-serif;
                    }

                    textarea {
                        resize: none;

                    }
                </style>


                <tr>
                    <td style="text-align: right;"> <label>Masukkan Nama Aktiviti Baharu:   </label> </td>
                    <td> <input type="text" id="nama" name="Naktiviti" placeholder="Nama Aktiviti" value="<%=namaAktiviti%>"> </td>
                </tr>
                <tr>
                    <td style="text-align: right;"> <label>Masukkan Butiran Aktiviti Baharu:  </label> </td>


                    <td> <textarea id="nama2" name="Baktiviti" rows="5" cols="20" placeholder="Butiran Aktiviti"><%=butiranAktiviti%></textarea></td>
                </tr>

                <tr>
                    <td> <br> </td>
                </tr>


                <tr>
                    <td style="text-align: right;"> <label>Masukkan Tarikh: </label> </td>
                    <td> <input type="date" id="tarikh" name="tarikh" value="<%=tarikh%>"> </td>
                </tr>
            </table>
            <br>
            <input type="Submit" value="Hantar" onclick="return valid();">
            <input type="reset" value="Set Semula">
        </form>
        <div class="rectangle"></div>
        <br>
    </center>

</body>
</html>
