package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.postDTO;

public interface postService {
	int insertpost(postDTO DTO);
	int getpostid();
	postDTO getpost(int postid);
	int viewup(postDTO dto);
	List<postDTO> getallpost(String title);
}
