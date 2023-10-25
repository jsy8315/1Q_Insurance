package hana.hanafinal.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {
    void insertMyProduct(String insuranceProductId);
}

