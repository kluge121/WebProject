package com.ssafy.edu.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.FoodDao;
import com.ssafy.edu.dto.Food;
import com.ssafy.edu.dto.FoodPaging;





@Service
public class FoodServiceImpl implements IFoodService {

	@Autowired
	private FoodDao foodDao;
	
	private static int COUNT_PER_PAGE = 9; 

	
	
	@Override
	@Transactional(readOnly = true)
	public List<Food> getFoodList(int page) throws Exception {
		return foodDao.getFoodList(page);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Food> getFindList(HashMap map) throws Exception {
		return foodDao.getFindList(map);
	}
	@Override
	public List<Food> getFindListLimit(HashMap map) throws Exception {
		return foodDao.getFindListLimit(map);
	}

	@Override
	@Transactional
	public void addFood(Food b) throws Exception {
		foodDao.addFood(b);
		
	}

	@Override
	@Transactional
	public void deleteFood(int code) throws Exception {
		foodDao.deleteFood(code);
		
	}

	@Override
	@Transactional
	public void updateFood(Food f) throws Exception {
		foodDao.updateFood(f);
		
	}

	@Override
	@Transactional(readOnly = true)
	public Food getFood(String code) throws Exception {
		return 	foodDao.getFood(code);
	}

	@Override
	@Transactional(readOnly = true)
	public int getTotalFoodCount() throws Exception {
		return foodDao.getTotalFoodCount();
	}

	@Override
	@Transactional(readOnly = true)
	public String getFoodAllergy(int code) throws Exception {
		List <String>list = foodDao.getFoodAllergy(code);
		String tmp ="";
		for(String a : list) {
			tmp+=a+" ";
		}
		return tmp;
	}

	@Override
	@Transactional
	public void addAllegy(Map map) throws Exception {
		foodDao.addAllegy(map);
	}
	
	@Override
	@Transactional
	public void deleteAllergyByCode(int foodCode) throws Exception {
		foodDao.deleteAllergyByCode(foodCode);

	}
	
	
	
	@Override
	@Transactional(readOnly = true)
	public FoodPaging makePage(String p) throws Exception{ 
		
		int page = 1;
		
		if(p!=null && p.length()>0) {
			page = Integer.parseInt(p);
		}
		
		int totalFoodCount = foodDao.getTotalFoodCount(); // 총 게시글 갯수 조회
		
		int totalPageCount = totalFoodCount/COUNT_PER_PAGE;
		if(totalFoodCount%COUNT_PER_PAGE != 0)
			totalPageCount++;
		
		int startRow = (page-1)*9;
		List<Food> foodList = foodDao.getFoodList(startRow);
		
		for(Food f : foodList) {
			if(f.getImg().length()< 1 || f.getImg()==null) {
				f.setImg("img/none.png");
			}
		}
	
		int startPage = (page-1)/10*10+1;
		int endPage = startPage + 9;
		if(endPage > totalPageCount)
			endPage = totalPageCount;			
		
		
		return new FoodPaging(foodList, page, startPage, endPage, totalPageCount);

	}
	
	
	
	@Override
	@Transactional(readOnly = true)
	public FoodPaging makePageSearch(String p, int type, String keyword, int page) throws Exception {
		

		
		if(p!=null && p.length()>0) {
			page = Integer.parseInt(p);
		}
		
		int startRow = (page-1)*9;
		HashMap<String,Object> map = new HashMap<>();
		map.put("type", String.valueOf(type));
		map.put("keyword", keyword);
		map.put("page", String.valueOf(page));
		map.put("startRow",startRow);
		
		List<Food> foodList = foodDao.getFindList(map);
		List<Food> returnFoodList = foodDao.getFindListLimit(map);
		int totalFoodCount = foodList.size(); // 총 게시글 갯수 조회
		
		int totalPageCount = totalFoodCount/COUNT_PER_PAGE;
		if(totalFoodCount%COUNT_PER_PAGE != 0)
			totalPageCount++;
		

		for(Food f : returnFoodList) {
			if(f.getImg().length()< 1 || f.getImg()==null) {
				f.setImg("img/none.png");
			}
		}

		int startPage = (page-1)/10*10+1;
		int endPage = startPage + 9;
		if(endPage > totalPageCount)
			endPage = totalPageCount;			
		
		
		return new FoodPaging(returnFoodList, page, startPage, endPage, totalPageCount);
	
	}



	


}
