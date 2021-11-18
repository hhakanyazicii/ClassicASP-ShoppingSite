<!--#include file="baglan.asp"-->
<!--#include file="ustgiris.asp"-->

<%
dim mail2
mail2 = Session("mail")
dim logstate4
dim logstate5
logstate4 = "SELECT * FROM uye WHERE email='"&mail2&"'"
Set logstate5 = Baglanti.Execute(logstate4)
                Do Until logstate5.eof
					 logstate5.MoveNext
				Loop


'Ad Update
if not isempty(Request.Form("submit")) then
	islem=Request.Form("submit")
	if islem="Adını Güncelle" then			
		ad=Request.Form("nameUpdate")
		if ad="" then
			mesaj="<span style='color:red'>Alanları doldurunuz</span>"
		else
			queryName="UPDATE uye SET ad ='"&ad&"' WHERE email='"&mail2&"'"
			Set nameSQL=Baglanti.Execute(queryName)
                Response.Redirect "hesabim.asp"
    end if 
    end if 
    end if 
    'Soyad Update
    if not isempty(Request.Form("submit")) then
	islem=Request.Form("submit")
	if islem="Soyadını Güncelle" then			
		soyad=Request.Form("lastnameUpdate")
		if soyad="" then
			mesaj="<span style='color:red'>Alanları doldurunuz</span>"
		else
			queryLastname="UPDATE uye SET soyad ='"&soyad&"' WHERE email='"&mail2&"'"
			Set lastnameSQL=Baglanti.Execute(queryLastname)
                Response.Redirect "hesabim.asp"
    end if 
    end if 
    end if
    'Mail Update   
    if not isempty(Request.Form("submit")) then
	islem=Request.Form("submit")
	if islem="Email Güncelle" then		
		mailAdresi=Request.Form("emailUpdate")
		if mailAdresi="" then
			mesaj="<span style='color:red'>Alanları doldurunuz</span>"
		else
			queryEmail="UPDATE uye SET email ='"&mailAdresi&"' WHERE email='"&mail2&"'"
			Set emailSQL=Baglanti.Execute(queryEmail)
                Response.Redirect "hesabim.asp"
    end if 
    end if 
    end if
    'İletişim Update
    if not isempty(Request.Form("submit")) then
	islem=Request.Form("submit")
	if islem="İletişim Güncelle" then			
		iletisimGuncelleme=Request.Form("iletisimUpdate")
		if iletisimGuncelleme="" then
			mesaj="<span style='color:red'>Alanları doldurunuz</span>"
		else
			queryIletisim="UPDATE uye SET iletisim ='"&iletisimGuncelleme&"' WHERE email='"&mail2&"'"
			Set iletisimSQL=Baglanti.Execute(queryIletisim)
                Response.Redirect "hesabim.asp"
    end if 
    end if 
    end if

    %>