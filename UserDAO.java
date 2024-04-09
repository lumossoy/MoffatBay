package myBean;

import java.sql.*;

public class UserDAO {
	//properties for the database connection
	java.sql.Connection connection = null;
	java.sql.Statement statement = null;
	java.sql.ResultSet resultSet = null;
	
	//no-arg constructor
	public UserDAO() {

	}
	
	//the check login method will check the login information the users has entered using the database data to validate it.
	public User checkLogin(String email, String password) throws SQLException,ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
		String dbUser = "root";
		String dbPassword = "theAlphaBlack23@";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		//sql query to locate users bases on email and password
		String sql = "SELECT * FROM users WHERE email = ? and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, password);
		ResultSet result = statement.executeQuery();

		//creates a null user object
		User user = null;

		//assigns the user object information to the database info
		if (result.next()) {
		    user = new User();
		    user.setFirstName(result.getString("firstName"));
		    user.setEmail(email);
		}
		
		connection.close();

		return user;
	}

}
