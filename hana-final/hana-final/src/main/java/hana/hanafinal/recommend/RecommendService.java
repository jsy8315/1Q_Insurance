package hana.hanafinal.recommend;

import java.util.*;

import hana.hanafinal.recommend.InsuranceProductDTO;
import hana.hanafinal.recommend.RecommendDTO;
import hana.hanafinal.recommend.RecommendMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendService {

    @Autowired
    private RecommendMapper recommendMapper;

    public Map<String, Integer> getScoresByUserId(int userId) {
        RecommendDTO recommendDTO = recommendMapper.findByUserId(userId);
        Map<String, Integer> unsortedMap  = new HashMap<>();

        if (recommendDTO.getDg01score() > 60) unsortedMap .put("dg01score", recommendDTO.getDg01score());
        if (recommendDTO.getDg02score() > 60) unsortedMap .put("dg02score", recommendDTO.getDg02score());
        if (recommendDTO.getDg03score() > 60) unsortedMap .put("dg03score", recommendDTO.getDg03score());
        if (recommendDTO.getDg04score() > 60) unsortedMap .put("dg04score", recommendDTO.getDg04score());
        if (recommendDTO.getDg05score() > 60) unsortedMap .put("dg05score", recommendDTO.getDg05score());
        if (recommendDTO.getDg06score() > 60) unsortedMap .put("dg06score", recommendDTO.getDg06score());
        if (recommendDTO.getDg07score() > 60) unsortedMap .put("dg07score", recommendDTO.getDg07score());
        if (recommendDTO.getDg08score() > 60) unsortedMap .put("dg08score", recommendDTO.getDg08score());

        Map<String, Integer> sortedMap = new TreeMap<>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return unsortedMap.get(o2).compareTo(unsortedMap.get(o1));
            }
        });
        sortedMap.putAll(unsortedMap);

        return sortedMap;
        //{"dg01score": 45, "dg02score": 70, ...}으로 반환인데 내림차순으로 반환
    }

    public List<InsuranceProductDTO> getRecommendedProducts(String scoreKey) {
        String query = getSearchQuery(scoreKey);
        return recommendMapper.findInsuranceByScope(query);
    }

    private String getSearchQuery(String scoreKey) {
        String query = "";
        switch(scoreKey) {
            case "dg01score":
            case "dg02score":
                query = "%뇌% OR insurancescope LIKE %심%";
                break;
            case "dg03score":
                query = "%혈압%";
                break;
            case "dg04score":
                query = "%당뇨%";
                break;
            case "dg05score":
                query = "%신장%";
                break;
            case "dg06score":
                query = "%폐%";
                break;
            case "dg07score":
                query = "%간%";
                break;
            case "dg08score":
                query = "%갑상%";
                break;
        }
        return query;
    }
}
