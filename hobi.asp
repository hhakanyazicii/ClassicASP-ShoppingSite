<!--#include file="baglan.asp"-->
<!--#include file="ustgiris.asp"-->

<% Dim strHobi
Dim objHobi
strHobi = "SELECT * FROM urun INNER JOIN img ON urun.img_id=img.id WHERE kategori_id=6"
Set objHobi = Baglanti.Execute(strHobi)
%>

<!--#include file="ustgiris.asp"-->
<!--#include file="baglan.asp"-->
<!--#include file="kategori.asp"-->
<!--#include file="urunbaglanti.asp"-->
<!--#include file="imgdisplay.asp"-->
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    .card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}
</style>
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





<div class="container">
   <div class="row">

<% 
If objHobi.EOF Then
  Response.Write("No items found")
Else
  Do While Not objHobi.EOF
  Response.Write("<div class='col-sm-4'>")
   Response.Write("<div class='card h-100'>") 
   response.write("<img class='card-img-top' src='"& objHobi.Fields("path").value &"'>")  
   response.write("<div class='card-body h-100'>")
   response.write("<h5 class='card-title'>" & objHobi.Fields("adi").value & "</h5>")
   response.write("<p class='price'>" & objHobi.Fields("fiyat").value & " TL</p>")
   response.write("<form method='post' action='sepetekle.asp'><input name='submit' type='submit' value='Sepete Ekle' class='btn btn-dark'></form>")
   response.write("</div>") 
   response.write("</div>")
   response.write("</div>")
  objHobi.MoveNext
  Loop
  
End If %>
   </div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>