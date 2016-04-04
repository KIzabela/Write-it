

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page language="java" import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <%@ page language="java" import="java.sql.*" %>
    </body>
</html>

        
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



stmt.executeUpdate("delete from wydarzeniaoczekujace where idzwydarzenia="+id+" ");
stmt.executeUpdate("delete from wydarzenie where idzwydarzenia="+id+" ");

out.println("<font style=' color: #990000'> Wydarzenie usunięto.<br/> <a href='strona.html'>Przejdz do strony głównej</a></font>");



    %>