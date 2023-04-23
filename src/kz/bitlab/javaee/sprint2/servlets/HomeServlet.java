package kz.bitlab.javaee.sprint2.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.javaee.sprint2.db.DBManager;
import kz.bitlab.javaee.sprint2.model.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    public void  doGet(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException, ServletException {
        ArrayList<Item> items = DBManager.getItems();
        request.setAttribute("products", items);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}