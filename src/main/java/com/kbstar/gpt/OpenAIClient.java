package com.kbstar.gpt;

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
@Slf4j
public class OpenAIClient {
    private static final String API_KEY = "///////your api-useless";
    private static final String BASE_URL = "https://api.openai.com/v1/engines/davinci-codex/completions";
    private final OpenAIApi api; // Interface -
    public OpenAIClient() {

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        HttpLoggingInterceptor logging = new HttpLoggingInterceptor();      //로그 설정



        logging.setLevel(HttpLoggingInterceptor.Level.BODY);    //로그 설정

        httpClient.addInterceptor(logging);         //로그 설정
        //JSON 요청 - header : API Key
        httpClient.addInterceptor(chain -> {

            okhttp3.Request original = chain.request();



            okhttp3.Request request = original.newBuilder()
                    .header("Authorization", "Bearer " + API_KEY)
                    .method(original.method(), original.body())
                    .build();
            log.info("=======1========");
            log.info(original.body().toString());
            log.info("=======2========");
            return chain.proceed(request);

        });
        log.info("======3=========");

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .client(httpClient.build())
                .build();
        api = retrofit.create(OpenAIApi.class);
    }
    public String generateCode(String input) {
        String code = "";
        Call<ResponseBody> call = api.generateCode(input);
        try {
            Response<ResponseBody> response = call.execute();// response객체가 정상적으로 잘 수신되었는지 확인함.
            if (response.isSuccessful()) {
                code = response.body().string();
            }
            else {
                throw new IOException("Failed to generate code: " + response.errorBody().string());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }
}