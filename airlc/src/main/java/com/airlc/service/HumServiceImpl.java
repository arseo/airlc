package com.airlc.service;

import java.util.List;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;
 
import com.airlc.dao.HumDAO;
import com.airlc.dto.HumVO;
 
@Service
public class HumServiceImpl implements HumService {
 
    @Inject
    private HumDAO dao;
    
    @Override
    public List<HumVO> selectHum() throws Exception {
 
        return dao.selectHum();
    }
 
}
