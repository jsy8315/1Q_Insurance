package hana.hanafinal.mypage;

import lombok.Data;
import java.util.Date;

@Data
public class MypageDTO {
    private int myproductId;
    private int userId;
    private String insuranceproductid;
    private int status;
    private Date myproductmemberdate;

    //필드 새롭게 추가하기(마이페이지 조회용)
    private String insurancecompanyname;  //보험회사명
    private String insurancetype;          //보험유형
    private String insurancescope;         //보장항목
    private String insurancename;         //보험상품명
    private String insurancecontent;       //보장내용
    private int insurancefee;              //보험료
    private double insurancerating;        //별점
    private String insurancereview;        //리뷰
}
