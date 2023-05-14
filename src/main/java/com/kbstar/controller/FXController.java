package com.kbstar.controller;

import com.kbstar.exchange.FXExchange;
import com.kbstar.gpt.OpenAIClient2;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/sales/fxechange")
public class FXController {

    //https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=AUTHKEY1234567890&searchdate=20180102&data=AP01
    @GetMapping("/generate")
    @ResponseBody
    public String generateCode(@RequestParam("searchdate") String searchdate) throws Exception{
        log.info("=========");
        log.info(searchdate);
        log.info("=========");
        try {
            FXExchange fxExchange = new FXExchange();
            String code = fxExchange.generateCode(searchdate);
            return code;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred";
        }
    }

}

