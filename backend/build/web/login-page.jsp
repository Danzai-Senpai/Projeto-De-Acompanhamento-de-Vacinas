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
%>
<div class="login-container">
    <div class="logo">
        <img src="./images/vacinaicon.png" alt="VacinaKids" width="50" height="50">
    </div>
    <div class="login-form">
        <h2>Faça o Login para Acessar seu Registro de Vacinação</h2>
        <form action="">
            <input type="text" id="cpf" name="cpf" placeholder="Digite seu CPF">
            <script>
                const cpfInput = document.getElementById('cpf-input');

                cpfInput.addEventListener('input', function (e) {
                    let value = e.target.value;

                    // Remove qualquer caractere que não seja número
                    value = value.replace(/\D/g, '');

                    // Adiciona os pontos e hífen na formatação do CPF
                    if (value.length <= 11) {
                        value = value.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
                    }

                    e.target.value = value;
                });
            </script>
            <input type="password" placeholder="Password" id="senha" name="senha">
            <button type="submit"><a href="#">Login</a></button>

        </form>

        <p>Esqueceu sua Senha? | <a href="cadastro_de_usuario.jsp">Crie uma Conta</a></p>
    </div>
</div>
<%
    try {
    out.println("Usuário autenticado!");
    Connection conecta;
    PreparedStatement st;
    Class.forName("com.mysql.cj.jdbc.Driver");
    conecta = DriverManager.getConnection(dbUrl + "?useUnicode=true&characterEncoding=UTF-8", dbUser, dbPassword);
    st = conecta.prepareStatement("SELECT * FROM usuarios WHERE senha = ? AND cpf = ?");

    String cpf = request.getParameter("cpf-input");
    String senha = request.getParameter("password");

    st.setString(1, senha);
    st.setString(2, cpf);

    ResultSet resultSet = st.executeQuery();

    if (resultSet.next()) {
        // Para depuração, imprima informações no console
        out.println("Nome: " + resultSet.getString("nome_completo"));
        out.print("CPF " + resultSet.getString("cpf"));
        // Adicione mais campos conforme necessário

        // Usuário autenticado, redirecione para a página desejada
        // response.sendRedirect("parentProfile.html");
}
} catch (SQLException e) {
    out.println("Usuário autenticado!");
    logger.severe("Error executing SQL query: " + e.getMessage());
    e.printStackTrace();
}
%>

</body>
</html>
