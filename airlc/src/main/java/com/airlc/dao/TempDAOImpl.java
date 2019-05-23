package com.airlc.dao;

import java.util.List;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.airlc.dto.TempVO;
 
@Repository
public class TempDAOImpl implements TempDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.airlc.mapper.tempMapper";
    
    @Override
    public List<TempVO> selectTemp() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectTemp");
    }
 
}
