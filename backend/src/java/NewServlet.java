import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

        } catch (IOException e) {
            logger.severe("Error reading .env file: " + e.getMessage());
        }

        String dbUrl = envVars.get("DB_URL");
        String dbUser = envVars.get("DB_USER");
        String dbPassword = envVars.get("DB_PASSWORD");

        try (PrintWriter out = response.getWriter();
             Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {

            String nome_crianca = request.getParameter("nome_crianca");
            String cpf_crianca = request.getParameter("cpf_crianca");
            String id_paiString = request.getParameter("id_pai");
            String data_nascimento_crianca = request.getParameter("data_nascimento_crianca");

            String insertCriancaQuery = "INSERT INTO crianca (cpf_crianca, nome_crianca, data_nascimento) VALUES (?, ?, ?)";
            String insertRelacaoQuery = "INSERT INTO relacao (id_usuario) VALUES (?)";

            try (PreparedStatement stCrianca = connection.prepareStatement(insertCriancaQuery);
                 PreparedStatement stRelacao = connection.prepareStatement(insertRelacaoQuery)) {

                // Setar parâmetros para o PreparedStatement stCrianca
                stCrianca.setString(1, cpf_crianca);
                stCrianca.setString(2, nome_crianca);
//                stCrianca.setString(3, id_pai);
                stCrianca.setString(3, data_nascimento_crianca);

                // Executar a consulta de inserção na tabela crianca
                stCrianca.executeUpdate();

                int id_pai = Integer.parseInt(id_paiString);

//              stRelacao.setString(1, "valor_id_relacao");  // Substitua "valor_id_relacao" pelo valor correto
//              stRelacao.setString(2, "valor_id_usuario");  // Substitua "valor_id_usuario" pelo valor correto
                stRelacao.setInt(1, id_pai);
                stRelacao.executeUpdate();

            }
        } catch (SQLException e) {
            logger.severe("Database error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

