package hana.hanafinal.predict;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service  //이 클래스가 서비스 클래스임을 스프링부트에게 알림
public class PredictService {

    @Autowired
    private PredictMapper predictMapper;

    // hospitalData를 처리하고, PredictDTO 객체를 반환하는 메서드
    public PredictDTO processHospitalData(Map<String, Object> hospitalData) {
        PredictDTO predictDTO = new PredictDTO(); // PredictDTO 객체를 생성
        predictDTO.setHospitalData(hospitalData); // PredictDTO에 hospitalData를 설정

        //뇌혈관질환
        int dg01Score = 0;  // DG01 점수를 저장할 변수, 초기값은 0

        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int sex = (int) hospitalData.getOrDefault("sex", 1000);
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            int sbp = (int) hospitalData.getOrDefault("sbp", 1000);
            int dbp = (int) hospitalData.getOrDefault("dbp", 1000);
            int tc = (int) hospitalData.getOrDefault("tc", 1000);
            int tg = (int) hospitalData.getOrDefault("tg", 1000);
            int hdl = (int) hospitalData.getOrDefault("hdl", 1000);
            int ldl = (int) hospitalData.getOrDefault("ldl", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //bp점수, 전체 비중 10%
            int bpScore = 0;

            if (sbp < 120 && dbp < 80) {   //정상범위
                bpScore = 10;
            } else if (((sbp >= 120) && (140 > sbp)) || ((dbp >= 80) && (90 > dbp))) {   //저위험군
                bpScore = 30;
            } else if (((sbp >= 140) && (160 > sbp)) || ((dbp >= 90) && (100 > dbp))) {   //중위험군
                bpScore = 50;
            } else if ((sbp >= 160) || (dbp >= 100)) {   //고위험군
                bpScore = 70;
            }else {                        //초고위험군
                bpScore =  90;
            }

            //tc 점수, 전체비중 5%
            int tcScore = 0;

            if (tc < 180) {   //정상범위
                tcScore = 10;
            } else if ((tc >= 180) && (tc < 200)) {   //저위험군
                tcScore = 30;
            } else if ((tc >= 200) && (tc < 220)) {   //중위험군
                tcScore = 50;
            } else if ((tc >= 220) && (tc < 240)) {   //고위험군
                tcScore = 70;
            }else {                        //초고위험군
                tcScore =  90;
            }

            //tg 점수, 전체비중 5%
            int tgScore = 0;

            if (tg < 150) {   //정상범위
                tgScore = 20;
            } else if ((tg >= 150) && (tg < 175)) {   //저위험군
                tgScore = 40;
            } else if ((tg >= 175) && (tg < 200)) {   //중위험군
                tgScore = 60;
            } else {                        //고위험군
                tgScore =  80;
            }

            //hdl 점수, 전체비중 5%
            int hdlScore = 0;

            if (hdl >= 60) {   //정상범위
                hdlScore = 10;
            } else if ((hdl >= 55) && (hdl < 60)) {   //저위험군
                hdlScore = 30;
            } else if ((hdl >= 50) && (hdl < 55)) {   //중위험군
                hdlScore = 50;
            } else if ((hdl >= 45) && (hdl < 50)) {   //고위험군
                hdlScore = 70;
            }else {                        //초고위험군
                hdlScore =  90;
            }

            //ldl 점수, 전체비중 5%
            int ldlScore = 0;

            if (ldl <130) {   //정상범위
                ldlScore = 10;
            } else if ((ldl >= 130) && (ldl < 140)) {   //저위험군
                ldlScore = 30;
            } else if ((ldl >= 140) && (ldl < 150)) {   //중위험군
                ldlScore = 50;
            } else if ((ldl >= 150) && (ldl < 160)) {   //고위험군
                ldlScore = 70;
            }else {                        //초고위험군
                ldlScore =  90;
            }

            //음주 점수, 전체비중 10%
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //흡연 점수, 전체비중 10%
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  0;
            }


            // 조건을 확인하여 dg01Score 값을 설정
            dg01Score = (int) ((0.2 * ageScore) +
                                (0.1 * bmiScore) +
                                (0.1 * waistlineScore) +
                                (0.2 * bpScore) +
                                (0.05 * tcScore) +
                                (0.05 * tgScore) +
                                (0.05 * hdlScore) +
                                (0.05 * ldlScore) +
                                (0.1 * drinkingScore) +
                                (0.1 * smokingScore));
        }

        predictDTO.setDg01Score(dg01Score); // PredictDTO에 dg01Score를 설정

