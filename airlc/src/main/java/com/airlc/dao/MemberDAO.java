package com.airlc.dao;

import java.util.List;

import com.airlc.dto.MemberVO;
 
public interface MemberDAO {
	
	public MemberVO login(MemberVO dto);
}