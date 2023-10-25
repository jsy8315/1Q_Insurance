package hana.hanafinal.diagnosis;

import hana.hanafinal.claim.ClaimService;
import hana.hanafinal.ocr.OcrDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/*@RestController
public class DiagnosisController {
    @Autowired
    private DiagnosisService diagnosisService;

    @Autowired
    private ClaimService claimService;

    @PostMapping("/update-diagnosis")
    public String updateDiagnosis(@RequestBody String filePath) {
        try {
            // ClaimService를 사용하여 OCR로부터 데이터를 받아와 OcrDTO를 얻음
            OcrDTO ocrDTO = claimService.getReadDiagnosis(filePath);

            if (ocrDTO == null) {
                return "OCR data is null";
            }

            // OcrDTO를 사용하여 DiagnosisDTO를 만든다.
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

            return "Update Successful";
        } catch (Exception e) {
            e.printStackTrace();
            return "Update Failed: " + e.getMessage();
        }
    }
}
*/
