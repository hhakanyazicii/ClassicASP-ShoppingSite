<!--#include file="ustgiris.asp"-->
<!--#include file="baglan.asp"-->
<!--#include file="urunbaglanti.asp"-->
<!--#include file="hesapbaglanti.asp"-->
<%
     Dim UrunID
     Dim objUrunID
     Dim SptID
     Dim objSpTID
     Dim fiyat2
     Dim objFiyat
     Dim objSptEkle
     dim sepetguncelleme
     dim fiyatyeni
      if not isempty(Request.Form("submit")) then
        urunekle=Request.Form("submit")
        if urunekle="Sepete Ekle" then
    
     IF Session("uye") = 1 THEN
       UrunID = "SELECT * FROM urun WHERE id="&objRS.Fields("id").value&""
       objUrunID = Baglanti.Execute(UrunID)
       response.write(TypeName(objUrunID))
       dim asd
        'ürün id querysiz
        asd = (objRS.Fields("id").value)
        response.write(asd &"<br>")
'//////////////////////////////////////////////////////////
       SptID = "SELECT * FROM sepet WHERE uye_id IN(SELECT id FROM uye WHERE email='"&mail&"')"
       objSptID = Baglanti.Execute(SptID)
       response.write(TypeName(objSptID))
       response.write(objSptID)
'//////////////////////////////////////////////////////////
       fiyat2 = "SELECT * FROM urun WHERE id="&objRS.Fields("id").value&""
       objFiyat = Baglanti.Execute(fiyat2)
        sdf = (objRS.Fields("fiyat").value)
       response.write(TypeName(sdf)&"<br><br>")
       response.write(sdf)
'/////////////////////////////////////////////////////////
       SptEkle = "INSERT INTO sepet_urun (id,sepet_id,urun_id,fiyat) VALUES ('','"&objSptID&"','"&objUrunID&"','"&objFiyat&"')"
       Set SptEkle2= Baglanti.Execute(SptEkle)
'////////////////////////////////////////////////////////
       sepetguncelleme="SELECT SUM(fiyat) FROM sepet_urun WHERE sepet_id='"&objSptID&"'"
       Set yenifiyat = Baglanti.Execute(sepetguncelleme)
       response.write(TypeName(yenifiyat))
'///////////////////////////////////////////////////////
       fiyatyeni = "UPDATE sepet SET toplamfiyat='"&yenifiyat&"' WHERE sepet_id='"&objSptID&"'"
       Set priceupdate = Baglanti.Execute(fiyatyeni)

     ELSE
       response.write ("Sepete ürün eklemek için giriş yapmalısınız.")
     END IF
     else
     response.write ("Sepete ürün eklemek için giriş yapmalısınız.")
     end if
     else
     response.write ("Sepete ürün eklemek için giriş yapmalısınız.")
     end if 
%>	 