package com.kbstar.gpt;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kbstar.dto.GPTResponse;
import com.kbstar.frame.OpenAIApi;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.ResponseBody;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Call;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
public class OpenAIClient2 {
    //curl 설치 필수!!
    private static final String API_KEY = "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";
    private static final String BASE_URL = "https://api.openai.com/v1/chat/completions";
    private final HttpClient client; //client 객체를 먼저 생성

    //uri는 보내는 서버
    public OpenAIClient2() {
        client = HttpClient.newBuilder().build(); //class가 호출되면 무조건 client 객체를 먼저 생성
        // 즉, 패킷을 생성하기 위해 객체 선언하는 것과 같음. (택배기사 호출)
    }

    public String generateCode(String message) throws IOException, InterruptedException {
        String code = "";//내가 관심 있는 return 값 String code
        //택배기사에게 보낼 송장을 작성해야함. - 요청하는 객체 생성.
        // JSON 형식의 요청 본문 생성
        JsonObject requestBody = new JsonObject();
        requestBody.addProperty("model", "gpt-3.5-turbo");

        JsonArray messages = new JsonArray();
        JsonObject messageObj = new JsonObject();
        messageObj.addProperty("role", "user");
        messageObj.addProperty("content", message);
        messages.add(messageObj);

        requestBody.add("messages", messages);

        // Gson을 사용하여 JSON 요청 본문을 문자열로 변환
        Gson gson = new Gson();
        String requestBodyString = gson.toJson(requestBody);

        String content = null;
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(BASE_URL))
                    .header("Content-Type", "application/json")//송장
                    .header("Authorization", "Bearer " + API_KEY)//송장
                    .POST(HttpRequest.BodyPublishers.ofString(requestBodyString))//post 방식으로 JSON형태로 보낼 거임.
                    .build();
            //택배기사에게 상대 서버에서 받아올 return 객체 선언.
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 200) {
                code = response.body();
                GPTResponse responseObj = gson.fromJson(response.body(), GPTResponse.class);
                log.info(code);
                String id = responseObj.getId();
                content = responseObj.getChoices().get(0).getMessage().getContent();
                log.info(content);

            } else {
                System.out.println("API request failed. Response code: " + response.statusCode());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }

        return content;
    }

}