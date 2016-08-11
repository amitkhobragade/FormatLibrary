package beans;

import java.sql.*;

public class users 
{  private int id;
   private int approved;
   private String first_name;
   private String last_name;
   private String email;
   private String password;
   private String company;
   private String address;
   private String country;
   private Timestamp created_on;
   private UploadedFileInfo uploadedFileInfo;
	/*public users(String first_name, String last_name, String email, String password, String company, String address,
			String country) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
		this.company = company;
		this.address = address;
		this.country = country;
	}*/

	public String getFirst_name() {
		return first_name;
	}

	public UploadedFileInfo getUploadedFileInfo() {
		return uploadedFileInfo;
	}

	public void setUploadedFileInfo(UploadedFileInfo uploadedFileInfo) {
		this.uploadedFileInfo = uploadedFileInfo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getApproved() {
		return approved;
	}

	public void setApproved(int approved) {
		this.approved = approved;
	}

	public Timestamp getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Timestamp created_on) {
		this.created_on = created_on;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
	
}
