package kz.bitlab.javaee.sprint2.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kz.bitlab.javaee.sprint2.db.DBManager;
import kz.bitlab.javaee.sprint2.model.User;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    public void  doGet(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException, ServletException {
        request.getRequestDispatcher("/login_page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = DBManager.getUser(email);

        System.out.println(user);

        System.out.println(email + " and " + password);

        if(user!=null && user.getPassword().equals(password)){
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);
            resp.sendRedirect("/profile");
        }else{
            resp.sendRedirect("/login?error");
        }
    }
}
