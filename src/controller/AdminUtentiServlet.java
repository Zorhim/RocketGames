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
@WebServlet("/AdminUtenti")
public class AdminUtentiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UtenteDAO utenteDAO = new UtenteDAO();


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MyServletException.checkAdmin(request);


        String address;
        UtenteDAO utenteDAO = new UtenteDAO();
        List<Utente> utenti = utenteDAO.doRetrieveAll(0, 10);

        //Controlla se la richiesta è una rimozione, una modifica o semplicemente l'apertura della lista utenti
        if(request.getParameter("rimuovi") != null)
        {
            String idstr = request.getParameter("id");
            utenteDAO.doDelete(Integer.parseInt(idstr));
            request.setAttribute("notifica", "Utente rimosso con successo.");
            address="./";
        }
        else if (request.getParameter("modifica") != null)
        {
            String idstr = request.getParameter("id");
            Utente utente = utenteDAO.doRetrieveById(Integer.parseInt(idstr));
            address="view/adminutente.jsp";
            request.setAttribute("utente", utente);
        }
        else
        {
            request.setAttribute("utenti", utenti);
            address="view/adminutenti.jsp";
        }


        RequestDispatcher requestDispatcher = request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
