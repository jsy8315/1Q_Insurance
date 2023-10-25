package hana.hanafinal.admin;

import lombok.Data;

@Data
public class AdminDTO {
    private String insuranceproductid;    //보험상품ID
    private String insurancecompanyname;  //보험회사명
    private String insurancetype;          //보험유형
    private String insurancescope;         //보장항목
    private String insurancename;         //보험상품명
    private String insurancecontent;       //보장내용
    private int insurancefee;              //보험료
    private double insurancerating;        //별점
    private String insurancereview;        //리뷰

    //보험금 청구 테이블 claim
    private int claimid;                   //청구ID
    private String myproductid;            //나의상품ID
    private String claimdate;              //청구일자
    private String claimstatus;            //청구상태
    private String claimbank;              //청구은행
    private String claimaccount;           //청구계좌
}
