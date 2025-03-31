package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.WorkDTO;
import com.kedu.services.WorkService;

@Controller
@RequestMapping("/work")
public class WorkController {

    @Autowired
    private WorkService workService;

    @PostMapping("/update")
    public String updateStandardTime(@ModelAttribute WorkDTO dto) {
        workService.updateWorkTime(dto);
        return "redirect:/work/page"; // ���𷺼�
    }

    @PostMapping(value = "/generateAnnual", produces = "application/json; charset=UTF-8")
    public ResponseEntity<String> generateAnnual(@RequestBody AnnualLeaveDTO dto) {
        try {
            workService.createAnnualLeaveRule(dto);
            System.out.println(dto.getLeave_days()+" : "+dto.getYears_of_service());
            return ResponseEntity.ok("������ ���������� �����Ǿ����ϴ�.");
        } catch (Exception e) {
            e.printStackTrace();  // ���� �α׿� ���� ���
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("���� ������ �����߽��ϴ�. " + e.getMessage());
        }
    }
    
    @ResponseBody
    @RequestMapping("/selectAll")
    public List<AnnualLeaveDTO> selectAll(Model model){
    	List<AnnualLeaveDTO> list = workService.selectAll();
    	return list;
    }


    @GetMapping("/page")
    public String workPage() {
        return "work.jsp";
    }
}
