package com.airlc.service;

import java.util.List;
import java.text.SimpleDateFormat;

import com.airlc.dto.TempVO;
 
public interface TempService {
    
    public List<TempVO> selectTemp() throws Exception;
}
