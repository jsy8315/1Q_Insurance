package hana.hanafinal.join;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequiredArgsConstructor
public class JoinController {

    private final JoinMapper joinMapper;

    @PostMapping("/productJoin")
    public String joinInsurance(@RequestParam("insuranceproductid") String insuranceProductId) {
        joinMapper.insertMyProduct(insuranceProductId); // 데이터 삽입

        // 작업 완료 후 다른 페이지로 리다이렉트, 다른 페이지로 리다이렉트할 필요가 있을까?
        return "home";
    }
}
