package hana.hanafinal.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public List<AdminDTO> findAll() {
        
        return adminMapper.findAll();
    }


    //보험 상품 가입 요청 심사하기
    public List<AdminDTO04> getJoinRequests() {
        return adminMapper.getJoinRequests();
    }
    public List<AdminDTO05> getUsersBymyproductId(int myproductId) {
        return adminMapper.getUsersBymyproductId(myproductId);
    }
    public List<AdminDTO07> getInsuranceProductsBymyproductId(int myproductId) {
        return adminMapper.getInsuranceProductsBymyproductId(myproductId);
    }

    public List<AdminDTO06> getBiowalletBymyproductId(int myproductId) {
        return adminMapper.getBiowalletBymyproductId(myproductId);
    }
    public AdminDTO08 processJoin(int myproductId) {
        List<AdminDTO05> targetusers = getUsersBymyproductId(myproductId);
        List<AdminDTO06> targetbiowallet = getBiowalletBymyproductId(myproductId);

        AdminDTO08 processedData = new AdminDTO08();

        int birthYear = Integer.parseInt(targetusers.get(0).getSsn().substring(0, 2));

        if (birthYear >= 73 && birthYear <84){
            processedData.setResult01("가입 가능 : 연령대 만 40~50");
        }
        else if (birthYear >= 84 && birthYear < 94){
            processedData.setResult01("가입 가능 : 연령대 만 30~40");
        }
        else if (birthYear >= 94 && birthYear < 100){
            processedData.setResult01("가입 가능 : 연령대 만 20~30");
        }
        else if (birthYear >= 00 && birthYear < 04){
            processedData.setResult01("가입 가능 : 연령대 만 20~30");
        }

        if (!targetbiowallet.isEmpty() && targetbiowallet.get(0).getDg06Score() >= 80) {
            processedData.setResult02("가입 불가 : 호흡기질환 예측점수가 초고위험군입니다.");
            processedData.setResult02payment(0);
        }
        else if (!targetbiowallet.isEmpty() &&
                        targetbiowallet.get(0).getDg06Score() < 80 &&
                            targetbiowallet.get(0).getDg06Score() >= 60) {
            if (birthYear >= 73 && birthYear <84){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 고위험군");
                processedData.setResult02payment(26700);
            }
            else if (birthYear >= 84 && birthYear < 94){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 고위험군");
                processedData.setResult02payment(11500);
            }
            else if (birthYear >= 94 && birthYear < 100){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 고위험군");
                processedData.setResult02payment(9500);
            }
            else if (birthYear >= 00 && birthYear < 04){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 고위험군");
                processedData.setResult02payment(9500);
            }
        } else if (!targetbiowallet.isEmpty() && targetbiowallet.get(0).getDg06Score() < 60 && targetbiowallet.get(0).getDg06Score() >= 40) {
            if (birthYear >= 73 && birthYear <84){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 중위험군");
                processedData.setResult02payment(25300);
            }
            else if (birthYear >= 84 && birthYear < 94){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 중위험군");
                processedData.setResult02payment(10900);
            }
            else if (birthYear >= 94 && birthYear < 100){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 중위험군");
                processedData.setResult02payment(9000);
            }
            else if (birthYear >= 00 && birthYear < 04){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 중위험군");
                processedData.setResult02payment(9000);
            }
        }else if (!targetbiowallet.isEmpty() && targetbiowallet.get(0).getDg06Score() < 40 && targetbiowallet.get(0).getDg06Score() >= 20) {
            if (birthYear >= 73 && birthYear <84){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 저위험군");
                processedData.setResult02payment(24000);
            }
            else if (birthYear >= 84 && birthYear < 94){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 저위험군");
                processedData.setResult02payment(10300);
            }
            else if (birthYear >= 94 && birthYear < 100){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 저위험군");
                processedData.setResult02payment(8500);
            }
            else if (birthYear >= 00 && birthYear < 04){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 저위험군");
                processedData.setResult02payment(8500);
            }
        }else if (!targetbiowallet.isEmpty() && targetbiowallet.get(0).getDg06Score() < 20 && targetbiowallet.get(0).getDg06Score() >= 00) {
            if (birthYear >= 73 && birthYear <84){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 정상군");
                processedData.setResult02payment(22600);
            }
            else if (birthYear >= 84 && birthYear < 94){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 정상군");
                processedData.setResult02payment(9700);
            }
            else if (birthYear >= 94 && birthYear < 100){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 정상군");
                processedData.setResult02payment(8000);
            }
            else if (birthYear >= 00 && birthYear < 04){
                processedData.setResult02("가입 가능 : 호흡기 질환 예측점수 정상군");
                processedData.setResult02payment(8000);
            }
        }else {
            processedData.setResult02("가입 불가능");
        }

        return processedData;
    }
    //보험 상품 가입 심사 쿼리문 나리기
    public void updateMyProduct(int myproductId) {
        adminMapper.updateMyProduct(myproductId);
    }



    //보험금 청구 목록 가져오기
    public List<AdminDTO> getClaimRequests() {
        return adminMapper.getClaimRequests();
    }

    //본격적으로 조회해서 가져오기
    public List<AdminDTO> getClaimById(int claimId) {
        return adminMapper.getClaimById(claimId);
    }

    public List<AdminDTO02> getDiagnosisByClaimId(int claimId) {
        return adminMapper.getDiagnosisByClaimId(claimId);
    }
    public AdminDTO03 processClaimsAndDiagnosis(int claimId) {
        List<AdminDTO> claims = getClaimById(claimId);
        List<AdminDTO02> diagnosis = getDiagnosisByClaimId(claimId);

        AdminDTO03 processedData = new AdminDTO03();

        boolean isChronicLungDisease = false;  // 초기값을 false로 설정

        for (AdminDTO02 diag : diagnosis) {
            if (diag.getDiagnosismaincode().startsWith("J44")
                    || diag.getDiagnosisside01code().startsWith("J44")
                    || diag.getDiagnosisside02code().startsWith("J44")) {

                isChronicLungDisease = true;  // "J44"로 시작하는 코드가 하나라도 있으면 true로 설정
                break;  // 이미 조건을 만족했기 때문에 더 이상 리스트를 확인할 필요가 없으므로 반복문을 종료
            }
        }

        if (isChronicLungDisease) {
            processedData.setResult01("만성폐질환입니다.");
            processedData.setResult01payment(1000000);
        } else {
            processedData.setResult01("해당사항 없음 : 만성폐질환이 아닙니다.");
            processedData.setResult01payment(0);
        }

        boolean isLungCancer = false;  // 초기값을 false로 설정
        boolean hasMetastasis = false; // "전이"라는 단어가 포함되어 있는지 체크하는 변수

        for (AdminDTO02 diag : diagnosis) {
            if (diag.getDiagnosismaincode().startsWith("C34")
                    || diag.getDiagnosisside01code().startsWith("C34")
                    || diag.getDiagnosisside02code().startsWith("C34")) {

                isLungCancer = true;

                if (diag.getDiagnosismain().contains("전이")
                        || diag.getDiagnosisside01().contains("전이")
                        || diag.getDiagnosisside02().contains("전이")) {

                    hasMetastasis = true;
                }
                break;
            }
        }

        if (isLungCancer) {
            if (hasMetastasis) {
                processedData.setResult03("해당사항 없음 (전이로 인한 암 진단 (원발부위가 폐가 아님))");
                processedData.setResult03payment(0);
            } else {
                processedData.setResult03("폐암 진단입니다.");
                processedData.setResult03payment(10000000);
            }
        } else {
            processedData.setResult03("해당사항 없음 : 폐암 진단이 아닙니다.");
            processedData.setResult03payment(0);
        }

        boolean isSurgery = false;  // 초기값을 false로 설정

        for (AdminDTO02 diag : diagnosis) {
            if (diag.getDiagnosissurgery() != null) { // 수술 정보가 null이 아닌 경우
                isSurgery = true;  // 수술이 시행되었음을 나타냄
                break;  // 이미 조건을 만족했기 때문에 더 이상 리스트를 확인할 필요가 없으므로 반복문을 종료
            }
        }

        if (isSurgery) {
            processedData.setResult05("수술 시행");
            processedData.setResult05payment(300000); // 이 부분은 추가적인 로직에 따라 변경이 필요할 수 있습니다.
        } else {
            processedData.setResult05("수술 미시행");
            processedData.setResult05payment(0); // 이 부분은 추가적인 로직에 따라 변경이 필요할 수 있습니다.
        }
        int totalPayment = 0; // 총 지급액을 저장할 변수

        // 각각의 지급액을 숫자로 변환하여 더함
        totalPayment += processedData.getResult01payment();
        totalPayment += processedData.getResult03payment();
        totalPayment += processedData.getResult05payment();
        // 입원비...
        totalPayment += 240000;

        // 총 지급액을 문자열로 변환하여 AdminDTO03 객체에 저장
        processedData.setTotalpayment(totalPayment);

        return processedData; //
    }

}
