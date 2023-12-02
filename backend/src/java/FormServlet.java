/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Adrian
 */
@WebServlet(urlPatterns = {"/FormServlet"})
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String senha = request.getParameter("senha");
        String cpf = request.getParameter("cpf");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        if (senha != null && cpf != null && senha.equals("123") && cpf.equals("123")) {
            HttpSession hs= request.getSession();
            hs.setAttribute("cpf", cpf);
            hs.setAttribute("senha", senha);

            response.sendRedirect("webPages/sucess.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/webPages/login.jsp?mensagem=SenhaEmailIncorretos");
        }
    }
}

