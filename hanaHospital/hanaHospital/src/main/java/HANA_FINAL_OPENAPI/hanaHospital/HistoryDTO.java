package HANA_FINAL_OPENAPI.hanaHospital;

import lombok.Data;

import java.util.Date;
@Data
public class HistoryDTO {
    private String hospitalhistoryid;
    private String hospitalphonenumber;
    private Date treatmentdate;
    private String treatmentdepartment;
    private int treatmentfee;
}
