package myBean;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterDAO {
	//properties for the database connection
	java.sql.Connection connection = null;
	java.sql.Statement statement = null;
	java.sql.ResultSet resultSet = null;
	
	//no-arg constructor
	public RegisterDAO() {

	}

	
	//the add User method will insert new users into the database.
	public String addUser(User newUser) throws SQLException,ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayTest";
		String dbUser = "root";
		String dbPassword = "theAlphaBlack23@";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String result = "New Account created! User registered.";
		try{  
		String sql = "INSERT INTO users (firstName, lastName, email, password, telephoneNumber) VALUES (?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);  
		statement.setString(1,newUser.getFirstName());  
		statement.setString(2,newUser.getLastName());  
		statement.setString(3,newUser.getEmail()); 
		statement.setString(4,newUser.getPassword()); 
		statement.setString(5,newUser.getTelephoneNumber()); 
		statement.executeUpdate();  	
		
		}catch(Exception e){
			result = "Unable to create account! User not registered.";
			System.out.println(newUser.getFirstName());
			System.out.println(newUser.getLastName());
			System.out.println(newUser.getEmail());
			System.out.println(newUser.getPassword());
			System.out.println(newUser.getTelephoneNumber());
			e.printStackTrace();
		}  		      
		return result;  
	}  
}