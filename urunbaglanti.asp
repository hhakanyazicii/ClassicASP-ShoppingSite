<!--#include file="baglan.asp"-->
<!--#include file="ustgiris.asp"-->


<% 
Dim strSQL
Dim strSepet
Dim objSepet
Dim objRS
strSepet = "SELECT * FROM sepet_urun INNER JOIN urun ON sepet_urun.sepet_id=urun.id AND sepet_urun.fiyat=urun.fiyat"
Set objSeper = Baglanti.Execute(strSepet)
strSQL = "SELECT * FROM urun INNER JOIN img ON urun.img_id=img.id"
Set objRS = Baglanti.Execute(strSQL) 
Dim strSptEkle
%>