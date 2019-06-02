package com.airlc.service;

import java.util.List;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;
 
import com.airlc.dao.DustDAO;
import com.airlc.dto.DustVO;
 
@Service
public class DustServiceImpl implements DustService {
 
    @Inject
    private DustDAO dao;
    
    @Override
    public List<DustVO> selectDust() throws Exception {
 
        return dao.selectDust();
    }
    @Override
    public List<DustVO> LatestDust() throws Exception {
 
        return dao.LatestDust();
    }
    @Override
    public List<DustVO> ApiDust() throws Exception {
 
        return dao.ApiDust();
    }
 
}