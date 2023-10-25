package hana.hanafinal.admin;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    //로그인 페이지
    @GetMapping("/adminLogin")
    public String openAdminLogin() {
        return "/adminLogin";
    }

    //로그인 홈 페이지
    @GetMapping("/adminHome")
    public String openAdminHome() {
        return "/adminHome";
    }

    //등록 보험 상품 조회하기
    @RequestMapping("/adminProductTable")
    public String openAdminProductTable(Model model) {
        List<AdminDTO> list = adminService.findAll();
        model.addAttribute("list", list);
        return "/adminProductTable";
    }

    //보험 상품 등록하기
    @GetMapping("/adminAddProduct")
    public String openAdminAddProduct() {
        return "/adminAddProduct";
    }

    //가입 심사
    @GetMapping("/adminJoinScreen")
    public String openAdminJoinScreen(Model model) {
        model.addAttribute("joins", adminService.getJoinRequests());
        return "/adminJoinScreen";
    }
    //보험 상품 가입 심사 본편
    @GetMapping("/reviewJoin")
    public String reviewJoin(@RequestParam("myproductId") int myproductId, Model model) {

        List<AdminDTO05> targetusers = adminService.getUsersBymyproductId(myproductId);
        model.addAttribute("targetusers", targetusers);

        List<AdminDTO07> targetinsuranceproducts = adminService.getInsuranceProductsBymyproductId(myproductId);
        model.addAttribute("targetinsuranceproducts", targetinsuranceproducts);

        List<AdminDTO06> targetbiowallet = adminService.getBiowalletBymyproductId(myproductId);
        model.addAttribute("targetbiowallet", targetbiowallet);

        AdminDTO08 processedData = adminService.processJoin(myproductId);
        model.addAttribute("processedData", processedData);

        adminService.updateMyProduct(myproductId);

        return "/adminJoinScreen02";
    }

    //보험금 청구 심사
    @GetMapping("/adminChargeScreen")
    public String openAdminChargeScreen(Model model) {
        model.addAttribute("claims", adminService.getClaimRequests());
        return "/adminChargeScreen";
    }

    //클릭하여 청구 본격적으로 고고
    @GetMapping("/reviewClaim")
    public String reviewClaim(@RequestParam("claimId") int claimId, Model model) {

        List<AdminDTO> claims = adminService.getClaimById(claimId);
        model.addAttribute("claims", claims);

        List<AdminDTO02> diagnosis = adminService.getDiagnosisByClaimId(claimId);  // 새로운 코드
        model.addAttribute("diagnosis", diagnosis);

        AdminDTO03 processedData = adminService.processClaimsAndDiagnosis(claimId);
        model.addAttribute("processedData", processedData);

        return "/adminChargeScreen02";
    }
    

}
