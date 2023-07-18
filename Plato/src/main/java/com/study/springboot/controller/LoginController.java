package com.study.springboot.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dto.ingredientDTO;
import com.study.springboot.service.ingredientService;
import com.study.springboot.service.memberService;

@Controller
public class LoginController {
	
	@Autowired
	memberService member;
	
	@Autowired
    private ingredientService ingredientService;
	
	int likeCount=33;
	boolean isLiked = true;
	String id = "admin";
	String pw = "1234";
	@RequestMapping("/test")
	public String test() {
		System.out.println("/test");
		return "Dongmin/test";
	}
	@RequestMapping("/reply")
	public String reply() {
		System.out.println("/reply");
		return "Dongmin/reply";
	}
	@RequestMapping("/recipe")
	public String recipe(
			HttpServletRequest request,
			Model model
			) {
		System.out.println("/recipe");
	    model.addAttribute("likeCount", likeCount);
	    model.addAttribute("isLiked", isLiked);
		return "viewList101";
	}
	
	@RequestMapping("/addrecipe")
	public String header(HttpServletRequest request, Model model) {
		System.out.println("/addrecipe");
		
		List<ingredientDTO> ingredientList = ingredientService.selectIngredientAll();
        List<String> ingredientNames = new ArrayList<>();
        
        for (ingredientDTO ingredient : ingredientList) {
            ingredientNames.add(ingredient.getIngredient());
        }
        
        String ingredientNamesString = String.join(",", ingredientNames); // 리스트를 쉼표로 구분된 하나의 문자열로 변환

        model.addAttribute("ingredientNames", ingredientNamesString);
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") != null) { // 세션 값이 존재하는 경우

			int userid = (int) session.getAttribute("userid");
			String nickname = (String) session.getAttribute("nickname");

			model.addAttribute("userid", userid);
			model.addAttribute("nickname", nickname);
			
			return "Dongmin/addrecipe";
		}
		else {
			String referer = "header"; // main으로 바꿀예정
	        return "redirect:" + referer;
		}
	}
	
	@PostMapping("/addcomplete")
	  public String addComplete(
			  HttpServletRequest request, 
			  Model model,
			  @RequestParam("title-image") MultipartFile titleImage,
		        @RequestParam("images") MultipartFile[] images) throws FileNotFoundException {
		
		// 작성자 id 저장및 기재
		HttpSession session = request.getSession();
		int userid = (int) session.getAttribute("userid");
		System.out.println(userid);
		
       // 상대적인 주소 classpath를 이용하는 방법
		 String resourcePath = ResourceUtils.getFile("classpath:static/Dongmin/title_img/").getAbsolutePath();
		 String timgpath = resourcePath.replace("/bin/main", "/src/main/resources");
		 
		 String iresourcePath = ResourceUtils.getFile("classpath:static/Dongmin/inst_img/").getAbsolutePath();
		 String Instimgpath = iresourcePath.replace("/bin/main", "/src/main/resources");

		
//		String timgfilePath = "classpath:static/Dongmin/title_img/";
		// 제목 가져오기
	    String title = request.getParameter("title");
	    
	    // 작성자 가져오기
	    String writer = request.getParameter("writer");
	    
	    // 난이도 가져오기
	    int difficulty = Integer.parseInt(request.getParameter("difficulty"));
	    
	    // 소요시간 가져오기
	    int spentTime = Integer.parseInt(request.getParameter("settime"));
	    
	    // 대표 사진 가져오기
	    
	    // 파일 업로드 처리 및 저장 로직 구현
	    
	    // 소개글 가져오기
	    String description = request.getParameter("description");
	    
	    // 재료 가져오기
	    String[] ingredients = request.getParameterValues("ingredients");
	    String[] amounts = request.getParameterValues("amounts");
	    
	    // 조리 방법 가져오기
	    String[] instructions = request.getParameterValues("instructions");
	    
	    // 파일 업로드 처리 및 저장 로직 구현
	    try {
	        // 파일 저장
	    	String tfileName = titleImage.getOriginalFilename();
			long now = System.currentTimeMillis();
			tfileName = now +"_"+ tfileName;
			System.out.println("fileName : "+ tfileName);
			
			// file 객체 만들기
			System.out.println(timgpath +File.separator+ tfileName);
			File tfile = new File( timgpath +File.separator+ tfileName );
			
			// 그 file 객체에 덮어쓰기
			FileUtils.writeByteArrayToFile(tfile, titleImage.getBytes());

			// DB에 파일 경로 저장 등 필요한 로직 수행
			String dbtimgpath = "Dongmin/title_img" + tfileName;
			
			List<String> dbImagePaths = new ArrayList<>();
	        for (MultipartFile image : images) {
	        	if (image.isEmpty()) {
	                dbImagePaths.add("");
	                continue;
	            }
	            String imageName = image.getOriginalFilename();
	            String imageFileName = System.currentTimeMillis() + "_" + imageName;
	            File imageFile = new File(Instimgpath + File.separator + imageFileName);
	            FileUtils.writeByteArrayToFile(imageFile, image.getBytes());
	            String dbImagePath = "Dongmin/inst_img/" + imageFileName;
	            dbImagePaths.add(dbImagePath);
	        }
	        System.out.println("dbImagePath: " + dbImagePaths);
			
	      } catch (IOException e) {
	        // 파일 저장 실패 시 예외 처리
	        e.printStackTrace();
	      }
	    // 레시피 등록 로직 호출
	    // recipeService.addRecipe(title, writer, difficulty, spentTime, ...);
	    
	    // 값 콘솔에 출력
	    System.out.println("Title: " + title);
	    System.out.println("Writer: " + writer);
	    System.out.println("Difficulty: " + difficulty);
	    System.out.println("Spent Time: " + spentTime);
	    System.out.println("Description: " + description);
	    System.out.println("Ingredients: " + Arrays.toString(ingredients));
	    System.out.println("Amounts: " + Arrays.toString(amounts));
	    System.out.println("Instructions: " + Arrays.toString(instructions));
	    
	    
	    // 추가 작업 및 리다이렉트 처리
	    // ...
	    
	    return "Dongmin/recipe";
	  }
	
	@PostMapping("/addingredient")
    public String addIngredient(@RequestParam("new-ingredient") String ingredientName) {
        // 재료 추가 로직 수행
        ingredientService.insertIngredient(ingredientName);
        
        // 추가한 후 리다이렉트할 페이지나 뷰 이름 반환
        return "redirect:/addrecipe"; // 예시로 recipeform 페이지로 리다이렉트
    }
	
	@RequestMapping("/recipeLike")
	public String updateRecipe(
	        @RequestParam(value = "likeCount") int likeCount,
	        @RequestParam(value = "isLiked") boolean isLiked,
	        HttpServletRequest request,
	        Model model) {
	    
		this.isLiked = isLiked;
	    this.likeCount = likeCount;
	    System.out.println(isLiked);
	    System.out.println(this.isLiked);
	    System.out.println(this.likeCount);
	    // 처리 로직...
	    
	    // 업데이트된 값들을 응답으로 전달
	    
	    return "Dongmin/recipe";
	}
	
	@RequestMapping("/main")
	public String main() {
		System.out.println("/main");
		return "Yuchan/mainpage";
	}
	
	/*
	 * @RequestMapping("/MyPage") public String mypage() {
	 * System.out.println("/MyPage"); return "Hyunyoung/MyPage"; }
	 * 
	 * @RequestMapping("/presonerPage") public String personerPage() {
	 * System.out.println("/personerPage"); return "Hyunyoung/personerPage"; }
	 */

}