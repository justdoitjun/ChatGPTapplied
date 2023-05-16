package com.kbstar.stockexchange;

import com.kbstar.exchange.FXExchange;
import com.kbstar.exchange.StockExchange;
import lombok.extern.slf4j.Slf4j;
import okhttp3.internal.connection.Exchange;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest2 {


    @Test
    void contextLoads() {
        try {
            //1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
            StockExchange stockExchange1 = new StockExchange();
            String input = "IBM";
            stockExchange1.generateCode(input);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
