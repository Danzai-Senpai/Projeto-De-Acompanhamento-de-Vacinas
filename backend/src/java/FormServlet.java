import java.io.*;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/FormServlet"})
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String senha = request.getParameter("senha");
        String cpf = request.getParameter("cpf");
//        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        if (senha != null && cpf != null && senha.equals("123") && cpf.equals("123")) {
           

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
            } catch (IOException e) {
                logger.severe("Error reading .env file: " + e.getMessage());
            }

            String dbUrl = envVars.get("DB_URL");
            String dbUser = envVars.get("DB_USER");
            String dbPassword = envVars.get("DB_PASSWORD");

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection(dbUrl + "?useUnicode=true&characterEncoding=UTF-8", dbUser, dbPassword);
                st = conecta.prepareStatement("SELECT * FROM usuarios WHERE cpf = ? AND senha = ?");
                st.setString(1, cpf);
                st.setString(2, senha);
                ResultSet rs = st.executeQuery();
                String nome_completo = rs.getString("nome_completo");
                String email = rs.getString("email");
                String endereco = rs.getString("endereco");
                String cep = rs.getString("cep");
                String cpfTrue = rs.getString("cpf");
                String telefone = rs.getString("telefone");
                HttpSession hs = request.getSession();
                hs.setAttribute("cpf", cpf);
                hs.setAttribute("senha", senha);
                hs.setAttribute("nome_completo", nome_completo);
                hs.setAttribute("email", email);
                hs.setAttribute("endereco", endereco);
                hs.setAttribute("cep", cep);
                hs.setAttribute("cpfTrue", cpfTrue);
                hs.setAttribute("telefone", telefone);
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                
                System.out.println("AAAAAAASD");
                System.out.println(telefone);




                                


                // Processar o ResultSet conforme necessário
                while (rs.next()) {
                    // Implemente a lógica de processamento aqui
                }

                // Fecha a conexão e recursos
//                rs.close();
//                st.close();
//                conecta.close();
                response.sendRedirect("webPages/sucess.jsp");


            } catch (Exception e) {
                logger.severe("Database error: " + e.getMessage());
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/webPages/login.jsp?mensagem=SenhaEmailIncorretos");
        }

    }
}