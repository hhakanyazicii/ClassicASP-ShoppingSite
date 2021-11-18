<!--#include file="baglan.asp"-->
<!--#include file="hesapbaglanti.asp"-->
<!--#include file="ustgiris.asp"-->
<!--#include file="kategori.asp"-->
<!--#include file="urunbaglanti.asp"-->
<!--#include file="imgdisplay.asp"-->
<!--#include file="uyebilgiupdate.asp"-->
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
</head>
<%   
dim logstate
    IF Session("uye") = 1 THEN              
       logstate = 1
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
    
    <div style='margin-left: 40%; margin-top: 0%;'>
    <img src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg" class="loginImg rounded">
    <div class="form-row">
    <div class="col">
    <h5>Adınız : </h5>
    <% response.write("<h3>" & logstate3.Fields("ad").value &"</h3>") %> 
    <label for="nameUpdate" class="container">Adını Güncelle : </label>
    <form method="post" action="uyebilgiupdate.asp">
    <input name="nameUpdate" type="text" value="">
    <input name="submit" type="submit" value="Adını Güncelle" class="btn btn-secondary btn-sm btn-block">
    </form>
    </div>
    </div>
    <div class="form-row">
    <div class="col">
    <h5>Soyadınız : </h5>
    <% response.write("<h3>" & logstate3.Fields("soyad").value &"</h3>") %>
    <label for="lastnameUpdate" class="container">Soyadını Güncelle : </label>
    <form method="post" action="uyebilgiupdate.asp">
    <input name="lastnameUpdate" type="text" value="">
    <input name="submit" type="submit" value="Soyadını Güncelle" class="btn btn-secondary btn-sm btn-block">
    </form>
    </div>
    </div>
    <div class="form-row">
    <div class="col">
    <h5>E-Mail Adresiniz : </h5>
    <% response.write("<h3>" & logstate3.Fields("email").value & "</h3>") %>
    <label for="emailUpdate" class="container">Email Güncelle : </label>
    <form method="post" action="uyebilgiupdate.asp">
    <input name="emailUpdate" type="email" value="">
    <input name="submit" type="submit" value="Email Güncelle" class="btn btn-secondary btn-sm btn-block">
    </form>
    </div>
    </div>
    <div class="form-row">
    <div class="col">
    <h5> İletişim Bilgileriniz : </h5>
    <% response.write("<h3>" & logstate3.Fields("iletisim").value & "</h3>") %>
    <label for="iletisimUpdate" class="container">İletişim Güncelle : </label>
    <form method="post" action="uyebilgiupdate.asp">
    <input name="iletisimUpdate" type="text" value="">
    <input name="submit" type="submit" value="İletişim Güncelle" class="btn btn-secondary btn-sm btn-block">
    </form>
    </div>
    </div>
    <br>
    <h5> Doğum Tarihiniz : </h5>
    <% response.write("<h3>" & logstate3.Fields("dogumtarihi").value & "</h3>") %>
    