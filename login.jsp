<%-- 
    Document   : login
    Created on : 2015-12-30, 23:53:47
    Author     : iza
--%>


<%@ page language="java" import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <body text="#5f5f5f"  link="#999999" vlink="#999999" alink="#999999">
        
<%
   
    String login = request.getParameter("login");
    String haslo = request.getParameter("haslo");

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
 
    rs = stmt.executeQuery("select * from klient where login='" + login + "' and haslo='" + haslo + "'");
    if (rs.next()) {
        session.setAttribute("login", login);
        session.setAttribute("haslo", password);
        response.sendRedirect("strona.html");
    } else {
        out.println ("Błąd!<br/>"); 
        out.println(" <font style='color:red'> Hasło </font>lub <font style='color:red'>login</font> został wprowadzony niepoprawnie, <a href='index.html'>Sprubuj ponownie</a>, lub skorzystaj z darmowej <a href='rejestracja.jsp'>rejestracji</a> online jesli nie posiadasz konta ");
    }
       
%>
        
    </body></html>