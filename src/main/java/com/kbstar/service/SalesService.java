package com.kbstar.service;

import com.kbstar.dto.Sales;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.SalesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalesService implements KBService<Date, Sales> {
    @Autowired
    SalesMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param sales
     */
    @Override
    public void register(Sales sales) throws Exception {
        mapper.insert(sales);
    }

    @Override
    public void remove(Date date) throws Exception {

    }

    @Override
    public void modify(Sales sales) throws Exception {

    }

    @Override
    public Sales get(Date date) throws Exception {
        return null;
    }

    @Override
    public List<Sales> get() throws Exception {
        return mapper.selectall();
    }

    public List<Sales> groupsales() throws Exception{
        return mapper.groupsales();
    }


}
