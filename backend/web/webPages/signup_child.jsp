<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Minha Aplicação</title>
    <link rel="stylesheet" href="../styles/signup.css"> <!-- Inclua a folha de estilo CSS -->
</head>
<body>
    <div class="signup-container">
        <div class="logo">
            <img src="../images/vacinaicon.png" alt="Logo da Aplicação" width="50" height="51">
        </div>
        <div class="signup-form">
            <h2>Crie sua Conta</h2>
            <form method="post" action="../NewServlet">
                
                <script>
                    const cpfInput = document.getElementById('cpf');
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
                
                
<!--                 Armanzena o ID do Pai-->
                <%
                    String idPai = request.getParameter("id");
                %>

                <input name="id_pai" value=" <%= idPai %>" hidden>
                <input type="text" required placeholder="Nome da Criança" name="nome_crianca" id="nome_crianca" size="255" maxlength="255">
                <div class="flex-container">
                    <label for="data_nascimento_crianca">Data de Nascimento da Criança:</label>
                    <input type="date" required name="data_nascimento_crianca" id="data_nascimento_crianca">
                </div>
                <input type="text" required placeholder="CPF da Criança" name="cpf_crianca" id="cpf_input" size="14" maxlength="14">
                <script>
                    const cpfCriancaInput = document.getElementById('cpf_crianca');
                    cpfCriancaInput.addEventListener('input', function (e) {
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

                <button type="submit">Cadastrar Criança</button>
            </form>
        </div>
    </div>
</body>
</html>
