<%-- 
    Document   : login
    Created on : Nov 27, 2023, 9:44:06 AM
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Google</title>
    <link rel="stylesheet" href="./styles/login.css">
</head>
<body>
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
<div class="login-container">
        <div class="logo">
            <img src="./images/vacinaicon.png" alt="VacinaKids" width="50" height="50">
        </div>
        <div class="login-form">
            <h2>Faça o Login para Acessar seu Registro de Vacinação</h2>
            <form>
                <input type="text" id="cpf-input" placeholder="Digite seu CPF">
    			<script>
        			const cpfInput = document.getElementById('cpf-input');
        
        			cpfInput.addEventListener('input', function (e) {
            			let value = e.target.value;
            
            			// Remove qualquer caractere que nÃ£o seja nÃºmero
            			value = value.replace(/\D/g, '');
            
            			// Adiciona os pontos e hÃ­fen na formataÃ§Ã£o do CPF
            			if (value.length <= 11) {
                			value = value.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
            			}
            
            			e.target.value = value;
        			});
    			</script>			
                <input type="password" placeholder="Password">
                <button type="submit"><a href="#">Login</a></button>
				
          </form>

            <p>Esqueceu sua Senha? | <a href="cadastro_de_usuario.jsp">Crie uma Conta</a></p>
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