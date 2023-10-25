package hana.hanafinal.predict;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PredictMapper {
    void updatePredictData(PredictDTO predictDTO);
}
