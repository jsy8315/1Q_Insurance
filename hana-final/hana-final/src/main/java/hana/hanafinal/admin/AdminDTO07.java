package hana.hanafinal.admin;

import lombok.Data;

//InsuranceProduct 테이블 조회
@Data
public class AdminDTO07 {
    private String insuranceproductid;  //보험상품ID
    private String insurancecompanyname;  //보험회사명
    private String insurancetype;  //보험상품유형
    private String insurancescope;  //보장항목
    private String insurancename;  //보험상품명
    private String insurancecontent;  //보장내용
    private String insurancefee;  //보험료

}
