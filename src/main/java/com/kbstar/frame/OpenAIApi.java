package com.kbstar.frame;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Headers;
import retrofit2.http.POST;
public interface OpenAIApi {
    @Headers("Content-Type: application/json")
    @POST("v1/engines/davinci-codex/completions")
    Call<ResponseBody> generateCode(@Body String input);
}
