<% 	 
     mysql_server = "localhost"
     mysql_user = "root"
     mysql_pass = ""
     mysql_db = "favcategorize"

     Connection_DSN= "DRIVER={MySQL ODBC 3.51 Driver}; Stmt=SET NAMES 'utf8'; SERVER="&mysql_server&"; UID="&mysql_user&"; pwd="&mysql_pass&";db="&mysql_db&";"
     Set Baglanti= Server.CreateObject("ADODB.Connection")
     Baglanti.Open Connection_DSN
%>