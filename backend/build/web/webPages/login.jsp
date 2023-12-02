<%-- 
    Document   : login
    Created on : Dec 2, 2023, 10:45:09 AM
    Author     : Adrian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Google</title>
    <link rel="stylesheet" href="../styles/login.css">
</head>
<body>
<div class="login-container">
        <div class="logo">
            <img src="../images/vacinaicon.png" alt="VacinaKids" width="50" height="50">
        </div>
        <div class="login-form">

            <h2>Faça o Login para Acessar seu Registro de Vacinação</h2>

            <form action="../FormServlet" method="post">

                <input type="text" id="cpf-input" placeholder="Digite seu CPF" name="cpf">

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
				
                      
                <input type="password" placeholder="Password" name="senha">
                <button type="submit">Login</button>
<!--                <a href = "parentProfile.html">Login</a>-->
			
            </form>

            <p>Esqueceu sua Senha? | <a href="signup.html">Crie uma Conta</a></p>
 <% 
        String mensagem = request.getParameter("mensagem");
        if ("SenhaEmailIncorretos".equals(mensagem)) {
            out.println("<p><strong>Seu CPF ou senha estão incorretos!</strong></p>");
        }
%>
        </div>
    </div>
</body>
</html>
