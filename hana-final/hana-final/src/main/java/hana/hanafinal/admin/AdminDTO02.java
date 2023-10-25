package hana.hanafinal.admin;

import lombok.Data;

@Data
public class AdminDTO02 {
    private int diagnosisid;
    private String diagnosisname;           //환자성명
    private String diagnosisssn;            //환자주민번호
    private String diagnosismain;           //주상병명
    private String diagnosismaincode;       //주상병코드
    private String diagnosisside01;         //부상병명01
    private String diagnosisside01code;     //부상병코드01
    private String diagnosisside02;         //부상병명02
    private String diagnosisside02code;     //부상병코드02
    private String diagnosissurgery;        //수술명
    private String diagnosisdepartment;     //진료과
    private String diagnosisdate;           //진료일자

}
