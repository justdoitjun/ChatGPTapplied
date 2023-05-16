package com.kbstar.exchange;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kbstar.dto.FXResponse;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;


import java.io.*;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

@Slf4j
public class BSSearch {

    private static final String authkey = "3e004a24d33cc601027df6ee023ed38ef41d4cd1";
    private static final String BASE_URL = "https://opendart.fss.or.kr/api/corpCode.xml";

    private static final String filePath = "/Users/junhyeokchoi/Desktop/";
//    파일 저장 때문에 만들어지는 것으로 맥이냐 윈도우냐에 따라 변경해줘야하는 불편함은 있다.
    private final HttpClient client;





    public BSSearch() {
        client = HttpClient.newBuilder().build();
    }
    //https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=AUTHKEY1234567890&searchdate=20180102&data=AP01
    public String generateCode() throws Exception {
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
                    .uri(URI.create(BASE_URL + "?crtfc_key=" + authkey))
                    .GET()
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 200) {
                code = response.body();
                log.info("=====");
                log.info(code);
                log.info("=====");
                try {
                    File lOutFile = new File(filePath  + "corpcode.zip");
                    FileOutputStream lFileOutputStream = new FileOutputStream(lOutFile);
                    lFileOutputStream.write(code.getBytes());
                    lFileOutputStream.close();

                } catch (Exception e){
                    e.printStackTrace();
                }
            } else {
                System.out.println("API request failed. Response code: " + response.statusCode());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return code;
    }

    public static void unZip(String ZipFilePath, String FilePath) {
        File Destination_Directory = new File(FilePath);
        if (!Destination_Directory.exists()) {
            Destination_Directory.mkdir();
        }//디렉토리 없으면 만드세요.
        try {

            ZipInputStream Zip_Input_Stream = new ZipInputStream(new FileInputStream(ZipFilePath));
            ZipEntry Zip_Entry = Zip_Input_Stream.getNextEntry();

            while (Zip_Entry != null) {
                String File_Path = FilePath + File.separator + Zip_Entry.getName();
                if (!Zip_Entry.isDirectory()) {
                    extractFile(Zip_Input_Stream, File_Path);//에러가 나는 곳
                } else {

                    File directory = new File(File_Path);
                    directory.mkdirs();
                }
                Zip_Input_Stream.closeEntry();
                Zip_Entry = Zip_Input_Stream.getNextEntry();
            }
            Zip_Input_Stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static void extractFile(ZipInputStream Zip_Input_Stream, String File_Path) throws IOException {
        int BUFFER_SIZE = 4096;

        BufferedOutputStream Buffered_Output_Stream = new BufferedOutputStream(new FileOutputStream(File_Path));
        byte[] Bytes = new byte[BUFFER_SIZE];
        int Read_Byte = 0;
        while ((Read_Byte = Zip_Input_Stream.read(Bytes)) != -1) {
            Buffered_Output_Stream.write(Bytes, 0, Read_Byte);
        }
        Buffered_Output_Stream.close();
    }





}
