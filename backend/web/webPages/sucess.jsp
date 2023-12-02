<%-- 
    Document   : sucess
    Created on : Dec 2, 2023, 11:20:09 AM
    Author     : Adrian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sucesso Login</title>
    </head>
    <body>
        <h1>Sucesso Login</h1>
        <p>cpf: <%= session.getAttribute("cpf")%></p>        
        <p>nome_completo <%= session.getAttribute("nome_completo")%></p>
        <p>email <%= session.getAttribute("email")%></p>
        <p>endereco <%= session.getAttribute("endereco")%></p>
        <p>cep <%= session.getAttribute("cep")%></p>
        <p>telefone <%= session.getAttribute("telefone")%></p>
       


    </body>
</html>
