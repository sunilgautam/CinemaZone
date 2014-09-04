package test;

public class data {
	private String username;
	private String address;
	public data() {
		this.username = "SUNIL";
		this.address = "TATA";
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Override
	public String toString() {
		return username + " : " + address;
	}
}
