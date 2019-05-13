package com.ssafy.edu.dto;

public class UserDto {
	private UserInfoDto userInfoDto;
	private UserAllergyDto userAllergyDto;
	
	public UserDto() { }

	public UserDto(UserInfoDto userInfoDto, UserAllergyDto userAllergyDto) {
		super();
		this.userInfoDto = userInfoDto;
		this.userAllergyDto = userAllergyDto;
	}
	
	@Override
	public String toString() {
		return "UserDto [userInfoDto=" + userInfoDto + ", userAllergyDto=" + userAllergyDto + "]";
	}

	public UserInfoDto getUserInfoDto() {
		return userInfoDto;
	}

	public void setUserInfoDto(UserInfoDto userInfoDto) {
		this.userInfoDto = userInfoDto;
	}

	public UserAllergyDto getUserAllergyDto() {
		return userAllergyDto;
	}

	public void setUserAllergyDto(UserAllergyDto userAllergyDto) {
		this.userAllergyDto = userAllergyDto;
	}	
	
}
