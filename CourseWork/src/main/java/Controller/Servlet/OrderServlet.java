package Controller.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBController.DatabaseController;
import Model.CartItems;
import Model.product;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/OrderServlet" })
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userID");
		HttpSession userSession = request.getSession();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userID")) id = cookie.getValue();	
			}
		}

		String cartTotal = request.getParameter("cartTotal");
		/*
		 * ArrayList<CartItems> productList = (ArrayList<CartItems>)
		 * request.getAttribute("cart_items");
		 */
		ArrayList<CartItems> cart_items = (ArrayList<CartItems>) userSession.getAttribute("cart_items");
		DatabaseController controller = new DatabaseController();
		ArrayList<CartItems> productList = controller.getCartProducts(cart_items);
		/*
		 * try { int result = controller.orderProduct(id, productList, cartTotal);
		 * if(result > 0) { response.sendRedirect("/CourseWork/Htmls/BuyNow.jsp"); }
		 * else { String errormessage = "Order Unsuccessfull";
		 * request.setAttribute("errorMessage", errormessage);
		 * request.getRequestDispatcher("/Htmls/Cart.jsp").forward(request, response); }
		 * } catch (ClassNotFoundException | SQLException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); }
		 */
		int productID = 0;
		double lineTotal = 0;
		LocalDate today = LocalDate.now();
		String orderStatus = "Pending";
		int orderedQuantity = 0;
		int result = 0;


		Connection con;
		String DB_orderID = null;

		try {
			con = controller.databaseConnection();
			con.setAutoCommit(false);
			String query = "insert into orders(orderDate, orderTotal, orderStatus, userId) values(?,?,?,?);";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setDate(1, Date.valueOf(today));
			statement.setString(2, cartTotal);
			statement.setString(3, orderStatus);
			statement.setString(4, id);
			result = statement.executeUpdate();
			con.setAutoCommit(true);

			for(CartItems orderItem: productList) {
				productID = orderItem.getProductId();
				lineTotal = orderItem.getPrice();
				orderedQuantity = orderItem.getQuantity();

				String orderID = "SELECT * from orders where userId = ? order by orderId desc limit 1";
				PreparedStatement orderStatement = con.prepareStatement(orderID);
				orderStatement.setString(1, id);
				ResultSet row = orderStatement.executeQuery();
				if(row.next()) {
					DB_orderID = row.getString("orderId");
					System.out.println("Retrieved orderId: " + DB_orderID);
				}
				else {
					DB_orderID = "0";
				}

				String cartItemsQuery = "INSERT INTO cart_items (productId, quantity, lineTotal, orderId) VALUES (?, ?, ?, ?)";
				PreparedStatement cartItemsStatement = con.prepareStatement(cartItemsQuery);
				cartItemsStatement.setInt(1, productID);
				cartItemsStatement.setInt(2, orderedQuantity);
				cartItemsStatement.setDouble(3, lineTotal);
				cartItemsStatement.setString(4, DB_orderID);
				int cartItemsResult = cartItemsStatement.executeUpdate();
				con.setAutoCommit(true);

			}} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}



		if(result > 0) {
			cart_items.clear();
			response.sendRedirect("/CourseWork/Htmls/BuyNow.jsp"); 
		}
		else { String errormessage = "Order Unsuccessfull";
		request.setAttribute("errorMessage", errormessage);
		request.getRequestDispatcher("/Htmls/Cart.jsp").forward(request, response); }


	}

}
