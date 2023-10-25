package hana.hanafinal.ocr;

import lombok.Data;

@Data
public class OcrDTO {
    private String diagnosisid; // OCR 진단서 ID
    private String diagnosisname; // OCR 환자 성명
    private String diagnosisssn; // OCR 환자 주민등록번호
    private String diagnosismain; // OCR 주 진단명

    private String diagnosisside01; // OCR 부 진단명01

    private String diagnosisside02; // OCR 부 진단명02

    private String diagnosismaincode; // OCR 주 진단명 코드

    private String diagnosisside01code; // OCR 부 진단명 코드01

    private String diagnosisside02code; // OCR 부 진단명 코드02

    private String diagnosissurgery; // OCR 수술명

    private String diagnosisdepartment; // OCR 진료과
    private String diagnosisdate; // OCR 진단일


}

