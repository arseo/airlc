package com.airlc.dao;

import java.util.List;

import com.airlc.dto.DustVO;
 
public interface DustDAO {
    
	public List<DustVO> selectDust() throws Exception;
    public List<DustVO> LatestDust() throws Exception;
    public List<DustVO> ApiDust() throws Exception;
}