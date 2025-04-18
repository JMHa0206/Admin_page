package com.kedu.home;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kedu.dto.CompanyDTO;
import com.kedu.services.CompanyService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CompanyService cServ;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String adminHome(@RequestParam(value = "menu", required = false, defaultValue = "basement") String menu, 
                            Model model) {
        model.addAttribute("menu", menu);

        if ("basement".equals(menu)) {
            model.addAttribute("company", cServ.getCompany()); // 단일 데이터 조회
        }

        return "admin/home";
    }

    @RequestMapping(value = "/company/update", method = RequestMethod.POST)
    public String updateCompany(
            @RequestParam("comName") String name,
            @RequestParam(value = "logoFile", required = false) MultipartFile logoFile,
            HttpServletRequest request) throws Exception {
    	
        System.out.println("✅ [Controller] updateCompany 호출됨");
        System.out.println("회사명: " + name);
        System.out.println("파일 있음? " + (logoFile != null && !logoFile.isEmpty()));
        CompanyDTO dto = new CompanyDTO();
        dto.setComId(1); // ✅ 무조건 고정된 ID 사용
        dto.setComName(name);

        if (logoFile != null && !logoFile.isEmpty()) {
            String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
            String fileName = "logo.png"; // 고정 파일명

            File saveFile = new File(uploadPath, fileName);
            logoFile.transferTo(saveFile);

            dto.setLogoPath("/resources/upload/" + fileName);
        } else {
            dto.setLogoPath(cServ.getCompany().getLogoPath());
        }

        cServ.updateCompany(dto);
        System.out.println("✅ [Controller] 서비스 계층으로 전달 완료");
        return "redirect:/admin/home?menu=basement";
    }
}
