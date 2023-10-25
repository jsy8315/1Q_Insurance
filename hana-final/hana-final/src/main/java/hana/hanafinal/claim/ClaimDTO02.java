package hana.hanafinal.claim;

import lombok.Data;

@Data
public class ClaimDTO02 {
    private String insuranceProductId;
    private String place;
    private String claimContent;
    private String selectedDate;
    private String bank;
    private String accountNumber;
}
