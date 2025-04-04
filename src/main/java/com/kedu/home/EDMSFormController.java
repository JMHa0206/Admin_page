package com.kedu.home;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.kedu.dto.EDMSFormDTO;
import com.kedu.services.EDMSFormService;

@Controller
@RequestMapping("/form")
public class EDMSFormController {

    private final EDMSFormService edmsFormService;

    public EDMSFormController(EDMSFormService edmsFormService) {
        this.edmsFormService = edmsFormService;
    }

    // ✅ 등록 처리
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String createForm(EDMSFormDTO form) {
        System.out.println("양식명: " + form.getFormName());
        System.out.println("양식유형: " + form.getFormType());
        System.out.println("양식내용(HTML): " + form.getFormContent());

        edmsFormService.createForm(form);
        return "redirect:/form/manage"; // 등록 후 목록 조회로 리디렉트
    }

    // ✅ 전체 조회 (뷰 반환용)
    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public String showFormList(Model model) {
        List<EDMSFormDTO> formList = edmsFormService.getAllForms();
        System.out.println("조회된 양식 개수: " + formList.size()); // 디버깅
        model.addAttribute("formList", formList);
        return "include/EDMS_main"; // JSP 파일명 (네가 작성한 등록/조회 통합 뷰)
    }
    
    @RequestMapping(value = "/api/list", method = RequestMethod.GET)
    @ResponseBody
    public List<EDMSFormDTO> getFormListForAjax() {
        List<EDMSFormDTO> list = edmsFormService.getAllForms();
        for (EDMSFormDTO dto : list) {
            System.out.println("✔ formId: " + dto.getFormId());
            System.out.println("✔ formName: " + dto.getFormName());
        }
        return list;
    }


    // ✅ 단건 조회 (AJAX 미리보기 등)
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public EDMSFormDTO getForm(@PathVariable("id") int id) {
        return edmsFormService.getFormById(id);
    }

    // ✅ 수정 처리
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String updateForm(EDMSFormDTO form) {
        edmsFormService.updateForm(form);
        return "include/EDMS_main";
    }

    // ✅ 삭제 처리
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String deleteForm(@PathVariable("id") int id) {
        edmsFormService.deleteForm(id);
        return "success";
    }
}
