package Controller.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBController.DatabaseController;

/**
 * Servlet implementation class UpdateOrderStatusServlet
 */
@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		String orderStatus = request.getParameter("orderStatus");
		int result = dbController.updateStatus(orderId, orderStatus);
		if (result == 1) {
	        request.setAttribute("successMessage", "order status updated successfully");
	        request.getRequestDispatcher("/Htmls/AdminDashboard.jsp").forward(request, response);
	        return;
	    } else if (result == 0) {
	    	request.setAttribute("errorMessage", "Operation unsuccessful.");
	    	request.getRequestDispatcher("/Htmls/UpdateOrderStatus.jsp").forward(request, response);
	        return;
	    } else {
	    	request.setAttribute("serverError", "An unexpected server error occurred.");
	    	request.getRequestDispatcher("/Htmls/UpdateOrderStatus.jsp").forward(request, response);
	        return;
	}
		
		
	}
	

}