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
        <title>JSP Page</title>
    </head>
    <body>
<!--        Recebe os dados do Banco de Dados-->
        <%
            Logger logger = Logger.getLogger("MyJSP");

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

            
            // Obtém informações de conexão do arquivo .env
            String dbUrl = envVars.get("DB_URL");
            String dbUser = envVars.get("DB_USER");
            String dbPassword = envVars.get("DB_PASSWORD");
            
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection(dbUrl + "?useUnicode=true&characterEncoding=UTF-8", dbUser, dbPassword);
            
            int maxId = 0;
            try (PreparedStatement getMaxIdStatement = conecta.prepareStatement("SELECT MAX(id) FROM usuarios");
                 ResultSet resultSet = getMaxIdStatement.executeQuery()) {

                if (resultSet.next()) {
                    maxId = resultSet.getInt(1);
                }
            } catch (SQLException e) {
                logger.severe("Error getting max ID from usuarios table: " + e.getMessage());
                e.printStackTrace();
            }
            
            int newId = maxId + 1;

            
//            int id;
            String nome_completo;
            String email;
            String endereco;
            String cep;
            String cpf;
            String telefone;
            String senha;
            
//            id = Integer.parseInt(request.getParameter("id"));
            nome_completo = request.getParameter("nome_completo");
            email = request.getParameter("email");
            endereco = request.getParameter("endereco");
            cep = request.getParameter("cep");
            cpf = request.getParameter("cpf");
            telefone = request.getParameter("telefone");
            senha = request.getParameter("senha");
            
            
            st = conecta.prepareStatement("INSERT INTO usuarios VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
            st.setInt(1, newId);
            st.setString(2, nome_completo);
            st.setString(3, email);
            st.setString(4, endereco);
            st.setString(5, cep);
            st.setString(6, cpf);
            st.setString(7, telefone);
            st.setString(8, senha);
            
            st.executeUpdate();
            out.print("usuario cadastrado");
            
            String successPage = "user_page.jsp";
        %>
        
        <h1>Hello World!</h1>
        <p>DB URL: <%= dbUrl %></p>
        <p>DB User: <%= dbUser %></p>
        <p>DB Password: <%= dbPassword %></p>
        <jsp:forward page="<%= successPage %>"/>

    </body>
</html>

