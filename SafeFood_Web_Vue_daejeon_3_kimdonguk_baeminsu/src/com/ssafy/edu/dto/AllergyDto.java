package com.ssafy.edu.dto;



public class AllergyDto {
	

	private String id;
	private String allergy_info;
	
	public AllergyDto() { }
	
	public AllergyDto(String u_Id, String u_Allergy) {
		super();			
		this.id = u_Id;
		this.allergy_info = u_Allergy;
	}




	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAllergy_info() {
		return allergy_info;
	}

	public void setAllergy_info(String allergy_info) {
		this.allergy_info = allergy_info;
	}

	@Override
	public String toString() {
		return "AllergyDto [u_Id=" + id + ", u_Allergy=" + allergy_info + "]";
	}

	
	
	
	

}
