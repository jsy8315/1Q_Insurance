package hana.hanafinal.admin;

import lombok.Data;
//Users 테이블 조회
@Data
public class AdminDTO05 {
    private String id;            //회원ID
    private String name;          //회원이름
    private String loginid;      //회원 휴대전화번호
    private String useremail;         //회원 이메일
    private String ssn = "7306061187922";          //회원 주민번호
}
