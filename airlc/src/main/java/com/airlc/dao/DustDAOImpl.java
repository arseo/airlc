package com.airlc.dao;

import java.util.List;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.airlc.dto.DustVO;
 
@Repository
public class DustDAOImpl implements DustDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.airlc.mapper.dustMapper";
    
    @Override
    public List<DustVO> selectDust() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectDust");
    }
    public List<DustVO> LatestDust() throws Exception {
        
        return sqlSession.selectList(Namespace+".LatestDust");
    }
    public List<DustVO> ApiDust() throws Exception {

        return sqlSession.selectList(Namespace+".ApiDust");
    }
 
}