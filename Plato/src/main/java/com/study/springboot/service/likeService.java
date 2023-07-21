package com.study.springboot.service;

import com.study.springboot.dto.likeDTO;

public interface likeService {
	int getpostliked(likeDTO dto);
	int getisliked(likeDTO dto);
	int clicklike(likeDTO dto);
}
