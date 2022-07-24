package AdminServlet.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AdminServlet.DAO.AccountDAO;
import AdminServlet.Model.Account;

/**
 * Servlet implementation class SearchAccountController
 */
@WebServlet("/SearchAccountController")
public class SearchAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
    public SearchAccountController() {
        super();
         
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword3=request.getParameter("keyword");
		if(keyword3==null) {
			keyword3="";
		}
		AccountDAO  accountDAO = new AccountDAO();
		List<Account> account = accountDAO.Search(keyword3);
		request.setAttribute("listAccount", account);
		request.setAttribute("keyword1", keyword3);
		RequestDispatcher requestDispatcher =request.getRequestDispatcher("Admin/list-account.jsp");
		requestDispatcher.forward(request, response);
	}

	 
}
