package com.study.springboot.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dto.ingredientDTO;
import com.study.springboot.dto.likeDTO;
import com.study.springboot.dto.postDTO;
import com.study.springboot.dto.recipeDTO;
import com.study.springboot.service.ingredientService;
import com.study.springboot.service.likeService;
import com.study.springboot.service.memberService;
import com.study.springboot.service.postService;
import com.study.springboot.service.recipeService;

@Controller
public class LoginController {
	
	@Autowired
	private memberService member;
	
	@Autowired
	private postService postService;
	
	
	@Autowired
    private ingredientService ingredientService;

	@Autowired
	private recipeService recipeService;
	
	@Autowired
	private likeService likeservice;
	
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
			@RequestParam("postid") int postid,
			Model model
			) {
		System.out.println("/recipe"+ postid);
		HttpSession session = request.getSession();
		int userid = (int) session.getAttribute("userid");
		likeDTO dto = new likeDTO();
		postDTO pdto = new postDTO();
		pdto.setPostid(postid);
		dto.setPostid(postid);
		dto.setUserid(userid);
		int postlike = likeservice.getpostliked(dto);
		int isliked = likeservice.getisliked(dto);
		int viewup = postService.viewup(pdto);
		
		System.out.println("viewup result : " + viewup);
		
		model.addAttribute("postlike", postlike);
		model.addAttribute("isliked", isliked);
		model.addAttribute("userid", userid);
		
		
		// 게시글 기본정보 가져오기
		postDTO postdto = postService.getpost(postid);
		String title = postdto.getTitle();
		String nickname = postdto.getNickname();
		String mnp = postdto.getmnp();
		String ytbl = postdto.getYtbl();
		String info = postdto.getInfo();
		int time = postdto.getTime();
		int diff = postdto.getDiff();
		
		System.out.println(title);
		System.out.println(userid);
		System.out.println(nickname);
		System.out.println(mnp);
		System.out.println(ytbl);
		System.out.println(info);
		System.out.println(time);
		System.out.println(diff);
		
		
		
		// 조리방법 순서대로 가져와 리스트로 담기
		List<recipeDTO> recipelist = recipeService.getRecipe(postid);
		
		List<String> recipeinfoList = new ArrayList<>();
		List<String> recipeimgList = new ArrayList<>();
		List<Integer> recipeorderList = new ArrayList<>();
		
		for (recipeDTO recipe : recipelist) {
			int recipeorder = recipe.getRecipeOrder();
			String recipeinfo = recipe.getRecipeinfo();
			String recipeimg = recipe.getRecipeimg();
			
			recipeorderList.add(recipeorder);
			recipeinfoList.add(recipeinfo);
			recipeimgList.add(recipeimg);
		}
		
	    // 게시글 재료정보 가져오기
	    List<ingredientDTO> ingredientList = ingredientService.selectIngredientByRecipeId(postid);
	    List<String> ingList = new ArrayList<>();
	    List<String> ingamtList = new ArrayList<>();
	    
	    for(ingredientDTO ingredient : ingredientList) {
	    	String ing = ingredient.getIngredient();
	    	String ingamt = ingredient.getingamt();
	    	
	    	ingList.add(ing);
	    	ingamtList.add(ingamt);
	    }
	    
	    for (int i = 0; i < recipeinfoList.size(); i++) {
	        String recipeInfo = recipeinfoList.get(i);
	        recipeInfo = recipeInfo.replace("\r\n", "<br>");
	        recipeinfoList.set(i, recipeInfo);
	    }
	    
	    info = info.replace("\r\n", "<br>");
	    
	    System.out.println("ingList : " + ingList);
	    System.out.println("ingamtList : " + ingamtList);
	    System.out.println("info : " + info);
	    System.out.println("recipeorderList : " + recipeorderList);
	    System.out.println("recipeinfoList : " + recipeinfoList);
	    System.out.println("recipeimgList : " + recipeimgList);
	    
	    
	    model.addAttribute("title", title);
		model.addAttribute("nickname", nickname);
		model.addAttribute("mnp", mnp);
		model.addAttribute("ytbl", ytbl);
		model.addAttribute("info", info);
		model.addAttribute("time", time);
		model.addAttribute("diff", diff);
		model.addAttribute("postid", postid);
	    
	    model.addAttribute("recipeorderList", recipeorderList);
	    model.addAttribute("recipeinfoList", recipeinfoList);
	    model.addAttribute("recipeimgList", recipeimgList);
	    
	    model.addAttribute("ingList", ingList);
	    model.addAttribute("ingamtList", ingamtList);
	    
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
	
	@RequestMapping("/addcomplete")
	  public String addComplete(
			  HttpServletRequest request, 
			  Model model,
			  @RequestParam("mnp") MultipartFile titleImage,
		        @RequestParam("images") MultipartFile[] images) throws FileNotFoundException {
		
		// postid 가져오기
		int postid = postService.getpostid();
		
		// 작성자 id 저장및 기재
		HttpSession session = request.getSession();
		int userid = (int) session.getAttribute("userid");
		System.out.println(userid);
		
		// 상대적인 주소 classpath를 이용하는 방법
		// 상대주소는 bin, 절대경로로 받아서 경로 수정한건 src/main이고 두 경로 모두에 이미지 저장
 		 String resourcePath = ResourceUtils.getFile("classpath:static/Dongmin/title_img/").getAbsolutePath();
		 String timgpath = resourcePath.replace("/bin/main", "/src/main/resources");
		 
		 String iresourcePath = ResourceUtils.getFile("classpath:static/Dongmin/inst_img/").getAbsolutePath();
		 String Instimgpath = iresourcePath.replace("/bin/main", "/src/main/resources");

		
//		String timgfilePath = "classpath:static/Dongmin/title_img/";
		// 제목 가져오기
	    String title = request.getParameter("title");
	    
	    // 난이도 가져오기
	    int diff = Integer.parseInt(request.getParameter("difficulty"));
	    
	    // 소요시간 가져오기
	    int time = Integer.parseInt(request.getParameter("settime"));
	    
	    // 소개글 가져오기
	    String info = request.getParameter("desc");
	    
	    //유튜브링크 가져오기
	    String ytbl = request.getParameter("ytbl");
	    
	    // 재료 가져오기
	    String[] ingredients = request.getParameterValues("ingredients");
	    String[] amounts = request.getParameterValues("amounts");
	    
	    // 조리 방법 가져오기
	    String[] instructions = request.getParameterValues("instructions");
	    
	    // 조리과정 이미지들 리스트
	    List<String> dbImagePaths = new ArrayList<>();
	    String dbtimgpath = "";
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
			File trfile = new File( resourcePath +File.separator+ tfileName );
			
			// 그 file 객체에 덮어쓰기
			FileUtils.writeByteArrayToFile(tfile, titleImage.getBytes());
			FileUtils.writeByteArrayToFile(trfile, titleImage.getBytes());

			// DB에 파일 경로 저장 등 필요한 로직 수행
			dbtimgpath = "Dongmin/title_img/" + tfileName;
			
			
	        for (MultipartFile image : images) {
	        	if (image.isEmpty()) {
	                dbImagePaths.add("");
	                continue;
	            }
	            String imageName = image.getOriginalFilename();
	            String imageFileName = System.currentTimeMillis() + "_" + imageName;
	            File imageFile = new File(Instimgpath + File.separator + imageFileName);
	            File rimageFile = new File(iresourcePath + File.separator + imageFileName);
	            
	            FileUtils.writeByteArrayToFile(imageFile, image.getBytes());
	            FileUtils.writeByteArrayToFile(rimageFile, image.getBytes());
	            String dbImagePath = "Dongmin/inst_img/" + imageFileName;
	            dbImagePaths.add(dbImagePath);
	        }
	        
			
	      } catch (IOException e) {
	        // 파일 저장 실패 시 예외 처리
	        e.printStackTrace();
	      }
	    // 레시피 등록 로직 호출
	    // recipeService.addRecipe(title, writer, difficulty, spentTime, ...);
	    
	    // 값 콘솔에 출력
	    System.out.println("dbImagePath: " + dbImagePaths);
	    System.out.println("ytbl: " + ytbl);
	    System.out.println("dbtimgpath: " + dbtimgpath);
	    System.out.println("Title: " + title);
	    System.out.println("Writer: " + userid);
	    System.out.println("Difficulty: " + diff);
	    System.out.println("Spent Time: " + time);
	    System.out.println("Description: " + info);
	    System.out.println("Ingredients: " + Arrays.toString(ingredients));
	    System.out.println("Amounts: " + Arrays.toString(amounts));
	    System.out.println("Instructions: " + Arrays.toString(instructions));
	    
	    String videoId = extractYouTubeVideoId(ytbl);

        // 동영상 ID를 embed 형식으로 변환하여 모델에 담음
        String ytblink = "https://www.youtube.com/embed/" + videoId;
	    
	    // DB에 게시글(Post)등록
	    postDTO pdto = new postDTO();
	    pdto.setPostid(postid);
	    pdto.setWriterId(userid);
	    pdto.setTitle(title);
	    pdto.setmnp(dbtimgpath);
	    pdto.setInfo(info);
	    pdto.setYtbl(ytblink);
	    pdto.setTime(time);
	    pdto.setDiff(diff);
	    int presult = postService.insertpost(pdto);
	    System.out.println("post 결과 : "+presult);
	    
	    for (int i = 0; i < ingredients.length; i++) {
	        String ingredient = ingredients[i];
	        String amount = amounts[i];
	        int ingid = ingredientService.selectIngIDByName(ingredient);
	        ingredientDTO idto = new ingredientDTO();
	        idto.setPostid(postid);
	        idto.setIngid(ingid);
	        idto.setingamt(amount);
	        
	        int iresult = ingredientService.insertInges(idto);
	        // result를 확인하고 필요에 따라 처리
	        System.out.println("Inges 결과 : " + iresult);
	        // 추가로 필요한 로직 수행
	    }
	    
	    for (int j = 0; j < instructions.length; j++) {
	        recipeDTO rdto = new recipeDTO();
	        int recipeorder = j+1;
	        rdto.setPostid(postid);
	        rdto.setRecipeinfo(instructions[j]);
	        rdto.setRecipeimg(dbImagePaths.get(j));
	        rdto.setRecipeOrder(recipeorder);
	        
	        int rresult = recipeService.insertRecipe(rdto);
	        // result를 확인하고 필요에 따라 처리
	        System.out.println("Recipe 결과 : " + rresult);
	        // 추가로 필요한 로직 수행
	    }
	    System.out.println(postid);
	    return "redirect:/recipe?postid=" + Integer.toString(postid);
	  }
	
	
	private String extractYouTubeVideoId(String youtubeLink) {
        // 정규표현식을 사용하여 동영상 ID 추출
        String videoId = null;
        String pattern = "^(?:https?:\\/\\/)?(?:www\\.)?youtube\\.com\\/watch\\?v=([^\\s&]+)";
        Pattern compiledPattern = Pattern.compile(pattern);
        Matcher matcher = compiledPattern.matcher(youtubeLink);
        if (matcher.find()) {
            videoId = matcher.group(1);
        }
        return videoId;
    }
	
	@PostMapping("/addingredient")
    public String addIngredient(@RequestParam("new-ingredient") String ingredientName) {
        // 재료 추가 로직 수행
        ingredientService.insertIngredient(ingredientName);
        
        // 추가한 후 리다이렉트할 페이지나 뷰 이름 반환
        return "redirect:/addrecipe"; // 예시로 recipeform 페이지로 리다이렉트
    }
	
	@RequestMapping("/recipeLike")
	@ResponseBody
	public Map<String, Object> updateRecipe(
			@RequestParam(value = "postid") int postid,
	        @RequestParam(value = "postlike") int postlike,
	        @RequestParam(value = "isliked") int isliked,
	        @RequestParam(value = "userid") int userid,
	        HttpServletRequest request,
	        Model model
	        ) {
		likeDTO dto = new likeDTO();
		dto.setUserid(userid);
		dto.setPostid(postid);
		int newliked = likeservice.clicklike(dto);
		System.out.println("clicklike 결과 : " + newliked);
		int cpostlike = likeservice.getpostliked(dto);
		int cisliked = likeservice.getisliked(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postlike", cpostlike);
		map.put("isliked", cisliked);
	    // 업데이트된 값들을 응답으로 전달
	    
	    return map;
	}
	
	/*
	 * @RequestMapping("/main") public String main() { System.out.println("/main");
	 * return "Yuchan/mainpage"; }
	 */
	
	/*
	 * @RequestMapping("/MyPage") public String mypage() {
	 * System.out.println("/MyPage"); return "Hyunyoung/MyPage"; }
	 * 
	 * @RequestMapping("/presonerPage") public String personerPage() {
	 * System.out.println("/personerPage"); return "Hyunyoung/personerPage"; }
	 */

}