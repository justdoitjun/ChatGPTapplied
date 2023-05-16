package com.kbstar.stockexchange;

import com.kbstar.exchange.StockSearch;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class StockSearchTest {


    @Test
    void contextLoads() {
        try {
            //1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
            StockSearch stockSearch1 = new StockSearch();
            String input = "IBM";
            stockSearch1.generateCode(input);
        } catch(Exception e){
            e.printStackTrace();
        }
    }


}
