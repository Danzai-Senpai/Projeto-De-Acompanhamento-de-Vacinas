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
        <p>senha: <%= session.getAttribute("senha")%></p>
          <%  
            // Obtém informações de conexão do arquivo .env
            Logger logger = Logger.getLogger("USER PAGE");
            String filePath = getServletContext().getRealPath("/") + ".env";
            Map<String, String> envVars = new HashMap<>();

            try (InputStream inputStream = new FileInputStream(filePath);
                BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {

               String line;
               while ((line = reader.readLine()) != null) {
                   String[] parts = line.split("=");
                   if (parts.length == 2) {
                       envVars.put(parts[0].trim(), parts[1].trim());
                   }
            }
            
            } catch (FileNotFoundException e) {
                logger.severe("Error: .env file not found.");
                e.printStackTrace();
            } catch (IOException e) {
                logger.severe("Error reading .env file: " + e.getMessage());
                e.printStackTrace();
            }
            
            String dbUrl = envVars.get("DB_URL");
            String dbUser = envVars.get("DB_USER");
            String dbPassword = envVars.get("DB_PASSWORD");
            
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection(dbUrl + "?useUnicode=true&characterEncoding=UTF-8", dbUser, dbPassword);
                String cpf = request.getParameter("cpf");
                String senha = request.getParameter("senha");
                st = conecta.prepareStatement("SELECT * FROM usuarios WHERE cpf = ? AND senha = ?");
                st.setString(1, cpf);
                st.setString(2, senha);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                %>
                    
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>
<!-- Add more fields as needed -->
                    <h2><%= rs.getString("nome_completo") %></h2>
<!--                    <p>32 anos</p>-->

                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                    <div class="content">
<!--                      <p>
                        Mãe de Enzo, de 3 anos, e de Maria de 8 meses.
                        Enzo nasceu com uma condição rara que pode influenciar se deve tomar uma vacina ou não.
                        (Resumo sobre a mãe e seus filhos)
                      </p>-->
                    <div class="userData">
                        <label>Email:</label>
                        <p><%= rs.getString("email") %></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>Endereço:</label>
                        <p><%= rs.getString("endereco") %></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>CEP:</label>
                        <p><%= rs.getString("cep") %></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>CPF:</label>
                        <p><%= rs.getString("cpf") %></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>Telefone:</label>
                        <p><%= rs.getString("telefone") %></p>
                    </div>
                   




                    </div>
                        
                <%
                }
               
                } catch (Exception e) {
                    out.print("Mensagem de erro:" + e.getMessage());
                }
            
           
       
      %>

    </body>
</html>
