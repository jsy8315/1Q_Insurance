package hana.hanafinal.family;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FamilyController {
    @GetMapping( "/myFamily")
    public String myFamily() {
        // 로직 추가 (필요한 경우)
        return "/myFamily";
    }
}
