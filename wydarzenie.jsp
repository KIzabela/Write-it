<%-- 
    Document   : kalendarz
    Created on : 2015-11-07, 20:18:57
    Author     : IZA
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Stylesheet" type="text/css" href="style.css"  media="all"/>
        <script src="js.js"></script>
        <style>
            span.err { color: red; font-weight: bold;  padding-left: 2px }
            .green{ color: green }
            .red{ color: red}
        </style>
        <title></title>
    </head>
    <body>
        <div id="top"></br>
    Write it...
    </div>
    <div id="middle"></div><div id="left"><br/></div>
    <div id="right">
       
     
              <%
            String id = request.getParameter("id");
            
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

ResultSet rs;
    rs = stmt.executeQuery("select email from klient where login ='"+session.getAttribute( "login" )+"'");
    
    rs.first();
    String e = rs.getString(1);
    
        %>
        <div style="margin-left: 150px"><font style=" color: #cc0066">
            
          <h1>Dodaj nowe wydarzenie</h1><br/><br/>
        <form action="dodajwydarzenie.jsp" method="post">
        
         Tytuł wydarzenia:<input  type="text" name="t_tytul" /> <span class="err" id="e_tytul" > </span><br/><br/>
         Data wydarzenia: <input type="text" name="data" onKeyUp="sprdata(this);" />&nbsp;&nbsp;<b id="data" class="none"> </b><br/><br/>
         Godzina rozpoczęcia wydarzenia: <input type="text" name="t_godz" onKeyUp="checkh(this);" /> &nbsp;&nbsp;<b id="godz" class="none"> </b><br/><br/>
         <input type="radio" name="t_rodzaj" value="spotkanie" /> spotkanie
         <input type="radio" name="t_rodzaj" value="urodziny" /> urodziny
         <input type="radio" name="t_rodzaj" value="imieniny" /> imieniny
         <input type="radio" name="t_rodzaj" value="wizyta u lekarza" /> wizyta u lekarza
         <input type="radio" name="t_rodzaj" value="rocznica" /> rocznica
         <input type="radio" name="t_rodzaj" value="inne" checked="checked" /> inne<br/><br/>
         Opis wydarzenia: <br/><textarea name="opis" cols="40" rows="15"> </textarea><br/><br/>
         <input type="hidden" name="email" value="<%=e%>" />
         
         
       <input type="submit" value="Dodaj wydarzenie" onClick="return validate(this.form)"/>
       
        </form></font>
        </div>
        
    </div>
    <div id="bottom"><a href="strona.html">Powrót...</a></div>
    </body>
</html>
