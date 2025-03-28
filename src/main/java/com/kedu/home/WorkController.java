package com.kedu.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "redirect:/work/page"; // 리디렉션
    }

    @PostMapping("/generateAnnual")
    @ResponseBody
    public String generateAnnual(@RequestParam("empId") int empId) {
        workService.generateAnnualLeave(empId);
        return "연차 생성 완료";
    }

    @GetMapping("/page")
    public String workPage() {
        return "work.jsp";
    }
}
