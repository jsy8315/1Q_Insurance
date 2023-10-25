package hana.hanafinal.predict;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class PredictController {

    private final PredictService predictService;
    @GetMapping("/predict01")
    public String predictPage() {

        return "/predict01";
    }

    @GetMapping("/predict02")
    public String handlePredictPage02(Model model, HttpSession session) {
        //세션 사용 : predict02에서 처리한 데이터를 predict03로 전달하기 위해서

        RestTemplate restTemplate = new RestTemplate();
        //RestTemplate 객체 생성, 다른 서버에 HTTP 요청을 보내고 응답을 받기 위해 사용

        String uri = "http://localhost:8081/board/hospitalCheck";

        ResponseEntity<Map> response = restTemplate.getForEntity(uri, Map.class);
        //ResponseEntity<Map>: HTTP 응답 코드, 헤더, 본문 등을 모두 포함한 HTTP 응답을 나타냄
        // 본문은 Map 형태

        Map<String, Object> hospitalData = response.getBody();
        model.addAttribute("hospitalData", hospitalData);
        //----여기까지 hana hospital을 통한 응답 처리, hospitalData로 저장함--------------

        // 서비스를 통해 데이터를 처리하고, DTO에 담기
        PredictDTO predictDTO = predictService.processHospitalData(hospitalData);

        model.addAttribute("predictDTO", predictDTO);

        // 세션에 PredictDTO 저장
        session.setAttribute("predictDTO", predictDTO);
        return "predict02";
    }
    @GetMapping("/predict03")
    public String showPredict03Page(Model model, HttpSession session) {
        // 세션에서 PredictDTO 객체를 가져옴
        PredictDTO predictDTO = (PredictDTO) session.getAttribute("predictDTO");

        // 모델에 PredictDTO 객체를 추가
        model.addAttribute("predictDTO", predictDTO);

        return "predict03";
    }

    @PostMapping ("/predict04")
    public String handlePredict04Page(@ModelAttribute PredictDTO predictDTO) {
        predictService.updatePredictData(predictDTO);

        return "predict04";
    }
}
