<!--#include file="ustgiris.asp"-->
<!--#include file="baglan.asp"-->
<!--#include file="kategori.asp"-->
<!--#include file="urunbaglanti.asp"-->
<!--#include file="imgdisplay.asp"-->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FavCategorize</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@500&display=swap" rel="stylesheet">
    <style>
    .loginImg {
        padding-top: 2%;
        padding-right: 3%;
    }
    </style>
</head>

<body class="myBodyClass">
<%
dim logstate
    IF Session("uye") = 1 THEN
       logstate = 1
       response.Redirect "index.asp"
    ELSE
       logstate = 0
    END IF
%>	 
    <nav class="navbar navbar-dark bg-dark justify-content-center">
    
        <ul class="nav justify-content-center">
            <li class="nav-item mainpage">
                <a class="nav-link active" aria-current="page" href="index.asp">Anasayfa</a>
            </li>
            
            <% If objKategori.EOF Then
               Response.Write("No items found")
              Else
              Do While Not objKategori.EOF
                response.write("<li class='nav-item'>")
                response.write("<a class='nav-link' href='"& objKategori.Fields("adi").value &".asp'>" & objKategori.Fields("adi").value & "</a>")
                response.write("</li>")
                objKategori.MoveNext()
                Loop
              End If %>
            <li class="nav-item">
                <a class="nav-link" href="#">İletişim</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Hakkımızda</a>
            </li>
            <% IF logstate = 1 THEN
            response.write("<a class='nav-link' href='hesabim.asp'>Hesabım</a>")
            response.write("<a class='nav-link' href='logout.asp'>Çıkış Yap</a>")
            response.write("<a class='nav-link' href='sepet.asp'>Sepet</a>")
            ELSE           
            response.write("<a class='nav-link' href='giris.asp'>Giriş Yap</a>")
            response.write("<a class='nav-link' href='kayit.asp'>Kayıt Ol</a>")
            END IF%>
        </ul>
    </nav>
    <div class="container">
    <img src="https://i.ibb.co/JKthzvk/user.png" class="loginImg rounded mx-auto d-block padding-top">
    <form method="post" action="giris.asp">
    <input type="text" name="email" value="" class="kayitInput" placeholder="E-Posta"><br>
    <input type="password" name="password" value="" class="kayitInput" placeholder="Parola"><br>
	<input name="submit" type="submit" value="Giriş Yap" class="kayitButon btn btn-secondary btn-sm btn-block"><br>
    </form>
 
    <%
    Response.write mesaj
%>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>

</html>