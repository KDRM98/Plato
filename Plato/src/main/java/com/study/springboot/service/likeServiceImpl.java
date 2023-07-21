package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.likeDAO;
import com.study.springboot.dto.likeDTO;

@Service
public class likeServiceImpl implements likeService{
	
	@Autowired
	likeDAO DAO;
	
	@Override
	public int getisliked(likeDTO dto) {
		int result = DAO.getisliked(dto);
		return result;
	}

	@Override
	public int clicklike(likeDTO dto) {
		int isliked = DAO.getisliked(dto);
		int result = 0;
		if(isliked == 1) {
			result = DAO.deletelike(dto);
			System.out.println(result);
			return 0;
		}
		else {
			result = DAO.insertlike(dto);
			System.out.println(result);
			return 1;
		}
	}

	@Override
	public int getpostliked(likeDTO dto) {
		int result = DAO.getpostliked(dto);
		return result;
	}

}
