package com.ssafy.edu.dto;

import java.util.ArrayList;

public class UserAllergyDto {
	private String id;
	private ArrayList<AllergyDto> u_Allergy = new ArrayList<>();
	
	public UserAllergyDto() { }
	
	public UserAllergyDto(String u_Id, ArrayList<AllergyDto> u_Allergy) {
		super();			
		this.id = u_Id;
		this.u_Allergy = u_Allergy;
	}
	
	@Override
	public String toString() {
		return "UserAllergyDto [u_Id=" + id + ", u_Allergy=" + u_Allergy + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ArrayList<AllergyDto> getU_Allergy() {
		return u_Allergy;
	}

	public void setU_Allergy(ArrayList<AllergyDto> u_Allergy) {
		this.u_Allergy = u_Allergy;
	}


}
