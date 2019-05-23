package com.airlc.service;

import java.util.List;
import java.text.SimpleDateFormat;

import com.airlc.dto.HumVO;
 
public interface HumService {
    
    public List<HumVO> selectHum() throws Exception;
}
