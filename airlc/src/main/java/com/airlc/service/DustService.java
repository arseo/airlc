package com.airlc.service;

import java.util.List;
import java.text.SimpleDateFormat;

import com.airlc.dto.DustVO;
 
public interface DustService {
    
    public List<DustVO> selectDust() throws Exception;
    public List<DustVO> LatestDust() throws Exception;
}
