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

    String nome_completo = request.getParameter("nome_completo");
    String dataNascimento = request.getParameter("data_nascimento");
    String email = request.getParameter("email");
    String endereco = request.getParameter("endereco");
    String cep = request.getParameter("cep");
    String cpf = request.getParameter("cpf");
    String telefone = request.getParameter("telefone");
    String senha = request.getParameter("senha");
    
    // Novo campo adicionado
    String estadoFamiliar = request.getParameter("estado_familiar");

    st = conecta.prepareStatement("INSERT INTO usuarios (id, nome_completo, email, endereco, cep, cpf, telefone, senha, estado_familiar, data_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    st.setInt(1, newId);
    st.setString(2, nome_completo);
    st.setString(3, email);
    st.setString(4, endereco);
    st.setString(5, cep);
    st.setString(6, cpf);
    st.setString(7, telefone);
    st.setString(8, senha);
    st.setString(9, estadoFamiliar); // Adicione o estado_familiar ao PreparedStatement
    
    // Correção: use setDate para coluna do tipo DATE
    java.sql.Date sqlDate = java.sql.Date.valueOf(dataNascimento);
    st.setDate(10, sqlDate);

    // Verifica se o cadastro foi bem-sucedido
    int rowsAffected = st.executeUpdate();
    if (rowsAffected > 0) {
        // Cadastro bem-sucedido, redireciona para a página de login
        String loginPage = "webPages/login.jsp";
        response.sendRedirect(loginPage);
    } else {
        // Algo deu errado no cadastro, pode adicionar tratamento de erro aqui
        out.print("Falha no cadastro do usuário");
    }
%>
</body>
</html>
