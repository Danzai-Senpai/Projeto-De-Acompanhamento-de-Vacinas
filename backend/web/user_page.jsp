<%-- 
    Document   : user_page
    Created on : Nov 11, 2023, 2:14:04 PM
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
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Profile Page</title>
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    />
    <!-- CSS -->
    <link rel="stylesheet" href="./styles/parentProfile.css" />
  </head>
  <body>
    <div class="header__wrapper">
      <header></header>
      <div class="cols__container">
        <div class="left__col">
          <div class="img__container">
            <img src="./images/woman.png" alt="Anna Smith" />
            <span></span>
          </div>
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
                st = conecta.prepareStatement("SELECT * FROM usuarios ORDER BY id DESC LIMIT 1");
                ResultSet rs = st.executeQuery();

                if (rs.next()) {
                %>
                    
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
        </div>
        <div class="right__col">
          <nav>
            <ul>
              <li><a href="">crianças</a></li>
              <li><a href="">noticias</a></li>
              <li><a href="">contato</a></li>
            </ul>
          </nav>


		  
        </div>
      </div>
    </div>
  </body>
</html>

