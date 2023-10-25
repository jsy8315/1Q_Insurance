package hana.hanafinal.recommend;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class RecommendController {
    private final RecommendService recommendService;
    @GetMapping("/recommend")
    public String recommendPage(Model model) {
        int userId = 3;  // userId를 하드코딩
        Map<String, Integer> resultMap = recommendService.getScoresByUserId(userId);

        List<String> keys = new ArrayList<>(resultMap.keySet());
        model.addAttribute("keys", keys);

        // Score Name의 첫번째, 두번째, 세번째, 네번째 키값에 따라 추천 상품 리스트를 가져온다.
        List<InsuranceProductDTO> firstProducts = recommendService.getRecommendedProducts((String) resultMap.keySet().toArray()[0]);
        List<InsuranceProductDTO> secondProducts = recommendService.getRecommendedProducts((String) resultMap.keySet().toArray()[1]);
        List<InsuranceProductDTO> thirdProducts = recommendService.getRecommendedProducts((String) resultMap.keySet().toArray()[2]);
        List<InsuranceProductDTO> fourthProducts = recommendService.getRecommendedProducts((String) resultMap.keySet().toArray()[3]);

        model.addAttribute("resultMap", resultMap);
        model.addAttribute("firstProducts", firstProducts);
        model.addAttribute("secondProducts", secondProducts);
        model.addAttribute("thirdProducts", thirdProducts);
        model.addAttribute("fourthProducts", fourthProducts);

        return "/recommend";  // recommend.jsp 페이지로 이동
    }

}
