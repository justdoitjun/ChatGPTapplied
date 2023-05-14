package com.kbstar.gpt;

import com.google.gson.Gson;

public class PromptRequest {
    private final String input;

    public PromptRequest(String input) {
        this.input = input;
    }

    public String input() {
        return input;
    }

    public String toJsonString() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}


