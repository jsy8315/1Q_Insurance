package hana.hanafinal.claim;

import lombok.Data;

import java.util.Date;
@Data
public class HistoryDTO {
    private String startdate;
    private String enddate;
    private String hospitalhistoryid;
    private String hospitalphonenumber;
    private Date treatmentdate;
    private String treatmentdepartment;
    private int treatmentfee;
}
