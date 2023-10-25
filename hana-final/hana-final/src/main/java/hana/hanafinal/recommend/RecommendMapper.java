package hana.hanafinal.recommend;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecommendMapper {
        RecommendDTO findByUserId(int userId);
        List<InsuranceProductDTO> findInsuranceByScope(String query);
}

