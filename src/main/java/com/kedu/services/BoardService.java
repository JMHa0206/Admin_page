package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.BoardDAOImp;
import com.kedu.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAOImp bDao;
	
	
	public void insertBoard(String boardName) {
		bDao.insertBoard(boardName);
	}
	
	public void updateBoard(BoardDTO bDto) {
		bDao.updateBoard(bDto);
	}
	
	public void deleteBoard(int b_id) {
		bDao.deleteBoard(b_id);
	}
	
	public List<BoardDTO> selectAllBoards() {
		return bDao.selectAllBoards();
	}

}
