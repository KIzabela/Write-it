<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ page language="java" import="java.sql.*" %>
<%
String login = request.getParameter("login");
String haslo = request.getParameter("haslo");
String imie = request.getParameter("imie");
String nazwisko = request.getParameter("nazwisko");
String miejscowosc = request.getParameter("miejscowosc");
String email=request.getParameter("email");

Connection conn =null;
 Statement stmt = null; 
 ResultSet rs = null; 
 
 
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
 

rs = stmt.executeQuery("select count(*) from klient where klient.login = '"+login+"'");

 rs.next();
int rowCount = rs.getInt(1);

//ResultSetMetaData rsmd = rs.getMetaData();
// int i = rsmd.getColumnCount();

if(rowCount>0){
   out.println("<font style=' color: #990000'> Użytkownik o podanym loginie juz istnieje.<br/> <a href='rejestracja.jsp'>Wróc do rejestracji</a></font>");
}

else{
stmt.executeUpdate("INSERT INTO klient(login,haslo,imie,nazwisko,miasto,email) VALUES ('"+login+"','"+haslo+"','"+imie+"','"+nazwisko+"','"+miejscowosc+"','"+email+"')");    

 out.println("<font style=' color: #990000'> Rejestracja została pomyślnie zakończona.<br/> <a href='index.html'>Przejdz do logowania</a></font>");
}

 stmt.close();
%>
    </body>
</html>