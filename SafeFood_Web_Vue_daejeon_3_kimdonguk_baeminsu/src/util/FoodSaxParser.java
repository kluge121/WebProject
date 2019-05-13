package util;

import java.io.BufferedReader;  
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List; 
import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.ssafy.edu.dto.Food;





/**
 * FoodNutritionSAXHandler와 FoodSAXHandler를 이용해서 식품 정보를 load하는 SAX Parser 프로 그램  
 *
 */
public class FoodSaxParser {
	
	
	private String rootpath= FoodSaxParser.class.getResource("/").getPath();
	private String foodURL = "res/foodInfo.xml";
	private String nutritionURL = "res/FoodNutritionInfo.xml";
	
	
	
//	private String foodFilePath = "C:\\SSAFY1\\JSP_BACK\\Safefood_Web_Front_Daejeon_06\\WebContent\\res\\foodInfo.xml";
//	private String nutritionFilePath = "C:\\SSAFY1\\JSP_BACK\\Safefood_Web_Front_Daejeon_06\\WebContent\\res\\FoodNutritionInfo.xml";
	
	
//	private String foodFilePath = "Safefood_Web_Front_Daejeon_06\\WebContent\\res\\foodInfo.xml";
//	private String nutritionFilePath = "Safefood_Web_Front_Daejeon_06\\WebContent\\res\\FoodNutritionInfo.xml";
//	


	
	
	private StringBuilder xml ;
	private List<Food> foods;
 	public FoodSaxParser() {
		loadData();
	}
 	
 	/**
 	 * FoodNutritionSAXHandler와 FoodSAXHandler를 이용 파싱한 식품 정보와 식품 영양 정보를  Food에 병합한다. 
 	 */
	private void loadData() {
		SAXParserFactory factory = SAXParserFactory.newInstance();
		try{
			

			rootpath = rootpath.substring(0,rootpath.indexOf("classes"));
			foodURL = rootpath+foodURL;
			nutritionURL = rootpath+nutritionURL;

			String path = new java.io.File("").getAbsolutePath(); 
			
			SAXParser parser = factory.newSAXParser();
			FoodSAXHandler handler = new FoodSAXHandler();
			FoodNutritionSAXHandler nHandler = new FoodNutritionSAXHandler();
			parser.parse(foodURL,handler);
			parser.parse(nutritionURL,nHandler);
			Map<String, Food> foodMap = handler.getFoods();
			foods = nHandler.getList();
			Food find;
			for (Food food : foods) {
				find = foodMap.get(food.getName());
				if(find!=null) {
					food.setCode(find.getCode());
					food.setName(find.getName());
					food.setMaker(find.getMaker());
					food.setMaterial(find.getMaterial());
					food.setU_Allergy(find.getU_Allergy());
					food.setImg(find.getImg());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<Food> getFoods() {
		
		
		return foods;
	}
	public void setFoods(List<Food> foods) {
		this.foods = foods;
	}
	
}
