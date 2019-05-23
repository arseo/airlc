package com.airlc.dao;

import java.util.List;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.airlc.dto.HumVO;
 
@Repository
public class HumDAOImpl implements HumDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.airlc.mapper.humMapper";
    
    @Override
    public List<HumVO> selectHum() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectHum");
    }
 
}
