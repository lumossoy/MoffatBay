 // Green Team: Juan Taylor, Christopher Kaiser, Emely Pajarito, Estiven Hernandez
 // Purpose: Object to store all information relative to a user
package myBean;
import BCrypt.BCrypt;

public class User {
	//attributes
	private int userID;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String telephoneNumber;
	
	//no-arg constructor
	public User() {
		super();
	}
	
	//args constructor
	public User(String firstName, String lastName, String email, String password, String telephoneNumber) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.telephoneNumber = telephoneNumber;
	}
	
	//getters and setters
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}
	
	public static String encryptPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(10));
    }
	
	public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }
}
