package com.airlc.dao;

import java.util.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.airlc.dto.HumVO;
import com.airlc.dto.MemberVO;
 
@Repository
public class MemberDAOImpl implements MemberDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.airlc.mapper.memberMapper";
    
    @Override
	public MemberVO login(MemberVO dto){
		// Mapper의 namespace명.id : 자신에게 맞게 작성해서 넣는다.
    	try {
    		/*System.out.println(dto.getId());
    		System.out.println(dto.getPw());*/
    		dto = sqlSession.selectOne(Namespace+".selectMember", dto);
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
		return dto;
	}
 
}
