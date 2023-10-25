package hana.hanafinal.diagnosis;

import lombok.Data;

@Data
public class DiagnosisDTO {
    private int diagnosisid;     //진단서번호
    private String diagnosisname;   //환자성명
    private String diagnosisssn;    //환자주민등록번호
    private String diagnosismain;    //주진단명
    private String diagnosismaincode;    //주진단코드
    private String diagnosisside01;    //부진단명01
    private String diagnosisside01code;    //부진단코드01
    private String diagnosisside02;    //부진단명02
    private String diagnosisside02code;    //부진단코드02
    private String diagnosissurgery;    //수술명
    private String diagnosisdepartment;    //진료과
    private String diagnosisdate;    //진료일자
}