        //심장질환
        int dg02Score = 0;  // DG02 점수를 저장할 변수, 초기값은 0

        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int sex = (int) hospitalData.getOrDefault("sex", 1000);
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            int sbp = (int) hospitalData.getOrDefault("sbp", 1000);
            int dbp = (int) hospitalData.getOrDefault("dbp", 1000);
            int tc = (int) hospitalData.getOrDefault("tc", 1000);
            int tg = (int) hospitalData.getOrDefault("tg", 1000);
            int hdl = (int) hospitalData.getOrDefault("hdl", 1000);
            int ldl = (int) hospitalData.getOrDefault("ldl", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //bp점수, 전체 비중 10%
            int bpScore = 0;

            if (sbp < 120 && dbp < 80) {   //정상범위
                bpScore = 10;
            } else if (((sbp >= 120) && (140 > sbp)) || ((dbp >= 80) && (90 > dbp))) {   //저위험군
                bpScore = 30;
            } else if (((sbp >= 140) && (160 > sbp)) || ((dbp >= 90) && (100 > dbp))) {   //중위험군
                bpScore = 50;
            } else if ((sbp >= 160) || (dbp >= 100)) {   //고위험군
                bpScore = 70;
            }else {                        //초고위험군
                bpScore =  90;
            }

            //tc 점수, 전체비중 5%
            int tcScore = 0;

            if (tc < 180) {   //정상범위
                tcScore = 10;
            } else if ((tc >= 180) && (tc < 200)) {   //저위험군
                tcScore = 30;
            } else if ((tc >= 200) && (tc < 220)) {   //중위험군
                tcScore = 50;
            } else if ((tc >= 220) && (tc < 240)) {   //고위험군
                tcScore = 70;
            }else {                        //초고위험군
                tcScore =  90;
            }

            //tg 점수, 전체비중 5%
            int tgScore = 0;

            if (tg < 150) {   //정상범위
                tgScore = 20;
            } else if ((tg >= 150) && (tg < 175)) {   //저위험군
                tgScore = 40;
            } else if ((tg >= 175) && (tg < 200)) {   //중위험군
                tgScore = 60;
            } else {                        //고위험군
                tgScore =  80;
            }

            //hdl 점수, 전체비중 5%
            int hdlScore = 0;

            if (hdl >= 60) {   //정상범위
                hdlScore = 10;
            } else if ((hdl >= 55) && (hdl < 60)) {   //저위험군
                hdlScore = 30;
            } else if ((hdl >= 50) && (hdl < 55)) {   //중위험군
                hdlScore = 50;
            } else if ((hdl >= 45) && (hdl < 50)) {   //고위험군
                hdlScore = 70;
            }else {                        //초고위험군
                hdlScore =  90;
            }

            //ldl 점수, 전체비중 5%
            int ldlScore = 0;

            if (ldl <130) {   //정상범위
                ldlScore = 10;
            } else if ((ldl >= 130) && (ldl < 140)) {   //저위험군
                ldlScore = 30;
            } else if ((ldl >= 140) && (ldl < 150)) {   //중위험군
                ldlScore = 50;
            } else if ((ldl >= 150) && (ldl < 160)) {   //고위험군
                ldlScore = 70;
            }else {                        //초고위험군
                ldlScore =  90;
            }

            //음주 점수, 전체비중 10%
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //흡연 점수, 전체비중 10%
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  0;
            }


