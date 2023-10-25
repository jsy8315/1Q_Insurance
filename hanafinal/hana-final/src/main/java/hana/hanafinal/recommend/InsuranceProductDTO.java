package hana.hanafinal.recommend;

import lombok.Data;

@Data
public class InsuranceProductDTO {
    private String insuranceproductid;      //보험상품ID
    private String insurancecompanyname;  //보험회사명
    private String insurancetype;          //보험유형
    private String insurancescope;         //보장항목
    private String insurancename;         //보험상품명
    private String insurancecontent;       //보장내용
    private int insurancefee;              //보험료
    private double insurancerating;        //별점
    private String insurancereview;        //리뷰
}
