package hana.hanafinal.claim;

import lombok.Data;

@Data
public class ClaimDTO03 {
    private int claimid;
    private int myproductId;
    private String claimcontent;
    private String claimplace;
    private String claimdate;
    private String claimbank;
    private String claimaccount;
    private int claimstatus;
    private String hospitalhistoryid;

}
