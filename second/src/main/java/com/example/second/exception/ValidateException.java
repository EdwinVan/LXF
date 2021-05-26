package com.example.second.exception;

public class ValidateException extends RuntimeException{
    private String code;
    private String msg;

    public String getCode() { return code; }

    public void setCode(String code) { this.code = code; }

    public String getMsg() { return msg; }

    public void setMsg(String msg) { this.msg = msg; }

    public ValidateException(String code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

}
