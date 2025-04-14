package com.kedu.home;

import java.beans.PropertyEditorSupport;
import java.sql.Time;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.DepartDTO;
import com.kedu.dto.MemberDTO;
import com.kedu.dto.WorkDisplayDTO;
import com.kedu.dto.WorkingHoursDTO;
import com.kedu.services.WorkService;
// 조휘영
@Controller
@RequestMapping("/work")
public class WorkController {

    @Autowired
    private WorkService workService;



    @PostMapping(value = "/generateAnnual", produces = "application/json; charset=UTF-8")
    public ResponseEntity<String> generateAnnual(@RequestBody AnnualLeaveDTO dto) {
        try {
            workService.createAnnualLeaveRule(dto);
            System.out.println(dto.getLeave_days()+" : "+dto.getYears_of_service());
            return ResponseEntity.ok("연차가 성공적으로 생성되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();  // 서버 로그에 에러 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("연차 생성에 실패했습니다. ");
        }
    }
    
    @ResponseBody
    @RequestMapping("/selectAll")
    public List<AnnualLeaveDTO> selectAll(){
    	List<AnnualLeaveDTO> list = workService.selectAll();
    	return list;
    }
   
    @ResponseBody
    @RequestMapping(value = "/department", produces = "application/json; charset=UTF-8")
    public List<DepartDTO> selectAllDept(){
    	List<DepartDTO> list = workService.selectAllDept();
    	return list;
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/employee", produces = "application/json; charset=UTF-8")
    public List<MemberDTO> selectAllEmpl(){
    	List<MemberDTO> list = workService.selectAllEmpl();
    	return list;
    }
    

    @PostMapping("/setWorkHours")
    public String setWorkHours(@RequestParam(required = false) String standardCheckIn,
            @RequestParam(required = false) String standardCheckOut,
            @ModelAttribute WorkingHoursDTO whdto) {
    	
    	if (standardCheckIn != null) {
            whdto.setStandardCheckIn(Time.valueOf(standardCheckIn + ":00"));
        }

        if (standardCheckOut != null) {
            whdto.setStandardCheckOut(Time.valueOf(standardCheckOut + ":00"));
        }

        workService.setWorkHours(whdto);
        return "redirect:/admin/home?menu=work";
    }
    
    // 정시 출퇴근 출력
    @ResponseBody
    @GetMapping("/workHoursByDept")
    public List<WorkDisplayDTO> getWorkHoursByDept(@RequestParam("deptId") Integer deptId) {
        return workService.getWorkHoursByDept(deptId);
    }
    
    @GetMapping("/page")
    public String workPage(Model model) {
        List<DepartDTO> departments = workService.getDeptListForDropdown();
        model.addAttribute("departments", departments);
        return "/admin/home?menu=work";
    }
    
    // 시간값 변환시켜줌
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Time.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if (text != null && !text.isEmpty()) {
                    setValue(Time.valueOf(text + ":00"));
                }
            }
        });
    }


//    @GetMapping("/page")
//    public String workPage() {
//        return "work.jsp";
//    }
}
