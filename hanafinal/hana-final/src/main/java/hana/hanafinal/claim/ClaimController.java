package hana.hanafinal.claim;

import hana.hanafinal.diagnosis.DiagnosisDTO;
import hana.hanafinal.diagnosis.DiagnosisMapper;
import hana.hanafinal.diagnosis.DiagnosisService;
import hana.hanafinal.ocr.OcrDTO;
import hana.hanafinal.predict.PredictDTO;
import hana.hanafinal.recommend.InsuranceProductDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static hana.hanafinal.claim.FileUploadUtil.saveFile;

@Controller
@RequiredArgsConstructor
public class ClaimController {
    private final ClaimService claimService;

    private final DiagnosisService diagnosisService;

    @GetMapping("/claim01")
    public String predictPage() {

        return "/claim01";
    }
    @ResponseBody
    @GetMapping("/getMyProducts")
    public List<ClaimDTO> getMyProducts(@RequestParam int userId) {
        return claimService.getMyProducts(userId);
    }

    @RequestMapping(value="/insertClaim", method= RequestMethod.POST)
    public String insertClaim(
            @RequestParam("insuranceProductId") String insuranceProductId,
            @RequestParam("place") String place,
            @RequestParam("claimContent") String claimContent,
            @RequestParam("selectedDate") String  selectedDate,
            @RequestParam("bank") String bank,
            @RequestParam("accountNumber") String accountNumber
    ) {
        ClaimDTO02 claimDTO02 = new ClaimDTO02();
        claimDTO02.setInsuranceProductId(insuranceProductId);
        claimDTO02.setPlace(place);
        claimDTO02.setClaimContent(claimContent);
        claimDTO02.setSelectedDate(selectedDate); // selectedDate 형변환 필요할 수 있음
        claimDTO02.setBank(bank);
        claimDTO02.setAccountNumber(accountNumber);

        claimService.insertClaim(claimDTO02);

        return "claim02";
    }
    @RequestMapping(value="/showClaim02", method=RequestMethod.GET)
    public String showClaim02Page() {
        return "claim02";
    }

    @PostMapping("/fetchData")
    public ModelAndView fetchData(@RequestParam String startdate, @RequestParam String enddate) {
        // 여기서 다른 서버로 데이터를 전송하고 응답을 받음
        // RestTemplate/ 다른 HTTP 클라이언트 라이브러리를 사용하여 요청을 보내기 가능
        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = new HashMap<>();
        params.put("startdate", startdate);
        params.put("enddate", enddate);

        List<HistoryDTO> histories = restTemplate.postForObject("http://localhost:8081/board/hopitalhistory", params, List.class);

        ModelAndView mv = new ModelAndView("claim02");
        mv.addObject("histories", histories);

        return mv;
    }
    @PostMapping("/claim03")
    public String handleClaim(HttpServletRequest request, @RequestParam String selectedHistory, Model model) {
        // 여기서 selectedHistory는 선택된 hospitalhistoryid

        // ClaimService 호출
        claimService.updateHospitalHistoryId(selectedHistory);

        // claimstatus 컬럼이 1인 행들의 정보 조회
        List<ClaimDTO03> claimsWithStatusOne = claimService.getClaimsWithStatusOne();

        model.addAttribute("claimsWithStatusOne", claimsWithStatusOne);

        return "claim03";  //
    }
    //OCR로 데이터 가져오기
    @RequestMapping(value = "/claim/submit", method = RequestMethod.POST)
    public String handleClaimSubmit(@RequestParam("diagnosisImage") MultipartFile diagnosisImage,
                                          @RequestParam("hospitalizationImage") MultipartFile hospitalizationImage) throws IOException {
        try {
            // 파일 처리 로직 (저장 등)
            String diagnosisImagePath = saveFile(diagnosisImage);
            String hospitalizationImagePath = saveFile(hospitalizationImage);

            claimService.saveImagePath(diagnosisImagePath, hospitalizationImagePath);

            OcrDTO ocrDTO = claimService.getReadDiagnosis(diagnosisImagePath);

            DiagnosisDTO diagnosisDTO = new DiagnosisDTO();
            diagnosisDTO.setDiagnosisname(ocrDTO.getDiagnosisname());
            diagnosisDTO.setDiagnosisssn(ocrDTO.getDiagnosisssn());
            diagnosisDTO.setDiagnosismain(ocrDTO.getDiagnosismain());
            diagnosisDTO.setDiagnosismaincode(ocrDTO.getDiagnosismaincode());
            diagnosisDTO.setDiagnosisside01(ocrDTO.getDiagnosisside01());
            diagnosisDTO.setDiagnosisside01code(ocrDTO.getDiagnosisside01code());
            diagnosisDTO.setDiagnosisside02(ocrDTO.getDiagnosisside02());
            diagnosisDTO.setDiagnosisside02code(ocrDTO.getDiagnosisside02code());
            diagnosisDTO.setDiagnosissurgery(ocrDTO.getDiagnosissurgery());
            diagnosisDTO.setDiagnosisdepartment(ocrDTO.getDiagnosisdepartment());
            diagnosisDTO.setDiagnosisdate(ocrDTO.getDiagnosisdate());

            // DiagnosisService를 사용하여 데이터베이스를 업데이트
            diagnosisService.updateDiagnosis(diagnosisDTO);

            return "claim04";

        } catch (Exception e) {
            e.printStackTrace();
            return "claim03";
        }
    }
}
