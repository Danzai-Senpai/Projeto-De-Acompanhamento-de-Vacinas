<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.logging.Logger" %>

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

    Connection conecta = null;
    PreparedStatement st = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection(dbUrl + "?useUnicode=true&characterEncoding=UTF-8", dbUser, dbPassword);

        int maxId = 0;

        try (PreparedStatement getMaxIdStatement = conecta.prepareStatement("SELECT MAX(id) FROM usuarios");
             ResultSet resultSet = getMaxIdStatement.executeQuery()) {

            if (resultSet.next()) {
                maxId = resultSet.getInt(1);
            }
        }

        int newId = maxId + 1;

        String nomeCompleto = request.getParameter("nome_completo");
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        String cep = request.getParameter("cep");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String senha = request.getParameter("senha");

        st = conecta.prepareStatement("INSERT INTO usuarios VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        st.setInt(1, newId);
        st.setString(2, nomeCompleto);
        st.setString(3, email);
        st.setString(4, endereco);
        st.setString(5, cep);
        st.setString(6, cpf);
        st.setString(7, telefone);
        st.setString(8, senha);

        st.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Cadastro Realizado com Sucesso!</h1>

    <h2>Dados do Usuário:</h2>
    <p>ID: <%= newId %></p>
    <p>Nome: <%= nomeCompleto %></p>
    <p>Email: <%= email %></p>
    <p>Endereço: <%= endereco %></p>
    <p>CEP: <%= cep %></p>
    <p>CPF: <%= cpf %></p>
    <p>Telefone: <%= telefone %></p>
    <p>Senha: <%= senha %></p>
    <!-- Adicione qualquer outro conteúdo que você queira exibir após o cadastro -->
</body>
</html>
<%
    } catch (ClassNotFoundException | SQLException e) {
        logger.severe("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        // Feche os recursos adequadamente
        try {
            if (st != null) {
                st.close();
            }
            if (conecta != null) {
                conecta.close();
            }
        } catch (SQLException e) {
            logger.severe("Error closing resources: " + e.getMessage());
            e.printStackTrace();
        }
    }
%>