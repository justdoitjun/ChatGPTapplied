package com.kbstar.gpt;

import java.util.Objects;

public class GeneratedCodeResult {
    private final String result;

    public GeneratedCodeResult(String result) {
        this.result = result;
    }

    public String getResult() {
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GeneratedCodeResult that = (GeneratedCodeResult) o;
        return Objects.equals(result, that.result);
    }

    @Override
    public int hashCode() {
        return Objects.hash(result);
    }

    @Override
    public String toString() {
        return "GeneratedCodeResult{" +
                "result='" + result + '\'' +
                '}';
    }
}
