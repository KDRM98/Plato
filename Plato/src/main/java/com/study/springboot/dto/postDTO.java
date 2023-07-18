package com.study.springboot.dto;

import java.util.List;

public class postDTO {
	private int postid;
	private int writerId;
	private String title;
	private String timg;
	private String info;
	private String ytblink;
	private String time;
	private String Diff;
	private List<recipeDTO> instruction;
	private List<ingredientDTO> ingredient;
	
	
	// DTO는 각각 다 선언을 해주고 이 recipeDTO에 List<instructionDTO> 이런식으로 다른 서브 DTO를 여기에 담는 방식으로 해서 불러올때 한번에 불러오게.
}
