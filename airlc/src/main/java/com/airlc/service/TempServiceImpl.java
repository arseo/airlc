package com.airlc.service;

import java.util.List;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;
 
import com.airlc.dao.TempDAO;
import com.airlc.dto.DustVO;
import com.airlc.dto.TempVO;
 
@Service
public class TempServiceImpl implements TempService {
 
    @Inject
    private TempDAO dao;
    
    @Override
    public List<TempVO> selectTemp() throws Exception {
 
        return dao.selectTemp();
    }
    @Override
    public List<TempVO> LatestTemp() throws Exception {
 
        return dao.LatestTemp();
    }
}
