<!--#include file="baglan.asp"-->
<!--#include file="ustgiris.asp"-->
<% Dim strKategori
Dim objKategori
strKategori = "SELECT * FROM kategori"
Set objKategori = Baglanti.Execute(strKategori)
%>