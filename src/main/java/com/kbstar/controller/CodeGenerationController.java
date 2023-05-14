package com.kbstar.controller;

import com.kbstar.gpt.OpenAIClient;
import com.kbstar.gpt.GeneratedCodeResult;
import com.kbstar.gpt.PromptRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/codegeneration")
public class CodeGenerationController {

    OpenAIClient openAIClient;
//    public CodeGenerationController(OpenAIClient openAIClient) {
//        this.openAIClient = openAIClient;
//    }
    @PostMapping("/generate")
    public GeneratedCodeResult generateCode(@RequestBody PromptRequest promptRequest) {
        String input = promptRequest.input();
        String generatedCode = openAIClient.generateCode(input);
        return new GeneratedCodeResult(generatedCode);
    }
}
