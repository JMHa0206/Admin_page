
package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.BoardDTO;
import com.kedu.services.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	public BoardService bServ;
	
	@RequestMapping("/insert")
	public String insertBoard(String boardName) {
		bServ.insertBoard(boardName);
		return "redirect:/admin/home?menu=board";
	}
	
	
	@RequestMapping("/updateBoard")
	public String updateBoard(BoardDTO bDto) {
		bServ.updateBoard(bDto);
		return "redirect:/admin/home?menu=board";
	}
	
	@RequestMapping("/deleteBoard")
	public String deleteBoard(int b_id) {
		bServ.deleteBoard(b_id);
		return "redirect:/admin/home?menu=board";
	}
	
	@ResponseBody
	@RequestMapping("/selectAllBoards")
	public List<BoardDTO> selectAllBoards(Model model) {
		List<BoardDTO> boardList = bServ.selectAllBoards();
		
		return boardList;
	}

}

