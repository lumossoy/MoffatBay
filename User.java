package myBean;

public class User {
	//attributes
	private int userID;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String telehphoneNumber;
	
	//no-arg constructor
	public User() {

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
	public String getTelehphoneNumber() {
		return telehphoneNumber;
	}
	public void setTelehphoneNumber(String telehphoneNumber) {
		this.telehphoneNumber = telehphoneNumber;
	}
	
	
	
	
	

}
