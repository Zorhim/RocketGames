package controller;

import model.Utente;
import model.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/ModificaUtente")
public class ModificaUtenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UtenteDAO utenteDAO = new UtenteDAO();


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String address;
        UtenteDAO utenteDAO = new UtenteDAO();
        List<Utente> utenti = utenteDAO.doRetrieveAll(0, 10);
            String idstr = request.getParameter("id");
            Utente utente = utenteDAO.doRetrieveById(Integer.parseInt(idstr));
            address="view/adminutente.jsp";
            request.setAttribute("utente", utente);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
