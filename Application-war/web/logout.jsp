<%-- 
    Document   : logout
    Created on : 2016-01-20, 11:05:57
    Author     : iza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // wylogowanie uzytkownika z sesji i przekierowanie na strone główną
session.setAttribute("logi", null);
session.invalidate();
response.sendRedirect("index.html");
%>