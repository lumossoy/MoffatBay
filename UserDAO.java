 // Green Team: Juan Taylor, Christopher Kaiser, Emely Pajarito, Estiven Hernandez
 // Purpose: Data Access Object for adding a user into the database
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
		boolean login;
		String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
		String dbUser = "root";
		String dbPassword = "theAlphaBlack23@";

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		//sql query to locate users bases on email and password
		String sql = "SELECT * FROM users WHERE email = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		ResultSet result = statement.executeQuery();

		//creates a null user object
		User user = null;

		//assigns the user object information to the database info
		while (result.next()) {
			login = User.checkPassword(password, result.getString("password"));
			if (login) {
				user = new User();
			    user.setUserID((int) result.getLong("UserID"));
			    user.setFirstName(result.getString("firstName"));
			    user.setEmail(result.getString("email"));
				
			} else {
				login = false;
				user = null;
				break;
			}  
		}
		connection.close();
		return user;
	}

}
