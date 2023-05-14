package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {
    @Autowired
    CustService custService;
    String dir = "cust/";

    @RequestMapping("")
    public String add(Model model){
        model.addAttribute("center", dir+"center");
        return "index";
    }
    @RequestMapping("/all")
    public String all(Model model) throws Exception{

        List<Cust> clist = null;
        clist = custService.get();

        model.addAttribute("clist",clist);
        model.addAttribute("center", dir+"all");
        return "index";
    }
    //전체명단 보게
    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception{
        Cust cust = new Cust();
        cust = custService.get(id);
        //String name = cust.getName();
        log.info(id);
        model.addAttribute("custInfo",cust);
        model.addAttribute("center", dir+"detail");
        return "index";
    }



}