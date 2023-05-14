package com.kbstar.controller;

import com.kbstar.gpt.OpenAIClient;
import com.kbstar.gpt.OpenAIClient2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sales/gpt")
public class ChatController {

    @GetMapping("/generate")
    @ResponseBody
    public String generateCode(@RequestParam("message") String message) {
        try {
            OpenAIClient2 openAIClient2 = new OpenAIClient2();
            String code = openAIClient2.generateCode(message);
            return code;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred";
        }
    }
}

