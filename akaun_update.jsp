<%
    
String emel = (String) session.getAttribute("emel");
String nama = (String) session.getAttribute("nama");
String kataLaluan = (String) session.getAttribute("kataLaluan");
    

%>
<html>
    <head>

        <title>Laman Web Pengurusan Masjid</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


        <script>
            function valid() {

                if (document.getElementById("emel").value === "") {
                    alert("Sila masukkan Emel!");
                    return false;
                } else if (document.getElementById("nama").value === "") {
                    alert("Sila masukkan Nama!");
                    return false;
                } else if (document.getElementById("kataLaluan").value === "") {
                    alert("Sila masukkan Kata Laluan!");
                    return false;
                }
                return akhir();

            }

            function akhir() {


                if (confirm("Adakah anda pasti?")) {
                    return true;
                } else {
                    return false;
                }
            }

        </script>
        <style>

            h1 {
                font-family: 'Roboto', sans-serif;
                margin-left: 70px;
                font-size: 100px;
                display: flex;
            }

            h3 {
                font-family: 'Roboto', sans-serif;
                margin-left: 80px;
                font-size: 55px;
                display:flex;
                margin-top: 0px;

            }

            .rectangle {
                position: absolute;
                border-radius: 20px;
                height: 400px;
                width: 750px;
                background-color: #1260cc;

                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;

                margin-top: -380px;

                z-index:-999;

            }

            #daftar {
                margin: -0px 500px -50px -130px;


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
            <!--<li><a href="index.html">Laman Utama</a></li>-->
        </ul>
    <center>
        <h4>Sistem Pengurusan Masjid</h4>
        <h5>PENGGUNA</h5>
        <h2>Masukkan Maklumat Akaun Baharu</h2>

        <form method="post" action="akaun_update_berjaya.jsp">
            <table>

                <tr>
                    <td style="text-align: right;"> <label>Masukkan Emel: </label> </td>
                    <td> <input type="text" id="emel" name="emel" placeholder="Emel" value="<%=emel%>"> </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>

                <tr>
                    <td style="text-align: right;"> <label>Masukkan Nama: </label> </td>
                    <td> <input type="text" id="nama" name="nama" placeholder="Nama" value="<%=nama%>"> </td>
                </tr>

                <tr>
                    <td style="text-align: right;"> <label>Masukkan Kata Laluan: </label> </td>
                    <td> <input type="password" id="kataLaluan" name="kataLaluan" placeholder="Kata Laluan" value="<%=kataLaluan%>"> </td>
                </tr>

            </table>

            <br><br>
            <input type="Submit" value="Hantar" onclick="return valid();">
            <input type="reset" value="Set Semula">

        </form>
        <div class="rectangle"></div>


    </center>
</body>
</html>
