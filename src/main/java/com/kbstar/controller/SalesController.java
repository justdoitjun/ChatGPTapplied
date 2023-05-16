package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.exchange.BSExchange;
import com.kbstar.exchange.FXExchange;
import com.kbstar.exchange.StockExchange;
import com.kbstar.exchange.StockSearch;
import com.kbstar.service.CustService;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import okhttp3.internal.connection.Exchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Slf4j
@Controller
@RequestMapping("/sales")
public class SalesController {
    @Autowired
    SalesService salesService;
    String dir = "sales/";

    @RequestMapping("")
    public String sales(Model model){
        model.addAttribute("entireIndex", dir + "index");
        return "index";
    }
    @RequestMapping("/netIncome")
    public String all(Model model) throws Exception{
        model.addAttribute("entireIndex", dir+"netIncome/overlook");
        return "index";
    }

    @RequestMapping("/netIncome/analyticalprocedure")
    public String ap(Model model) throws Exception{
        model.addAttribute("entireIndex", dir+"netIncome/ap");
        return "index";
    }
    //전체명단 보게

    @RequestMapping("/gpt")
    public String gpt(Model model) throws Exception{
        model.addAttribute("entireIndex", "gpt/"+"gpt");
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception{
        Cust cust = new Cust();

        //String name = cust.getName();
        log.info(id);
        model.addAttribute("custInfo",cust);
        model.addAttribute("center", dir+"detail");
        return "index";
    }


    //https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=AUTHKEY1234567890&searchdate=20180102&data=AP01
    @RequestMapping("/fxexchange")
    public String fxexchange(Model model) throws Exception{
        model.addAttribute("entireIndex", dir+"fxexchange/" + "overlook");
        return "index";
    }

    @RequestMapping("/bsexchange")
    public String bsexchange(Model model) throws Exception{
        model.addAttribute("entireIndex", dir+"bsexchange/" + "overlook");
        return "index";
    }


    @GetMapping("/bsexchange/generate")
    @ResponseBody
    public String generateCode(@RequestParam("corp_code") String corp_code,
                               @RequestParam("bsns_year") String bsns_year,
                               @RequestParam("reprt_code") String reprt_code) throws Exception{
        log.info("=========");
        log.info(corp_code);
        log.info(bsns_year);
        log.info(reprt_code);
        log.info("=========");
        try {
            BSExchange bsExchange = new BSExchange();
            String code = bsExchange.generateCode(corp_code, bsns_year, reprt_code);
            return code;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred";
        }
    }

    @RequestMapping("/investment")
    public String stockexchange(Model model) throws Exception{
        model.addAttribute("entireIndex", dir+"investment/" + "overlook");
        return "index";
    }
    @GetMapping("/investment/search")
    @ResponseBody
    public String searchCompany(@RequestParam("keywords") String keywords) throws Exception{
        log.info("=========");
        log.info(keywords);
        log.info("=========");
        try {
            StockSearch stockSearch = new StockSearch();
            String code = stockSearch.generateCode(keywords);
            return code;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred";
        }
    }
    @GetMapping("/investment/generate")
    @ResponseBody
    public String generateStock(@RequestParam("symbol") String symbol) throws Exception{
        log.info("=========");
        log.info(symbol);
        log.info("=========");
        try {
            StockExchange stockExchange = new StockExchange();
            String code = stockExchange.generateCode(symbol);
            return code;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred";
        }
    }


}