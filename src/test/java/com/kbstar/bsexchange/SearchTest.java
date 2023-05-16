package com.kbstar.bsexchange;

import com.kbstar.exchange.BSExchange;
import com.kbstar.exchange.BSSearch;
import com.kbstar.exchange.FXExchange;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SearchTest {

    FXExchange fxExchange;
    @Test
    void contextLoads() {
        try {

            BSSearch bsSearch = new BSSearch();
            bsSearch.generateCode();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    @Test
    void unZip() {
        try {

            BSSearch bsSearch = new BSSearch();
           bsSearch.unZip("/Users/junhyeokchoi/spring/logs/corpcode.zip", "/Users/junhyeokchoi/spring/logs/corpcode/");
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
