package com.ssafy.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.ssafy.edu.dto.Food;




@Repository
public class FoodDao {
	
	
	String ns = "com.ssafy.edu.";

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Food> getFoodList(int page) throws Exception {
		return sqlSession.selectList(ns + "getFoodList",page);
	}

	public List<Food> getFindList(HashMap map) throws Exception{
		return sqlSession.selectList(ns+"getFindList", map);
	}

	public List<Food> getFindListLimit(HashMap map) throws Exception {
		return sqlSession.selectList(ns + "getFindListLimit", map);
	}
	
	
	public void addFood(Food b) throws Exception {
		sqlSession.insert(ns + "addFood", b);
	}

	public void deleteFood(int code) throws Exception {
		sqlSession.delete(ns + "deleteFood", code);
	}
	
	
	public void updateFood(Food f) throws Exception {
		sqlSession.update(ns + "updateFood", f);
	}


	public Food getFood(String code) throws Exception {
		return sqlSession.selectOne(ns + "getFood", code);
	}


	
	public int getTotalFoodCount() throws Exception {
		int count = sqlSession.selectOne(ns + "getTotalFoodCount");
		return count;
	}
	
	
	public List<String> getFoodAllergy(int code) throws Exception {
		return sqlSession.selectList(ns + "getFoodAllergy",code);
	}
	
	
	public void addAllegy(Map map) throws Exception {
		sqlSession.insert(ns + "addAllegy", map);
	}
	
	public void deleteAllergyByCode(int foodCode) throws Exception {
		sqlSession.delete(ns+"deleteAllergyByCode",foodCode);
	}
	
	

}
