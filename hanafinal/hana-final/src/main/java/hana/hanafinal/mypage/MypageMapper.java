package hana.hanafinal.mypage;

import hana.hanafinal.mypage.MypageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MypageMapper {
    List<MypageDTO> findAll();
}
