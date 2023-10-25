package HANA_FINAL_OPENAPI.hanaHospital;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/hospitalCheck")
    public ResponseEntity<Map<String, Object>> getHospitalCheckData() {
        //원큐보험 서비스의 GET 요청을 받으면 이 메소드가 실행
        Map<String, Object> data = boardService.getHospitalCheckData();
        // boardService.getHospitalCheckData() 메소드를 호출

        return new ResponseEntity<>(data, HttpStatus.OK);
    }
    @PostMapping("/hopitalhistory")
    public ResponseEntity<List<HistoryDTO>> getHistory(@RequestBody Map<String, String> params) {
        String startdate = params.get("startdate");
        String enddate = params.get("enddate");

        List<HistoryDTO> histories = boardService.fetchHistories(startdate, enddate);
        return ResponseEntity.ok(histories);
    }
}
