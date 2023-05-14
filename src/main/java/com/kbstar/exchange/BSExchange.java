package com.kbstar.exchange;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kbstar.dto.FXResponse;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

@Slf4j
public class BSExchange {
    private static final String authkey = "3e004a24d33cc601027df6ee023ed38ef41d4cd1";
    private static final String BASE_URL = "https://opendart.fss.or.kr/api/fnlttSinglAcnt.json";
    private final HttpClient client;

    public BSExchange() {
        client = HttpClient.newBuilder().build();
    }
//https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=AUTHKEY1234567890&searchdate=20180102&data=AP01
    public String generateCode(String corp_code,String bsns_year, String reprt_code) throws Exception {
        String code = "";

        // JSON 형식의 요청 본문 생성
        JsonObject requestBody = new JsonObject();

        // Gson을 사용하여 JSON 요청 본문을 문자열로 변환
        Gson gson = new Gson();
        String requestBodyString = gson.toJson(requestBody);

        FXResponse responseObj = null;

        List<FXResponse> responseList = null;
        JSONObject obj;
        obj = null;
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(BASE_URL + "?crtfc_key=" + authkey + "&corp_code=" + corp_code + "&bsns_year=" + bsns_year + "&reprt_code=" + reprt_code))
                    .GET()
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 200) {
                code = response.body();

                log.info("==========");
                log.info(code);
                log.info("==========");
            } else {
                System.out.println("API request failed. Response code: " + response.statusCode());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return code;
    }
}
