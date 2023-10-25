package HANA_FINAL_OPENAPI.hanaHospital;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardMapper boardMapper;
    public Map<String, Object> getHospitalCheckData() {
        //BoardMapper.getHospitalCheckData() 메소드를 호출하여 실제 데이터를 가져옴
        return boardMapper.getHospitalCheckData();
        //가져온 데이터는 Map<String, Object> 형태로 반환되고,
        // 이 데이터는 BoardController로 넘어감
    }

    public List<HistoryDTO> fetchHistories(String startdate, String enddate) {
        return boardMapper.selectHistoriesByDateRange(startdate, enddate);
    }
}
