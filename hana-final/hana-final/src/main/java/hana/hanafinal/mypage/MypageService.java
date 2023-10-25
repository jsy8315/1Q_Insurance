package hana.hanafinal.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MypageService {

    @Autowired
    private MypageMapper mypageMapper;

    public List<MypageDTO> findAll() {return mypageMapper.findAll();}
}
