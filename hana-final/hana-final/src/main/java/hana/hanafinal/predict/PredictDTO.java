package hana.hanafinal.predict;

import lombok.Data;

import java.util.Map;
import java.util.Objects;

@Data
public class PredictDTO {
    private Map<String, Object> hospitalData;
    private int dg01Score;  //뇌혈관질환
    private int dg02Score;  //심장질환
    private int dg03Score;  //고혈압
    private int dg04Score;  //당뇨병
    private int dg05Score;  //신장질환
    private int dg06Score;  //만성호흡기질환
    private int dg07Score;  //간질환
    private int dg08Score;  //갑상선질환

}
