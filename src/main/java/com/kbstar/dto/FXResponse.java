package com.kbstar.dto;

import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class FXResponse {
   private Integer RESULT;//1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
   private String CUR_UNIT;
   private String CUR_NM;
   private String TTB;
   private String TTS;
   private String DEAL_BAS_R;
   private String BKPR;
   private String YY_EFEE_R;
   private String TEN_DD_EFEE_R;
   private String KFTC_DEAL_BAS_R;
   private String KFTC_BKPR;
}
