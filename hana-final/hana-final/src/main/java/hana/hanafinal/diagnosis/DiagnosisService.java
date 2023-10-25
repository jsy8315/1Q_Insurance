package hana.hanafinal.diagnosis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiagnosisService {
    @Autowired
    DiagnosisMapper diagnosisMapper;
    public void updateDiagnosis(DiagnosisDTO diagnosisDTO) {
        diagnosisMapper.updateDiagnosis(diagnosisDTO);
    }
}
