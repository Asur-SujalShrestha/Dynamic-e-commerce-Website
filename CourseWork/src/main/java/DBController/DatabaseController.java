package DBController;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.Utils.Hashing;
import Model.Users;

public class DatabaseController {
	public Connection databaseConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String db_url = "jdbc:mysql://localhost:3306/coursework";
		String db_user = "root";
		String db_pass = "";
		return DriverManager.getConnection(db_url, db_user, db_pass);
	}
	
	public int addUser(Users user) {
		try {
			Connection con = databaseConnection();
			String query = "insert into users(userName, firstName, lastName, birthday, gender, email, address, phone, password) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, user.getUserName());
			statement.setString(2, user.getFirstName());
			statement.setString(3, user.getLastName());
			statement.setDate(4, Date.valueOf(user.getBirthday()));
			statement.setString(5, user.getGender());
			statement.setString(6, user.getEmail());
			statement.setString(7, user.getAddress());
			statement.setString(8, user.getPhone());
			statement.setString(9, user.getPassword());
			
			int result = statement.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public ResultSet checkEmail(String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		ResultSet row = statement.executeQuery();
		return row;
	}
	
	public ResultSet checkPhone(String phone) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where phone = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, phone);
		ResultSet row = statement.executeQuery();
		return row;
	}
	
	public ResultSet getUser(String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		ResultSet row = statement.executeQuery();
		return row;	
	}
	
	public int updateData(Users user) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "update users set userName = ?, firstName = ?, lastName = ?, birthday = ?, phone = ?, address = ? where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, user.getUserName());
		statement.setString(2, user.getFirstName());
		statement.setString(3, user.getLastName());
		statement.setDate(4, Date.valueOf(user.getBirthday()));
		statement.setString(5, user.getPhone());
		statement.setString(6, user.getAddress());
		statement.setString(7, user.getEmail());
		int count = statement.executeUpdate();
		return count;
		
	}
	
	public int updatePassword(String password, String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "update users set password = ? where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, password);
		statement.setString(2, email);
		int count = statement.executeUpdate();
		return count;
	}
	
	public int checkPassword(String email, String password) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select password from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		String databasePassword = null;
		ResultSet row = statement.executeQuery();
		Hashing hashed = new Hashing();
		int count = 0;
		if(row.next()) {
			databasePassword = row.getString("password");
		}
		
		if(databasePassword != null && hashed.matchedPassword(password, databasePassword)) {
			count = 1;
		}
		else {
			count = 0;
		}
		return count;
		}
		
}
