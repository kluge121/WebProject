package com.ssafy.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.edu.dto.AllergyDto;
import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;
import com.ssafy.edu.dto.UserInfoDto;

public interface IUserService {

	void addUser(UserInfoDto userInfo, UserAllergyDto userAllergy);

	void updateUserInfo(UserInfoDto userInfo);

	void updateUserAllergy(Map<String, String> map);

	void deleteUserAllergy(String u_Id);

	void deleteUser(String u_Id);

	UserInfoDto getUserInfoById(String u_Id);

	UserInfoDto getUserInfoByTelName(Map<String, String> map);

	List<AllergyDto> getUserAllegyById(String u_Id);

	List<UserInfoDto> getAllUserInfo();

	List<AllergyDto> getAllUserAllegy();

	void updateUser(UserInfoDto userInfo, String [] arrAllergy);
	
	public List<UserDto> findUser(Map<String,String>map);
	
	public List<UserDto> integratUserAndAllergy(List<UserInfoDto> userInfoList);
	


}