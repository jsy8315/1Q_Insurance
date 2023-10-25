package hana.hanafinal.member;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class MemberResponse {
    private Long id;
    private String name;
    private String loginId;
    private String password;
    private String user_email;
    private String user_account;

    public void clearPassword() {
        this.password = "";
    }
}
