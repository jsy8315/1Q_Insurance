package hana.hanafinal.claim;

import hana.hanafinal.diagnosis.DiagnosisDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ClaimMapper {
    // MyProduct 테이블에서 특정 userId와 status=0에 대한 InsuranceProductID들을 조회하는 메서드
    List<ClaimDTO> getMyProducts(int userId);
    List<ClaimDTO04> getMyClaims(int userId);
    void insertClaim(ClaimDTO02 claimDTO02);
    void updateHospitalHistoryId(@Param("historyId") String historyId);
    List<ClaimDTO03> selectClaimsWithStatusOne();

    void updateImagePaths(@Param("diagnosisImagePath") String diagnosisImagePath,
                          @Param("hospitalizationImagePath") String hospitalizationImagePath);
}
