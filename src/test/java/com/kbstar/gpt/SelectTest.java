package com.kbstar.gpt;

import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {

    OpenAIClient openAIClient;
    @Test
    void contextLoads() {
        try {
            OpenAIClient openAiClinet1 = new OpenAIClient();
            String input = "Hello World!";
            openAiClinet1.generateCode(input);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
