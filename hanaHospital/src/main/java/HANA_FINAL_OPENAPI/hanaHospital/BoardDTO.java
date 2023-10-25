package HANA_FINAL_OPENAPI.hanaHospital;

import lombok.Data;

@Data
public class BoardDTO {
    private String hospitalId;
    private String hospitalName;
    private String hospitalPhonenumber;
    private  int sex;
    private int age;
    private int height;
    private int weight;
    private int waistline;
    private int sbp;
    private int dbp;
    private int fbg;
    private int tc;
    private int tg;
    private int hdl;
    private int ldl;
    private double hb;
    private int ast;
    private int alt;
    private int alp;
    private int ggtp;
    private double serumcreatinine;
    private double bilirubin;
    private double albumin;
    private double prothrombintime;
    private double totalprotein;
    private int smoking;
    private int drinking;
    private double hba1c;
    private double wbccount;
    private int plateletcount;
    private double creatinine;
    private int egfr;
    private int bun;
    private double freet4;
    private int t3;
    private double tsh;
    private int ketoneurine;
    private double phurine;
    private int proteinurine;
    private int fvc;
    private int fev1;
    private int fev1fvc;
    private double pbdtest;
}
