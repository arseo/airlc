package com.airlc.service;

import java.util.List;

import com.airlc.dto.MemberVO;
 
public interface MemberService {
    
    public List<MemberVO> selectMember() throws Exception;
}
