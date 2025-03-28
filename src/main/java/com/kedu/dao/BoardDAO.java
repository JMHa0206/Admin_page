package com.kedu.dao;

import java.util.List;
import com.kedu.dto.BoardDTO;

public interface BoardDAO {

    void insertBoard(String boardName);              // �Խ��� ����
    List<BoardDTO> selectAllBoards();              // ��ü �Խ��� ��ȸ
    BoardDTO selectBoardById(int boardId);         // �Խ��� �ܰ� ��ȸ
    void updateBoard(BoardDTO board);              // �Խ��� ���� ����
    void deleteBoard(int boardId);                 // �Խ��� ���� (�� or ����)
}
