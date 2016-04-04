



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Twoje wydarzenia</title>
   <link rel="Stylesheet" type="text/css" href="style.css"  media="all"/> </head>
    <%@ page language="java" import="java.sql.*" %>
     
    <body>
    <div id="top"></br>
    Write it...
    </div><div><br/><br/><br/></div>
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
    rs = stmt.executeQuery("select wydarzenie.tytul, wydarzenie.data, wydarzenie.opis, wydarzenie.godzina, wydarzenie.rodzaj from wydarzenie join klient using(idklienta) where login ='"+session.getAttribute( "login" )+"' and idzwydarzenia = "+id+"  ");
        
    
    
    
    
        if(rs.first()){%>
            <div>
    <table style='background-color: white; table-layout: fixed; width: 70%; text-align: center; border-color: lightblue' border='1' align='center'  cellspacing='0'>
<tr >
  
    <td height="50" ><font style=" color: #990000">
        <b>  Tytuł wydarzenia:&nbsp;&nbsp; </b><%out.print(rs.getString(1));%>
        </font>
    </td>
    <td height="50"><font style=" color: #990000">
           <b>Data wydarzenia:&nbsp;&nbsp;  </b><%out.print(rs.getString(2));%>
        </font>
    </td>
<tr>
    <td height="50"><font style=" color: #990000">
        <b>Godzina wydarzenia:&nbsp;&nbsp;</b>  <%out.print(rs.getString(4));%>
        </font>
    </td >

    <td height="50"><font style=" color: #990000">
        <b>Rodzaj wydarzenia:&nbsp;&nbsp;</b>  <%out.print(rs.getString(5));%>
        </font>
    </td>
</tr><tr>
    <td height="80" colspan="2"><font style=" color: #990000">
        <b>Opis: &nbsp;&nbsp;</b> <%out.print(rs.getString(3));%>
        </font>
    </td>
    
  
  </tr>
        
    </table></div>
    
    <%
             
             
         }
        
         
         
         
        
        
        %>
    
    
   <div style="margin-left: 300px"> <form action="usun.jsp"  method="post">
	<input type="hidden" name="id" value="<%=id%>" />
     <INPUT TYPE="SUBMIT" VALUE="Usun wydarzenie">
       </form></div>
    
   
    
    
        
       &nbsp;&nbsp; <a href="twojewydarzenia.jsp">Powrót...</a>
    </body>
</html>