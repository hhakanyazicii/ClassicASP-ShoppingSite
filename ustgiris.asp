<!--#include file="baglan.asp"-->
<%
if not isempty(Request.Form("submit")) then
	islem=Request.Form("submit")
	if islem="Giriş Yap" then			
		email=Request.Form("email")
		password=Request.Form("password")
		if email="" OR password="" then
			mesaj="<span style='color:red'>Alanları doldurunuz</span>"
		else
			query="SELECT * FROM uye WHERE email='"&email&"'"
			Set kullanicisql=Baglanti.Execute(query)
			Do Until kullanicisql.eof
				 uyekontrol=1
				 kullanicisql.MoveNext
			Loop
			if uyekontrol=1 then
				query1="SELECT * FROM uye WHERE email='"&email&"' AND password='"&password&"'"
				Set kullanicipassword=Baglanti.Execute(query1)
				Do Until kullanicipassword.eof
					 passwordkontrol=1
					 'kullanicitip=kullanicipassword("2")
					 kullanicipassword.MoveNext
				Loop
				if passwordkontrol=1 then
					response.write("Session başlıyor")				    			
					Session.Timeout=200
					Session("mail")=email
					Session("uye")=1							
				else
					mesaj="<span style='color:red'>Parolanızı yanlış girdiniz</span>"

				end if
			else
				mesaj="<span style='color:red'>Bu email adresine ait kullanıcı bulunamadı</span>"

			end if		
		end if
	elseif islem="kayit" then
		Response.Redirect "kayit.asp"
	end if
end if
%>