package com.ssafy.edu.dto;

public class UserInfoDto {
	private String id;
	private String password;
	private String name;
	private String address;
	private String tel;
	
	public UserInfoDto() { }
	

	public UserInfoDto(String id, String password, String name, String address, String tel) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.tel = tel;
	}


	@Override
	public String toString() {
		return "UserDto [u_Id=" + id + ", u_Password=" + password + ", u_Name=" + name + ", u_Address="
				+ address + ", u_Tel=" + tel + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
