package com.kbstar.bsexchange;

import com.kbstar.exchange.BSExchange;
import com.kbstar.exchange.FXExchange;
import lombok.extern.slf4j.Slf4j;
import okhttp3.internal.connection.Exchange;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest2 {

    FXExchange fxExchange;
    @Test
    void contextLoads() {
        try {

            BSExchange bsExchange1 = new BSExchange();
            String corp_code = "00126380";
            String bsns_year = "2018";
            String reprt_code = "11011";
            bsExchange1.generateCode(corp_code, bsns_year, reprt_code);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
