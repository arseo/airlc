package com.airlc.dao;

import java.util.List;

import com.airlc.dto.DustVO;
import com.airlc.dto.HumVO;
 
public interface HumDAO {
    
    public List<HumVO> selectHum() throws Exception;
    public List<HumVO> LatestHum() throws Exception;
}