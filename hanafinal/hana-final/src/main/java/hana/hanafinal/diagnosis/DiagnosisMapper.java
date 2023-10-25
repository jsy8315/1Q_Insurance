package hana.hanafinal.diagnosis;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiagnosisMapper {
    //진단서 OCR 결과를 Diagnosis 테이블에 저장하는 Mapper
    void updateDiagnosis(DiagnosisDTO diagnosisDTO);
}
