package com.ssafy.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.UserDao;
import com.ssafy.edu.dto.AllergyDto;
import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;
import com.ssafy.edu.dto.UserInfoDto;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public void addUser(UserInfoDto userInfo, UserAllergyDto userAllergy) {
		userDao.addUserInfo(userInfo);
		for (AllergyDto allergy : userAllergy.getU_Allergy()) {
			Map<String, String> map = new HashMap<>();
			map.put("u_Id", userInfo.getId());
			map.put("u_Allergy", allergy.getAllergy_info());
			userDao.addUserAllergy(map);
		}
	}

	@Override
	@Transactional
	public void updateUserInfo(UserInfoDto userInfo) {
		userDao.updateUserInfo(userInfo);

	}

	@Override
	@Transactional
	public void updateUserAllergy(Map<String, String> map) {
		userDao.updateUserAllergy(map);
	}

	@Override
	@Transactional
	public void deleteUserAllergy(String u_Id) {
		userDao.deleteUserAllergy(u_Id);
	}

	@Override
	@Transactional
	public void deleteUser(String u_Id) {
		userDao.deleteUser(u_Id);
	}

	@Override
	@Transactional(readOnly = true)
	public UserInfoDto getUserInfoById(String u_Id) {
		return userDao.getUserInfoById(u_Id);
	}

	@Override
	@Transactional(readOnly = true)
	public UserInfoDto getUserInfoByTelName(Map<String, String> map) {
		return userDao.getUserInfoByTelName(map);
	}

	@Override
	@Transactional(readOnly = true)
	public List<AllergyDto> getUserAllegyById(String u_Id) {
		return userDao.getUserAllegyById(u_Id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<UserInfoDto> getAllUserInfo() {
		return userDao.getAllUserInfo();
	}

	@Override
	@Transactional(readOnly = true)
	public List<AllergyDto> getAllUserAllegy() {
		return userDao.getAllUserAllegy();
	}

	@Override
	@Transactional
	public void updateUser(UserInfoDto userInfo, String[] arrAllergy) {
		userDao.updateUserInfo(userInfo);
		String u_Id = userInfo.getId();
		for (String a : arrAllergy) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("u_Id", u_Id);
			map.put("u_Allergy", a);
			userDao.updateUserAllergy(map);
		}

	}

	@Override
	@Transactional(readOnly=true)
	public List<UserDto> findUser(Map<String, String> map) {
		List<UserInfoDto>list =  userDao.findUser(map);
		return integratUserAndAllergy(list);
	}
	
	

	@Override
	@Transactional(readOnly=true)
	public List<UserDto> integratUserAndAllergy(List<UserInfoDto> userInfoList) {
		List<UserDto> returnList = new ArrayList<UserDto>();
		for(UserInfoDto user : userInfoList) {
			List <AllergyDto> arr = getUserAllegyById(user.getId());
			UserAllergyDto aDto = new UserAllergyDto(user.getId(),(ArrayList<AllergyDto>) arr);
			returnList.add(new UserDto(user,aDto));
		}
		return returnList;
	}

	
	
	
	
	
	
	
	
	
}