            // 조건을 확인하여 dg01Score 값을 설정
            dg02Score = (int) ((0.3 * ageScore) +
                    (0.1 * bmiScore) +
                    (0.1 * waistlineScore) +
                    (0.1 * bpScore) +
                    (0.05 * tcScore) +
                    (0.05 * tgScore) +
                    (0.05 * hdlScore) +
                    (0.05 * ldlScore) +
                    (0.1 * drinkingScore) +
                    (0.1 * smokingScore));
        }

        predictDTO.setDg02Score(dg02Score); // PredictDTO에 dg02Score를 설정

        //고혈압
        int dg03Score = 0;  // DG02 점수를 저장할 변수, 초기값은 0
        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            int sbp = (int) hospitalData.getOrDefault("sbp", 1000);
            int dbp = (int) hospitalData.getOrDefault("dbp", 1000);
            int tc = (int) hospitalData.getOrDefault("tc", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //bp점수, 전체 비중 10%
            int bpScore = 0;

            if (sbp < 120 && dbp < 80) {   //정상범위
                bpScore = 10;
            } else if (((sbp >= 120) && (140 > sbp)) || ((dbp >= 80) && (90 > dbp))) {   //저위험군
                bpScore = 30;
            } else if (((sbp >= 140) && (160 > sbp)) || ((dbp >= 90) && (100 > dbp))) {   //중위험군
                bpScore = 50;
            } else if ((sbp >= 160) || (dbp >= 100)) {   //고위험군
                bpScore = 70;
            }else {                        //초고위험군
                bpScore =  90;
            }

            //tc 점수, 전체비중 5%
            int tcScore = 0;

            if (tc < 180) {   //정상범위
                tcScore = 10;
            } else if ((tc >= 180) && (tc < 200)) {   //저위험군
                tcScore = 30;
            } else if ((tc >= 200) && (tc < 220)) {   //중위험군
                tcScore = 50;
            } else if ((tc >= 220) && (tc < 240)) {   //고위험군
                tcScore = 70;
            }else {                        //초고위험군
                tcScore =  90;
            }

            //음주 점수, 전체비중 10%
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //흡연 점수, 전체비중 10%
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  0;
            }


            // 조건을 확인하여 dg01Score 값을 설정
            dg03Score = (int) (
                    (0.3 * ageScore) +
                    (0.05 * bmiScore) +
                    (0.05 * waistlineScore) +
                    (0.4 * bpScore) +
                    (0.05 * tcScore) +
                    (0.1 * drinkingScore) +
                    (0.05 * smokingScore));
        }

        predictDTO.setDg03Score(dg03Score); // PredictDTO에 dg03Score를 설정

        //당뇨병
        int dg04Score = 0;  // DG02 점수를 저장할 변수, 초기값은 0
        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            int sbp = (int) hospitalData.getOrDefault("sbp", 1000);
            int dbp = (int) hospitalData.getOrDefault("dbp", 1000);
            int fbg = (int) hospitalData.getOrDefault("fbg", 1000);
            int tc = (int) hospitalData.getOrDefault("tc", 1000);
            int tg = (int) hospitalData.getOrDefault("tg", 1000);
            int hdl = (int) hospitalData.getOrDefault("hdl", 1000);
            int ldl = (int) hospitalData.getOrDefault("ldl", 1000);
            int ast = (int) hospitalData.getOrDefault("ast", 1000);
            int alt = (int) hospitalData.getOrDefault("alt", 1000);
            int ggtp = (int) hospitalData.getOrDefault("ggtp", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);
            double hba1c = (double) hospitalData.getOrDefault("hba1c", 1000.0);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //bp점수, 전체 비중 10%
            int bpScore = 0;

            if (sbp < 120 && dbp < 80) {   //정상범위
                bpScore = 10;
            } else if (((sbp >= 120) && (140 > sbp)) || ((dbp >= 80) && (90 > dbp))) {   //저위험군
                bpScore = 30;
            } else if (((sbp >= 140) && (160 > sbp)) || ((dbp >= 90) && (100 > dbp))) {   //중위험군
                bpScore = 50;
            } else if ((sbp >= 160) || (dbp >= 100)) {   //고위험군
                bpScore = 70;
            }else {                        //초고위험군
                bpScore =  90;
            }

            //fbg
            int fbgScore = 0;

            if (fbg < 100) {   //정상범위
                fbgScore = 10;
            } else if ((fbg >= 100) && (fbg < 125)) {   //저위험군
                fbgScore = 30;
            } else if ((fbg >= 125) && (fbg < 175)) {   //중위험군
                fbgScore = 50;
            } else if ((fbg >= 175) && (fbg < 225)) {   //고위험군
                fbgScore = 70;
            }else {                        //초고위험군
                fbgScore =  90;
            }

            //tc 점수, 전체비중 5%
            int tcScore = 0;

            if (tc < 180) {   //정상범위
                tcScore = 10;
            } else if ((tc >= 180) && (tc < 200)) {   //저위험군
                tcScore = 30;
            } else if ((tc >= 200) && (tc < 220)) {   //중위험군
                tcScore = 50;
            } else if ((tc >= 220) && (tc < 240)) {   //고위험군
                tcScore = 70;
            }else {                        //초고위험군
                tcScore =  90;
            }

            //tg 점수
            int tgScore = 0;

            if (tg < 150) {   //정상범위
                tgScore = 10;
            } else if ((tg >= 150) && (tg < 175)) {   //저위험군
                tgScore = 30;
            } else if ((tg >= 175) && (tg < 200)) {   //중위험군
                tgScore = 50;
            } else if ((tg >= 200) && (tg < 225)) {   //고위험군
                tgScore = 70;
            }else {                        //초고위험군
                tgScore =  90;
            }

            //hdl 점수
            int hdlScore = 0;

            if (hdl >= 60) {   //정상범위
                hdlScore = 10;
            } else if ((hdl >= 55) && (hdl < 60)) {   //저위험군
                hdlScore = 30;
            } else if ((hdl >= 50) && (hdl < 55)) {   //중위험군
                hdlScore = 50;
            } else if ((hdl >= 45) && (hdl < 50)) {   //고위험군
                hdlScore = 70;
            }else {                        //초고위험군
                hdlScore =  90;
            }

            //ldl 점수
            int ldlScore = 0;

            if (tg < 130) {   //정상범위
                ldlScore = 10;
            } else if ((ldl >= 130) && (ldl < 140)) {   //저위험군
                ldlScore = 30;
            } else if ((ldl >= 140) && (ldl < 150)) {   //중위험군
                ldlScore = 50;
            } else if ((ldl >= 150) && (ldl < 160)) {   //고위험군
                ldlScore = 70;
            }else {                        //초고위험군
                ldlScore =  90;
            }

            //ast 점수
            int astScore = 0;

            if (ast < 40) {   //정상범위
                astScore = 10;
            } else if ((ast >= 40) && (ast < 45)) {   //저위험군
                astScore = 30;
            } else if ((ast >= 45) && (ast < 50)) {   //중위험군
                astScore = 50;
            } else if ((ast >= 50) && (ast < 55)) {   //고위험군
                astScore = 70;
            }else {                        //초고위험군
                astScore =  90;
            }

            //alt 점수
            int altScore = 0;

            if (alt < 40) {   //정상범위
                altScore = 10;
            } else if ((alt >= 40) && (alt < 45)) {   //저위험군
                altScore = 30;
            } else if ((alt >= 45) && (alt < 50)) {   //중위험군
                altScore = 50;
            } else if ((alt >= 50) && (alt < 55)) {   //고위험군
                altScore = 70;
            }else {                        //초고위험군
                altScore =  90;
            }

            //ggtp 점수
            int ggtpScore = 0;

            if (ggtp < 70) {   //정상범위
                ggtpScore = 10;
            } else if ((ggtp >= 70) && (ggtp < 80)) {   //저위험군
                ggtpScore = 30;
            } else if ((ggtp >= 80) && (ggtp < 90)) {   //중위험군
                ggtpScore = 50;
            } else if ((ggtp >= 90) && (ggtp < 100)) {   //고위험군
                ggtpScore = 70;
            }else {                        //초고위험군
                ggtpScore =  90;
            }

            //음주 점수, 전체비중 10%
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //흡연 점수, 전체비중 10%
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  0;
            }

            //hba1c 점수
            int hba1cScore = 0;

            if (hba1c < 6.0) {   //정상범위
                hba1cScore = 10;
            } else if ((hba1c >= 6.0) && (hba1c < 6.5)) {   //저위험군
                hba1cScore = 30;
            } else if ((hba1c >= 6.5) && (hba1c < 7.0)) {   //중위험군
                hba1cScore = 50;
            } else if ((hba1c >= 7.0) && (hba1c < 7.5)) {   //고위험군
                hba1cScore = 70;
            }else {                        //초고위험군
                hba1cScore =  90;
            }


            // 조건을 확인하여 dg04Score 값을 설정
            dg04Score = (int) (
                            (0.05 * ageScore) +
                            (0.2 * bmiScore) +
                            (0.12 * waistlineScore) +
                            (0.4 * fbgScore) +
                            (0.02 * tcScore) +
                            (0.02 * tgScore) +
                            (0.02 * hdlScore) +
                            (0.02 * ldlScore) +
                            (0.02 * astScore) +
                            (0.02 * altScore) +
                            (0.02 * ggtpScore) +
                            (0.02 * smokingScore) +
                            (0.02 * drinkingScore) +
                            (0.1 * hba1cScore)
            );

        }

        predictDTO.setDg04Score(dg04Score); // PredictDTO에 dg04Score를 설정

        //신장질환
        int dg05Score = 0;  // DG02 점수를 저장할 변수, 초기값은 0
        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            double creatinine = (double) hospitalData.getOrDefault("creatinine", 1000.0);
            int egfr = (int) hospitalData.getOrDefault("egfr", 1000);
            int bun = (int) hospitalData.getOrDefault("bun", 1000);
            double phurine = (double) hospitalData.getOrDefault("phurine", 1000.0);
            int proteinurine = (int) hospitalData.getOrDefault("proteinurine", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //creatinine
            int creatinineScore = 0;

            if (creatinine < 1.3) {   //정상범위
                creatinineScore = 10;
            } else if ((creatinine >= 1.3) && (creatinine < 1.5)) {   //저위험군
                creatinineScore = 30;
            } else if ((creatinine >= 1.5) && (creatinine < 1.7)) {   //중위험군
                creatinineScore = 50;
            } else if ((creatinine >= 1.7) && (creatinine < 1.9)) {   //고위험군
                creatinineScore = 70;
            }else {                        //초고위험군
                creatinineScore =  90;
            }

            //egfr
            int egfrScore = 0;

            if (egfr >= 90) {   //정상범위
                egfrScore = 10;
            } else if ((egfr >= 60) && (egfr < 90)) {   //저위험군
                egfrScore = 30;
            } else if ((egfr >= 30) && (egfr < 60)) {   //중위험군
                egfrScore = 50;
            } else if ((egfr >= 15) && (egfr < 30)) {   //고위험군
                egfrScore = 70;
            }else {                        //초고위험군
                egfrScore =  90;
            }

            //bun 점수
            int bunScore = 0;

            if (bun < 27) {   //정상범위
                bunScore = 10;
            } else if ((bun >= 27) && (bun < 30)) {   //저위험군
                bunScore = 30;
            } else if ((bun >= 30) && (bun < 33)) {   //중위험군
                bunScore = 50;
            } else if ((bun >= 33) && (bun < 36)) {   //고위험군
                bunScore = 70;
            }else {                        //초고위험군
                bunScore =  90;
            }

            //phurine 점수
            int phurineScore = 0;

            if (phurine < 8.0) {   //정상범위
                phurineScore = 10;
            } else if ((phurine >= 8.0) && (phurine < 8.3)) {   //저위험군
                phurineScore = 30;
            } else if ((phurine >= 8.3) && (phurine < 8.6)) {   //중위험군
                phurineScore = 50;
            } else if ((phurine >= 8.6) && (phurine < 8.9)) {   //고위험군
                phurineScore = 70;
            }else {                        //초고위험군
                phurineScore =  90;
            }

            //proteinurine 점수
            int proteinurineScore = 0;

            if (proteinurine == 1) {
                proteinurineScore = 100;
            } else {
                proteinurineScore =  0;
            }

            //음주 점수
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //흡연 점수
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  0;
            }


            // 조건을 확인하여 dg04Score 값을 설정
            dg05Score = (int) (
                            (0.1 * ageScore) +
                            (0.05 * bmiScore) +
                            (0.05 * waistlineScore) +
                            (0.15 * creatinineScore) +
                            (0.15 * egfrScore) +
                            (0.15 * bunScore) +
                            (0.15 * phurineScore) +
                            (0.15 * proteinurineScore) +
                            (0.02 * smokingScore) +
                            (0.03 * drinkingScore)
            );

        }

        predictDTO.setDg05Score(dg05Score); // PredictDTO에 dg05Score를 설정

        //만성호흡기질환
        int dg06Score = 0;  // DG06 점수를 저장할 변수, 초기값은 0
        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            int sbp = (int) hospitalData.getOrDefault("sbp", 1000);
            int dbp = (int) hospitalData.getOrDefault("dbp", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            double fvc = (double) hospitalData.getOrDefault("fvc", 1000.0);
            int fev1 = (int) hospitalData.getOrDefault("fev1", 1000);
            int fev1fvc = (int) hospitalData.getOrDefault("fev1fvc", 1000);
            double pbdtest = (double) hospitalData.getOrDefault("pbdtest", 1000.0);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //bp점수, 전체 비중 10%
            int bpScore = 0;

            if (sbp < 120 && dbp < 80) {   //정상범위
                bpScore = 10;
            } else if (((sbp >= 120) && (140 > sbp)) || ((dbp >= 80) && (90 > dbp))) {   //저위험군
                bpScore = 30;
            } else if (((sbp >= 140) && (160 > sbp)) || ((dbp >= 90) && (100 > dbp))) {   //중위험군
                bpScore = 50;
            } else if ((sbp >= 160) || (dbp >= 100)) {   //고위험군
                bpScore = 70;
            }else {                        //초고위험군
                bpScore =  90;
            }

            //흡연 점수
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  100;
            }

            //fvc
            //조정 필요
            int fvcScore = 0;

            if (fvc >= 4.0) {   //정상범위
                fvcScore = 10;
            } else if ((fvc >= 3.6) && (fvc < 4.0)) {   //저위험군
                fvcScore = 30;
            } else if ((fvc >= 3.2) && (fvc < 3.6)) {   //중위험군
                fvcScore = 50;
            } else if ((fvc >= 2.8) && (fvc < 3.2)) {   //고위험군
                fvcScore = 70;
            }else {                        //초고위험군
                fvcScore =  90;
            }

            //fev1 점수
            //조정 필요
            int fev1Score = 0;

            if (fev1 >= 80) {   //정상범위
                fev1Score = 10;
            } else if ((fev1 >= 65) && (fev1 < 80)) {   //저위험군
                fev1Score = 30;
            } else if ((fev1 >= 50) && (fev1 < 65)) {   //중위험군
                fev1Score = 50;
            } else if ((fev1 >= 30) && (fev1 < 50)) {   //고위험군
                fev1Score = 70;
            }else {                        //초고위험군
                fev1Score =  90;
            }

            //fev1fvc 점수
            //조정 필요
            int fev1fvcScore = 0;

            if (fev1fvc >= 70) {   //정상범위
                fev1fvcScore = 10;
            } else if ((fev1fvc >= 60) && (fev1fvc < 70)) {   //저위험군
                fev1fvcScore = 30;
            } else if ((fev1fvc >= 50) && (fev1fvc < 60)) {   //중위험군
                fev1fvcScore = 50;
            } else if ((fev1fvc >= 40) && (fev1fvc < 50)) {   //고위험군
                fev1fvcScore = 70;
            }else {                        //초고위험군
                fev1fvcScore =  90;
            }

            //pbdtest 점수
            //조정 필요
            int pbdtestScore = 0;

            if (pbdtest >= 12.0) {   //정상범위
                pbdtestScore = 10;
            } else if ((pbdtest >= 11.0) && (pbdtest < 12.0)) {   //저위험군
                pbdtestScore = 30;
            } else if ((pbdtest >= 10.0) && (pbdtest < 11.0)) {   //중위험군
                pbdtestScore = 50;
            } else if ((pbdtest >= 9.0) && (pbdtest < 10.0)) {   //고위험군
                pbdtestScore = 70;
            }else {                        //초고위험군
                pbdtestScore =  90;
            }

            // 조건을 확인하여 dg04Score 값을 설정
            dg06Score = (int) (
                            (0.05 * bmiScore) +
                            (0.05 * waistlineScore) +
                            (0.05 * bpScore) +
                            (0.25 * smokingScore) +
                            (0.15 * fvcScore) +
                            (0.15 * fev1Score) +
                            (0.15 * fev1fvcScore) +
                            (0.15 * pbdtestScore)
            );

        }
        predictDTO.setDg06Score(dg06Score); // PredictDTO에 dg05Score를 설정

        //간질환
        int dg07Score = 0;  // DG07 점수를 저장할 변수, 초기값은 0

        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int sex = (int) hospitalData.getOrDefault("sex", 1000);
            int height = (int) hospitalData.getOrDefault("height", 1000);
            int weight = (int) hospitalData.getOrDefault("weight", 1000);
            int waistline = (int) hospitalData.getOrDefault("waistline", 1000);
            int sbp = (int) hospitalData.getOrDefault("sbp", 1000);
            int dbp = (int) hospitalData.getOrDefault("dbp", 1000);
            int tc = (int) hospitalData.getOrDefault("tc", 1000);
            int tg = (int) hospitalData.getOrDefault("tg", 1000);
            int hdl = (int) hospitalData.getOrDefault("hdl", 1000);
            int ldl = (int) hospitalData.getOrDefault("ldl", 1000);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);
            double hb = (double) hospitalData.getOrDefault("hb", 1000.0);
            int ast = (int) hospitalData.getOrDefault("ast", 1000);
            int alt = (int) hospitalData.getOrDefault("alt", 1000);
            int alp = (int) hospitalData.getOrDefault("alp", 1000);
            int ggtp = (int) hospitalData.getOrDefault("ggtp", 1000);
            double bilirubin  = (double) hospitalData.getOrDefault("bilirubin", 1000.0);
            double albumin = (double) hospitalData.getOrDefault("albumin ", 1000.0);
            double prothrombintime  = (double) hospitalData.getOrDefault("prothrombintime", 1000.0);
            double totalprotein  = (double) hospitalData.getOrDefault("totalprotein", 1000.0);

            double mHeight = height / 100.0;
            height = height / 100; // cm를 m로 변환
            double bmi = (double) (weight / (mHeight * mHeight));

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //bmi 점수, 전체 비중 10%
            int bmiScore = 0;

            if (bmi < 18.5) {   //저체중 (10~19)
                bmiScore = 10 ;
            } else if (bmi >= 18.5 && bmi < 23) {   //정상 (0~9)
                bmiScore = 5;
            } else if (bmi >= 23 && bmi < 25) {     //과체중 (20~39)
                bmiScore = 30 ;
            } else if (bmi >= 25 && bmi < 30) {     //1단계 비만 (40~59)
                bmiScore = 50 ;
            } else if (bmi >= 30 && bmi < 35) {     //2단계 비만 (60~79)
                bmiScore = 70 ;
            } else {                                //3단계 비만 (80~100)
                bmiScore = 90 ;
            }

            //waistline점수, 전체 비중 10%
            int waistlineScore = 0;

            if (waistline <= 84) {   //정상범위
                waistlineScore = 10;
            } else if (waistline >= 85 && waistline < 90) {   //저위험군
                waistlineScore = 30;
            } else if (waistline >= 90 && waistline < 95) {   //중위험군
                waistlineScore = 50;
            } else if (waistline >= 95 && waistline < 100) {   //고위험군
                waistlineScore = 70;
            }else {                        //초고위험군
                waistlineScore =  90;
            }

            //bp점수, 전체 비중 10%
            int bpScore = 0;

            if (sbp < 120 && dbp < 80) {   //정상범위
                bpScore = 10;
            } else if (((sbp >= 120) && (140 > sbp)) || ((dbp >= 80) && (90 > dbp))) {   //저위험군
                bpScore = 30;
            } else if (((sbp >= 140) && (160 > sbp)) || ((dbp >= 90) && (100 > dbp))) {   //중위험군
                bpScore = 50;
            } else if ((sbp >= 160) || (dbp >= 100)) {   //고위험군
                bpScore = 70;
            }else {                        //초고위험군
                bpScore =  90;
            }

            //tc 점수, 전체비중 5%
            int tcScore = 0;

            if (tc < 180) {   //정상범위
                tcScore = 10;
            } else if ((tc >= 180) && (tc < 200)) {   //저위험군
                tcScore = 30;
            } else if ((tc >= 200) && (tc < 220)) {   //중위험군
                tcScore = 50;
            } else if ((tc >= 220) && (tc < 240)) {   //고위험군
                tcScore = 70;
            }else {                        //초고위험군
                tcScore =  90;
            }

            //tg 점수, 전체비중 5%
            int tgScore = 0;

            if (tg < 150) {   //정상범위
                tgScore = 20;
            } else if ((tg >= 150) && (tg < 175)) {   //저위험군
                tgScore = 40;
            } else if ((tg >= 175) && (tg < 200)) {   //중위험군
                tgScore = 60;
            } else {                        //고위험군
                tgScore =  80;
            }

            //hdl 점수, 전체비중 5%
            int hdlScore = 0;

            if (hdl >= 60) {   //정상범위
                hdlScore = 10;
            } else if ((hdl >= 55) && (hdl < 60)) {   //저위험군
                hdlScore = 30;
            } else if ((hdl >= 50) && (hdl < 55)) {   //중위험군
                hdlScore = 50;
            } else if ((hdl >= 45) && (hdl < 50)) {   //고위험군
                hdlScore = 70;
            }else {                        //초고위험군
                hdlScore =  90;
            }

            //ldl 점수, 전체비중 5%
            int ldlScore = 0;

            if (ldl <130) {   //정상범위
                ldlScore = 10;
            } else if ((ldl >= 130) && (ldl < 140)) {   //저위험군
                ldlScore = 30;
            } else if ((ldl >= 140) && (ldl < 150)) {   //중위험군
                ldlScore = 50;
            } else if ((ldl >= 150) && (ldl < 160)) {   //고위험군
                ldlScore = 70;
            }else {                        //초고위험군
                ldlScore =  90;
            }

            //음주 점수, 전체비중 10%
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //hb
            int hbScore = 0;

            if (hb <18.0) {   //정상범위
                hbScore = 10;
            } else if ((hb >= 20.0) && (hb < 18.0)) {   //저위험군
                hbScore = 30;
            } else if ((hb >= 22.0) && (hb < 20.0)) {   //중위험군
                hbScore = 50;
            } else if ((hb >= 24.0) && (hb < 22.0)) {   //고위험군
                hbScore = 70;
            }else {                        //초고위험군
                hbScore =  90;
            }

            //ast 점수
            int astScore = 0;

            if (ast < 40) {   //정상범위
                astScore = 10;
            } else if ((ast >= 40) && (ast < 45)) {   //저위험군
                astScore = 30;
            } else if ((ast >= 45) && (ast < 50)) {   //중위험군
                astScore = 50;
            } else if ((ast >= 50) && (ast < 55)) {   //고위험군
                astScore = 70;
            }else {                        //초고위험군
                astScore =  90;
            }

            //alt 점수
            int altScore = 0;

            if (alt < 40) {   //정상범위
                altScore = 10;
            } else if ((alt >= 40) && (alt < 45)) {   //저위험군
                altScore = 30;
            } else if ((alt >= 45) && (alt < 50)) {   //중위험군
                altScore = 50;
            } else if ((alt >= 50) && (alt < 55)) {   //고위험군
                altScore = 70;
            }else {                        //초고위험군
                altScore =  90;
            }

            //alp 점수
            int alpScore = 0;

            if (alp < 130) {   //정상범위
                alpScore = 10;
            } else if ((alp >= 130) && (alp < 140)) {   //저위험군
                alpScore = 30;
            } else if ((alp >= 140) && (alp < 150)) {   //중위험군
                alpScore = 50;
            } else if ((alp >= 150) && (alp < 160)) {   //고위험군
                alpScore = 70;
            }else {                        //초고위험군
                alpScore =  90;
            }

            //ggtp 점수
            int ggtpScore = 0;

            if (ggtp < 70) {   //정상범위
                ggtpScore = 10;
            } else if ((ggtp >= 70) && (ggtp < 80)) {   //저위험군
                ggtpScore = 30;
            } else if ((ggtp >= 80) && (ggtp < 90)) {   //중위험군
                ggtpScore = 50;
            } else if ((ggtp >= 90) && (ggtp < 100)) {   //고위험군
                ggtpScore = 70;
            }else {                        //초고위험군
                ggtpScore =  90;
            }

            //bilirubin  점수
            int bilirubinScore = 0;

            if (bilirubin < 1.3) {   //정상범위
                bilirubinScore = 10;
            } else if ((bilirubin >= 1.3) && (bilirubin < 1.6)) {   //저위험군
                bilirubinScore = 30;
            } else if ((bilirubin >= 1.6) && (bilirubin < 1.9)) {   //중위험군
                bilirubinScore = 50;
            } else if ((bilirubin >= 1.9) && (bilirubin < 2.2)) {   //고위험군
                bilirubinScore = 70;
            }else {                        //초고위험군
                bilirubinScore =  90;
            }

            //albumin  점수
            int albuminScore = 0;

            if (albumin < 5.3) {   //정상범위
                albuminScore = 10;
            } else if ((albumin >= 5.3) && (albumin < 6.3)) {   //저위험군
                albuminScore = 30;
            } else if ((albumin >= 6.3) && (albumin < 7.3)) {   //중위험군
                albuminScore = 50;
            } else if ((albumin >= 7.3) && (albumin < 8.3)) {   //고위험군
                albuminScore = 70;
            }else {                        //초고위험군
                albuminScore =  90;
            }

            //prothrombintime 점수
            int prothrombintimeScore = 0;

            if (prothrombintime < 15.5) {   //정상범위
                prothrombintimeScore = 10;
            } else if ((prothrombintime >= 15.5) && (prothrombintime < 16.5)) {   //저위험군
                prothrombintimeScore = 30;
            } else if ((prothrombintime >= 16.5) && (prothrombintime < 17.5)) {   //중위험군
                prothrombintimeScore = 50;
            } else if ((prothrombintime >= 17.5) && (prothrombintime < 18.5)) {   //고위험군
                prothrombintimeScore = 70;
            }else {                        //초고위험군
                prothrombintimeScore =  90;
            }

            //totalprotein 점수
            int totalproteinScore = 0;

            if (totalprotein < 9.0) {   //정상범위
                totalproteinScore = 10;
            } else if ((totalprotein >= 9.0) && (totalprotein < 10.0)) {   //저위험군
                totalproteinScore = 30;
            } else if ((totalprotein >= 10.0) && (totalprotein < 11.0)) {   //중위험군
                totalproteinScore = 50;
            } else if ((totalprotein >= 11.0) && (totalprotein < 12.0)) {   //고위험군
                totalproteinScore = 70;
            }else {                        //초고위험군
                totalproteinScore =  90;
            }

            // 조건을 확인하여 dg01Score 값을 설정
            dg07Score = (int) ((0.02 * ageScore) +
                    (0.02 * bmiScore) +
                    (0.02 * waistlineScore) +
                    (0.02 * bpScore) +
                    (0.02 * tcScore) +
                    (0.02 * tgScore) +
                    (0.02 * hdlScore) +
                    (0.02 * ldlScore) +
                    (0.2 * drinkingScore) +
                    (0.02 * hbScore) +
                    (0.1 * astScore) +
                    (0.1 * altScore) +
                    (0.1 * alpScore) +
                    (0.1 * ggtpScore) +
                    (0.1 * bilirubinScore) +
                    (0.05 * albuminScore) +
                    (0.05 * prothrombintimeScore) +
                    (0.02 * totalproteinScore));
        }

        predictDTO.setDg07Score(dg07Score); // PredictDTO에 dg07Score를 설정

        //갑상선질환
        int dg08Score = 0;  // DG08 점수를 저장할 변수, 초기값은 0

        // hospitalData가 null이 아닌지 확인
        if (hospitalData != null) {
            // Map에서 "age"라는 키를 가진 값을 찾아 반환하고,

            // 값이 없으면 기본값 1000을 반환한다. 그리고 이 값을 int로 형변환
            int age = (int) hospitalData.getOrDefault("age", 1000);
            // 비슷하게 "sex"와 "sbp" 값을 찾아서 int로 형변환
            int sex = (int) hospitalData.getOrDefault("sex", 1000);
            double freet4  = (double) hospitalData.getOrDefault("freet4", 1000.0);
            int t3 = (int) hospitalData.getOrDefault("t3", 1000);
            double tsh  = (double) hospitalData.getOrDefault("tsh", 1000.0);
            int smoking = (int) hospitalData.getOrDefault("smoking", 1000);
            int drinking = (int) hospitalData.getOrDefault("drinking", 1000);
            
            //성별
            int sexScore = 0;
            if (sex == 1) {
                sexScore = 0;
            } else {
                sexScore =  0;
            }

            //나이 점수, 나이는 전체 비중 20%
            int ageScore = 0;

            if (age < 55) {
                ageScore = 10;
            } else if (age >= 55 && age < 65) {
                ageScore = 30;
            } else if (age >= 65 && age < 75) {
                ageScore = 50;
            } else if (age >= 75 && age < 85) {
                ageScore = 70;
            } else {
                ageScore = 90;
            }

            //freet4 점수, 전체비중 5%
            int freet4Score = 0;

            if (freet4 < 2.0) {   //정상범위
                freet4Score = 10;
            } else if ((freet4 >= 2.0) && (freet4 < 2.5)) {   //저위험군
                freet4Score = 30;
            } else if ((freet4 >= 2.5) && (freet4 < 3.0)) {   //중위험군
                freet4Score = 50;
            } else if ((freet4 >= 3.0) && (freet4 < 3.5)) {   //고위험군
                freet4Score = 70;
            }else {                        //초고위험군
                freet4Score =  90;
            }

            //t3 점수, 전체비중 5%
            int t3Score = 0;

            if (t3 < 180) {   //정상범위
                t3Score = 20;
            } else if ((t3 >= 180) && (t3 < 200)) {   //저위험군
                t3Score = 40;
            } else if ((t3 >= 200) && (t3 < 220)) {   //중위험군
                t3Score = 60;
            } else {                        //고위험군
                t3Score =  80;
            }

            //tsh 점수, 전체비중 5%
            int tshScore = 0;

            if (tsh < 4.0) {   //정상범위
                tshScore = 10;
            } else if ((tsh >= 4.0) && (tsh < 4.5)) {   //저위험군
                tshScore = 10;
            } else if ((tsh >= 4.5) && (tsh < 5.0)) {   //중위험군
                tshScore = 10;
            } else if ((tsh >= 5.0) && (tsh < 5.5)) {   //고위험군
                tshScore = 10;
            }else {                        //초고위험군
                tshScore =  10;
            }

            //음주 점수, 전체비중 10%
            int drinkingScore = 0;

            if (drinking == 1) {
                drinkingScore = 100;
            } else {
                drinkingScore =  0;
            }

            //흡연 점수, 전체비중 10%
            int smokingScore = 0;

            if (smoking == 1) {
                smokingScore = 100;
            } else {
                smokingScore =  0;
            }


            // 조건을 확인하여 dg01Score 값을 설정
            dg08Score = (int) ((0.2 * ageScore) +
                    (0.05 * sexScore) +
                    (0.22 * freet4Score) +
                    (0.22 * t3Score) +
                    (0.24 * tshScore) +
                    (0.05 * smokingScore) +
                    (0.05 * drinkingScore)
            );
        }

        predictDTO.setDg08Score(dg08Score); // PredictDTO에 dg08Score를 설정

        return predictDTO; // 완성된 PredictDTO 객체를 반환
    }
    public void updatePredictData(PredictDTO predictDTO) {

        predictMapper.updatePredictData(predictDTO);
    }

}








