package com.ssafy.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.edu.dto.AllergyDto;
import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;
import com.ssafy.edu.dto.UserInfoDto;
import com.ssafy.edu.service.IUserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserService service;

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String goIndex(Model model) throws Exception {
		return "redirect:/foodlist.do?page=1";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String addUser(Model model, String u_Id, String u_Password, String u_Name, String u_Address, String u_Tel,
			String[] u_Allergy) throws Exception {
		UserInfoDto userInfo = new UserInfoDto(u_Id, u_Password, u_Name, u_Address, u_Tel);
		ArrayList<AllergyDto> arr_u_Allergy = new ArrayList<>();
		for (int idx = 0; idx < u_Allergy.length; idx++) {
			arr_u_Allergy.add(new AllergyDto(u_Id,u_Allergy[idx]));
		}
		UserAllergyDto userAllergy = new UserAllergyDto(u_Id, arr_u_Allergy);
		service.addUser(userInfo, userAllergy);
		
		model.addAttribute("nurl", "index.do");
		model.addAttribute("stat", "성공");
		model.addAttribute("msg", "회원가입 성공");
		return "success";
	}
	
	@RequestMapping(value = "join_bf.do", method = RequestMethod.GET)
	public String addUser(Model model) throws Exception {
		return "user/join";
	}
	

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String Login(Model model, String u_Id, String u_Password, HttpSession session) throws Exception {
		System.out.println(u_Id);
		UserInfoDto u = service.getUserInfoById(u_Id);
		
		
		if (u != null && u.getPassword().equals(u_Password)) {
			session.setAttribute("id", u.getId());
			session.setAttribute("alias", u.getName());
			return "redirect:/foodlist.do?page=1";
		} else {
			return "user/find";
		}
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/foodlist.do?page=1";
	}
	


	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) throws Exception {

		UserInfoDto u = service.getUserInfoById((String) session.getAttribute("id"));
		UserAllergyDto a = new UserAllergyDto();
		
		
		List<AllergyDto> list = service.getUserAllegyById(u.getId());
		ArrayList<AllergyDto> aList = new ArrayList<>();
	
		
		for (AllergyDto dto : list) {
			aList.add(new AllergyDto(u.getId(),dto.getAllergy_info()));
		}
		a.setId(u.getId());
		a.setU_Allergy(aList);

		model.addAttribute("address", u.getAddress());
		model.addAttribute("tel", u.getTel());
		model.addAttribute("allergy", a.getU_Allergy());
		

		return "user/acount";
	}

	@RequestMapping(value = "userdrop.do", method = RequestMethod.GET)
	public String userDrop(Model model, HttpSession session) throws Exception {
		String u_Id = ((String) session.getAttribute("id"));
		service.deleteUser(u_Id);
		service.deleteUserAllergy(u_Id);
		
		
		model.addAttribute("nurl", "index.do");
		model.addAttribute("stat", "성공");
		model.addAttribute("msg", "회원 탈퇴 성공");
		
		return "success";
	}

	@RequestMapping(value = "usermodify.do", method = RequestMethod.POST)
	public String userModify(Model model, HttpSession session, String u_Id, String u_Password, String u_Name,
			String u_Address, String u_Tel, String[] u_Allergy) throws Exception {
		UserInfoDto userInfo = new UserInfoDto(u_Id, u_Password, u_Name, u_Address, u_Tel);
		
		System.out.println(u_Allergy.length+"#######################################################################################");
		service.deleteUserAllergy(u_Id);
		service.updateUser(userInfo, u_Allergy);
		
		
		model.addAttribute("nurl", "index.do");
		model.addAttribute("stat", "성공");
		model.addAttribute("msg", "회원정보 수정 성공");
		
		
		return "success";
	}
	
	@RequestMapping(value = "finduser.do", method = RequestMethod.POST)
	public String finduser(Model model, HttpSession session, String u_Id, String u_Name, String u_Tel) throws Exception {
		
		if(u_Id==null) {
			Map <String, String> map = new HashMap<>();
			map.put("u_Tel",u_Tel);
			map.put("u_Name",u_Name);

			UserInfoDto u = service.getUserInfoByTelName(map);
			
			if(u==null) {
				model.addAttribute("stat", "찾기 실패");
				model.addAttribute("msg", "일치하는 정보가 없습니다");
				model.addAttribute("nurl", "index.do");
			}else {
				model.addAttribute("stat", "찾기 성공");
				model.addAttribute("msg", "회원ID:" + u.getId());
				model.addAttribute("nurl", "index.do");
			}
			
		}else {
			UserInfoDto u = service.getUserInfoById(u_Id);
			
			if(u==null) {
				model.addAttribute("stat", "찾기 실패");
				model.addAttribute("msg", "일치하는 정보가 없습니다");
				model.addAttribute("nurl", "index.do");
			}else {
				model.addAttribute("stat", "찾기 성공");
				model.addAttribute("msg", "회원PW:" + u.getPassword());
				model.addAttribute("nurl", "index.do");
			}
			
		}	
		
		
		return "user/success";
	}
	
	@RequestMapping(value = "showmember.do", method = RequestMethod.POST)
	public String finduser(Model model, HttpSession session, String type, String keyword) throws Exception {
		
		
		List <UserDto> result = new ArrayList<UserDto>();

		Map <String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("type", type);
		result = service.findUser(map);
		
		model.addAttribute("members", result);

		return "user/manager";
	}
	
}
