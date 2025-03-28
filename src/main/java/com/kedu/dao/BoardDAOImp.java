package com.kedu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.BoardDTO;

@Repository
public class BoardDAOImp implements BoardDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String NAMESPACE = "Board";

    @Override
    public void insertBoard(String boardName) {
        sqlSession.insert(NAMESPACE + ".insertBoard", boardName);
    }

    @Override
    public List<BoardDTO> selectAllBoards() {
        return sqlSession.selectList(NAMESPACE + ".selectBoardList");
    }

    @Override
    public BoardDTO selectBoardById(int boardId) {
        return sqlSession.selectOne(NAMESPACE + ".selectBoardById", boardId);
    }

    @Override
    public void updateBoard(BoardDTO board) {
        sqlSession.update(NAMESPACE + ".updateBoard", board);
    }

    @Override
    public void deleteBoard(int b_id) {
        sqlSession.delete(NAMESPACE + ".deleteBoard", b_id);
    }
}
