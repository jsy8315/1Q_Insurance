package HANA_FINAL_OPENAPI.hanaHospital;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    Map<String, Object> getHospitalCheckData();
    List<HistoryDTO> selectHistoriesByDateRange(@Param("startdate") String startdate, @Param("enddate") String enddate);
}
