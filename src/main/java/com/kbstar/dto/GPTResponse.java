package com.kbstar.dto;

import lombok.*;

import java.net.ContentHandler;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class GPTResponse {
    private String id;
    private String object;
    private long created;
    private List<Choice> choices;
    private Usage usage;



    // Getters and Setters

    public static class Choice {
        private int index;
        private Message message;
        private String finish_reason;

        public Message getMessage() {
            return message;
        }

        // Getters and Setters

        public static class Message {
            private String role;
            private String content;

            // Getters and Setters
            public String getContent() {
                return content;
            }

            public void setContent(String content) {
                this.content = content;
            }
        }
    }

    public static class Usage {
        private int prompt_tokens;
        private int completion_tokens;
        private int total_tokens;

        // Getters and Setters
    }

    public String getMessageContent() {
        if (choices != null && !choices.isEmpty()) {
            Choice choice = choices.get(0);
            if (choice != null && choice.getMessage() != null) {
                return choice.getMessage().getContent();
            }
        }
        return null;
    }
}
