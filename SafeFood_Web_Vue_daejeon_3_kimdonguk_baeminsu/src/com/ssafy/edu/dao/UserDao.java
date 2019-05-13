package com.ssafy.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.AllergyDto;
import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserInfoDto;

import db.base.DefaultDatabaseConnection;

@Repository
public class UserDao extends DefaultDatabaseConnection {

	String ns = "com.ssafy.edu.";

	@Autowired
	private SqlSession sqlSession;

	public void addUserInfo(UserInfoDto userInfo) {
		sqlSession.insert(ns + "addUserInfo", userInfo);
	}

	public void addUserAllergy(Map<String, String> map) {
		sqlSession.insert(ns + "addUserAllergy", map);
	}

	public void updateUserInfo(UserInfoDto userInfo) {
		sqlSession.update(ns + "updateUserInfo", userInfo);
	}

	public void updateUserAllergy(Map<String, String> map) {
		sqlSession.insert(ns + "updateUserAllergy", map);
	}

	public void deleteUserAllergy(String u_Id) {
		sqlSession.delete(ns + "deleteUserAllergy", u_Id);
	}

	public void deleteUser(String u_Id) {
		sqlSession.delete(ns + "deleteUser", u_Id);
	}

	public UserInfoDto getUserInfoById(String u_Id) {
		return sqlSession.selectOne(ns + "getUserInfoById", u_Id);
	}

	public UserInfoDto getUserInfoByTelName(Map<String, String> map) {
		return sqlSession.selectOne(ns + "getUserInfoByTelName", map);
	}

	public List<AllergyDto> getUserAllegyById(String u_Id) {
		return sqlSession.selectList(ns + "getUserAllegyById", u_Id);
	}

	public List<UserInfoDto> getAllUserInfo() {
		return sqlSession.selectList(ns + "getAllUserInfo");
	}

	public List<AllergyDto> getAllUserAllegy() {
		return sqlSession.selectList(ns + "getAllUserAllegy");
	}
	
	
	public List<UserInfoDto> findUser(Map<String,String>map) {
		return sqlSession.selectList(ns+"findUser",map);
		
	}

}