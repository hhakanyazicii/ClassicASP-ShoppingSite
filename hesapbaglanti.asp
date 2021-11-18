<!--#include file="baglan.asp"-->
<!--#include file="ustgiris.asp"-->

<%
dim mail
mail = Session("mail")
dim logstate2
dim logstate3
logstate2 = "SELECT * FROM uye WHERE email='"&mail&"'"
Set logstate3 = Baglanti.Execute(logstate2)
%>

       