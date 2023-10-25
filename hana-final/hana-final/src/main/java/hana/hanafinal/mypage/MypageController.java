package hana.hanafinal.mypage;

import hana.hanafinal.admin.AdminDTO;
import hana.hanafinal.claim.ClaimDTO;
import hana.hanafinal.claim.ClaimDTO02;
import hana.hanafinal.claim.ClaimDTO04;
import hana.hanafinal.claim.ClaimService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class MypageController {

    private final MypageService mypageService;
    private final ClaimService claimService;

    @GetMapping("/mypage")
    public String openMypageHome(Model model) {
        List<MypageDTO> list = mypageService.findAll();
        model.addAttribute("list", list);

        List<ClaimDTO04> claimList = claimService.getMyClaims(3); // userId를 3으로 하드코딩
        model.addAttribute("claimList", claimList);

        return "/mypage";
    }
}