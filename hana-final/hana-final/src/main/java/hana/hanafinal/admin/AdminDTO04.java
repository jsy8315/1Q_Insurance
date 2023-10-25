package hana.hanafinal.admin;

import lombok.Data;

//MyProduct 테이블 조회
@Data
public class AdminDTO04 {
    private String myproductid;            //나의상품ID
    private String userid;                 //회원ID
    private String insuranceproductid;  //보험상품ID
    private String myproductmemberdate; //가입일자
}
