package hana.hanafinal.admin;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {
    List<AdminDTO> findAll();
    List<AdminDTO> getClaimRequests();
    List<AdminDTO> getClaimById(int claimId);
    List<AdminDTO02> getDiagnosisByClaimId(int claimId);

    List<AdminDTO04> getJoinRequests();
    List<AdminDTO05> getUsersBymyproductId(int myproductId);
    List<AdminDTO07> getInsuranceProductsBymyproductId(int myproductId);
    List<AdminDTO06> getBiowalletBymyproductId(int myproductId);

    void updateMyProduct(int myproductId);
}
