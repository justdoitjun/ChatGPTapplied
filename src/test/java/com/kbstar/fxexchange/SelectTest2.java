package com.kbstar.fxexchange;

import com.kbstar.exchange.FXExchange;
import com.kbstar.gpt.OpenAIClient2;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest2 {

    FXExchange fxExchange;
    @Test
    void contextLoads() {
        try {
            //1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
            FXExchange fxExchange1 = new FXExchange();
            String input = "20230502";
            fxExchange1.generateCode(input);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
