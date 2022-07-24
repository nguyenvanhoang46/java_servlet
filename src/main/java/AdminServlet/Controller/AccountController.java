package AdminServlet.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AdminServlet.DAO.AccountDAO;
import AdminServlet.Model.Account;

 
 
@WebServlet("/AccountCTL") 
public class AccountController extends HttpServlet {
	private AccountDAO accountDAO;

	public AccountController() {
        super();
         
    }
	
    public void init() {
    	accountDAO = new AccountDAO();
    }

  
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			action=""; 
		}
		try {
			switch (action) {  
			case "insertAccount":
				insertAccount(request, response);
                break;
            case "editAccount":
                showEditForm(request, response);
                break;
            case "updateAccount":
            	updateAccount(request, response);;
                break;
            case "deleteAccount":
                deleteAccount(request, response);
                break;
            default:
                listAccount(request, response);
                break; 
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

    private void listAccount(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
    	int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		
        List<Account> listAccount = accountDAO.viewAccount((page - 1) * recordsPerPage, recordsPerPage);
        
        int noOfRecords = accountDAO.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		request.setAttribute("listAccount", listAccount);
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/list-account.jsp");
        dispatcher.forward(request, response);
    } 

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {  
        
        int id = Integer.parseInt(request.getParameter("id"));
        Account existingUser = accountDAO.selectAccount(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/account-form.jsp");
        request.setAttribute("account", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertAccount(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email"); 
        int isSell = Integer.parseInt(request.getParameter("isSell"));
        int isAdmin = Integer.parseInt(request.getParameter("isAdmin"));
        Account newUser = new Account(username,password ,email,isSell, isAdmin);
        accountDAO.insertAccount(newUser);
        response.sendRedirect("/javaservlet/AccountCTL");
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email"); 
        int isSell = Integer.parseInt(request.getParameter("isSell"));
        int isAdmin = Integer.parseInt(request.getParameter("isAdmin"));
        
        Account book = new Account(id, username,password ,email, isSell, isAdmin);
        accountDAO.updateAccount(book);
        response.sendRedirect("/javaservlet/AccountCTL");
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        accountDAO.deleteAccount(id);
        response.sendRedirect("/javaservlet/AccountCTL");

    }
}
