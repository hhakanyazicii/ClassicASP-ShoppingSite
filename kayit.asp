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
<%
     if not isempty(Request.Form("submit")) then
	ad=Request.Form("ad")
	soyad=Request.Form("soyad")
    username=Request.Form("username")
	email=Request.Form("email")
	password=Request.Form("password")
	passwordtekrar=Request.Form("passwordtekrar")
    dogumtarihi=Request.Form("dogumtarihi")
    iletisim=Request.Form("iletisim")
	if ad="" OR soyad="" OR email="" OR password="" OR passwordtekrar="" OR dogumtarihi="" OR iletisim="" then
		mesaj="<span style='color:red'>Alanları doldurunuz</span>"	
	else
		if password=passwordtekrar then
			query="SELECT * FROM uye WHERE email='"&email&"'"
			Set kullanicisql=Baglanti.Execute(query)
			Do Until kullanicisql.eof
				 userkontrol=1
				 kullanicisql.MoveNext
			Loop
			if userkontrol=1 then
				mesaj="<span style='color:red'>Bu E-Mail sistemde kayıtlı</span>"
			else
				'vt yeni kullanıcı kayıt:
				Dim baglan
				baglan="INSERT INTO uye (id,ad,soyad,username,email,password,dogumtarihi,iletisim) VALUES ('','"&ad&"','"&soyad&"','"&username&"','"&email&"','"&password&"','"&dogumtarihi&"','"&iletisim&"')"
				Baglanti.Execute baglan
				mesaj="<span style='color:green'>Kullanıcı kaydı gerçekleşti giriş yapabilirsiniz.</span>"
                'sepet oluşturma
                Dim baglan2
                Dim sepetidatama
                sepetidatama="SELECT * FROM uye WHERE email='"&email&"'"
                set sepetidatama2 = Baglanti.Execute(sepetidatama)
                sptid = sepetidatama2.Fields("id").value
                baglan2="INSERT INTO sepet (id,uye_id,toplamfiyat) VALUES ('','"&sptid&"','0')"
                set sepetidatama3 = Baglanti.Execute(baglan2)
			end if
		else
			mesaj="<span style='color:red'>Girdiğiniz parolalar aynı değil</span>"
		end if	
	end if
end if
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

    <form method="post" action="kayit.asp">

    <input type="text" name="ad" value="" class="kayitInput" placeholder="Ad"><br>

    <input type="text" name="soyad" value="" class="kayitInput" placeholder="Soyad"><br>

    <input type="text" name="username" value="" class="kayitInput" placeholder="Kullanıcı Adı"><br>

    <input type="text" name="email" value="" class="kayitInput" placeholder="E-Posta"><br>

    <input type="text" name="iletisim" value="" class="kayitInput" placeholder="Telefon No"><br>
    <label for="dogumtarihi" class="kayitInput2 row">Doğum Tarihi:</label>
    <input type="date" name="dogumtarihi" value="" class="kayitInput3"><br>

    <input type="password" name="password" value="" class="kayitInput" placeholder="Parola"><br>

    <input type="password" name="passwordtekrar" value="" class="kayitInput" placeholder="Parola Tekrar"><br>
	<input name="submit" type="submit" value="Kayıt Ol" class="kayitButon btn btn-secondary btn-sm btn-block"><br>
    <% 
    Response.write mesaj
    %>
</form>

</div>
    <script src="app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
</body>

</html>