package com.ssafy.edu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.edu.dto.Food;
import com.ssafy.edu.dto.FoodPaging;

public interface IFoodService {



	FoodPaging makePageSearch(String p, int type, String keyword, int page) throws Exception;

	FoodPaging makePage(String p) throws Exception;

	void addAllegy(Map map) throws Exception;

	String getFoodAllergy(int code) throws Exception;

	int getTotalFoodCount() throws Exception;

	Food getFood(String code) throws Exception;

	void updateFood(Food f) throws Exception;

	void deleteFood(int code) throws Exception;

	void addFood(Food b) throws Exception;

	List<Food> getFindList(HashMap map) throws Exception;
	
	public List<Food> getFindListLimit(HashMap map) throws Exception;
	

	List<Food> getFoodList(int page) throws Exception;
	
	void deleteAllergyByCode(int foodCode) throws Exception;

}
