<%-- 
    Document   : dodajwydarzenie
    Created on : 2016-01-01, 21:36:37
    Author     : iza
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page language="java" import="java.sql.*" %>
        <%@page import="java.text.SimpleDateFormat"%>
        <%@page import=" java.util.Date"%>
    <%


String tytul = request.getParameter("t_tytul");
String data = request.getParameter("data");
String godzina = request.getParameter("t_godz");
String rodzaj = request.getParameter("t_rodzaj");
String opis = request.getParameter("opis");
String email = request.getParameter("email");


Connection conn =null;
 Statement stmt = null; 

 
 
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/notatnik";
    String username = "root";
    String password = "";
try {
    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url, username, password);
    stmt = conn.createStatement();
     } catch (SQLException e){
            out.println("Nie polaczyles sie z baza");
        }

   
    ResultSet idklienta;
    ResultSet rs;
    idklienta = stmt.executeQuery("select idklienta from klient where login ='"+session.getAttribute( "login" )+"' ");
  if(idklienta.first())
  {
   String i = idklienta.getString(1);
  

   int id = Integer.valueOf(i);
  

  
   stmt.executeUpdate("INSERT INTO wydarzenie(idklienta,tytul,data,godzina,rodzaj,opis) VALUES ("+id+",'"+tytul+"','"+data+"','"+godzina+"','"+rodzaj+"','"+opis+"')");    
  rs = stmt.executeQuery("SELECT idzwydarzenia FROM wydarzenie order by idzwydarzenia desc limit 1;");
   rs.next();
int nr = rs.getInt(1);

 stmt.executeUpdate("INSERT INTO wydarzeniaoczekujace(data,opis,adres,godzina,idzwydarzenia) VALUES('"+data+"','"+opis+"','"+email+"','"+godzina+"',"+nr+")");
  }
  
  stmt.close();
   
out.println("<font style=' color: #990000'>Dodano wydarzenie pomyślnie.<br/> <a href='strona.html'>wróc</a></font>");
    

%>
    </body>
</html>
