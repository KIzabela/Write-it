

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Twoje wydarzenia</title>
   <link rel="Stylesheet" type="text/css" href="style.css"  media="all"/> </head>
    <%@ page language="java" import="java.sql.*" %>
     
    <body>
    <div id="top"></br>
    Write it...
    </div> <div><br/><br/><br/></div>
       
        
        <%
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
%>

<table style='background-color: #f1f1f1; table-layout: fixed; width: 70%; text-align: center ' align='center' border='1' cellspacing='0'>
    <tr height="50" style="text-align: center; "><td><font style=" color: #990000"><b>Tytuł wydarzenia</b></font></td>
        <td><font style=" color: #990000"><b>Data wydarzenia</b></font></td>
        <td><font style=" color: #990000"><b>Rodzaj<b></font></td>
        <td><font style=" color: #990000"> </font></td>
        
        </tr></table>

<%

 ResultSet rs;
    rs = stmt.executeQuery("select wydarzenie.idzwydarzenia, wydarzenie.tytul, wydarzenie.data, wydarzenie.rodzaj from wydarzenie join klient using(idklienta) where login ='"+session.getAttribute( "login" )+"' order by wydarzenie.data desc");
    
    int i=1;
    while(rs.next())
  { %>


    <table style='background-color: white; table-layout: fixed; width: 70%; text-align: center; border-color: lightblue; border-style: outset ' align='center' border='1' cellspacing='0'>
<tr>
  
    <td>
        
      <font style=" color: #990000"> <%out.print(rs.getString(2));%> </font>
    </td>
    <td>
            <font style=" color: #990000"> <%out.print(rs.getString(3));%> </font>

    </td>
    <td>
        <font style=" color: #990000"> <%out.print(rs.getString(4));%> </font>

    </td>
    
     <td>
        <font style=" color: #990000"> 
            <form  action="opis.jsp"  method="post">
        
      <input type="hidden" name="id" value="<%=rs.getString(1) %>" />
    
    <INPUT TYPE="SUBMIT" VALUE="Zobacz szczegóły...">
         
       
    </form></font>

    </td>
    
   
  </tr>
    </table>
        

<% i++;
}
    %>
   &nbsp;&nbsp; <a href="strona.html">Powrót...</a>
        
        
    </body>
</html>
