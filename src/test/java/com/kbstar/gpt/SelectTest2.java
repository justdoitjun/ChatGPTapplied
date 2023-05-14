package com.kbstar.gpt;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest2 {

    OpenAIClient2 openAIClient;
    @Test
    void contextLoads() {
        try {
            OpenAIClient2 openAiClinet2 = new OpenAIClient2();
            String input = "Hello World!";
            openAiClinet2.generateCode(input);
//            JSONObject body = new JSONObject();
//            body.put("role", "user");
//            body.put("content" , input);
//            JSONArray bodyArray = new JSONArray();
//            JSONObject realBody = new JSONObject();
//            realBody.put("model", "gpt-3.5-turbo");
//            realBody.put("messages", bodyArray);
//            realBody.toJSONString();
//            openAIClient.request(realBody.toJSONString());
//            openAiClinet1.generateCode(input);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
