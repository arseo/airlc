package com.airlc.dao;

import java.util.List;

import com.airlc.dto.TempVO;
 
public interface TempDAO {
    
    public List<TempVO> selectTemp() throws Exception;
    public List<TempVO> LatestTemp() throws Exception;
}