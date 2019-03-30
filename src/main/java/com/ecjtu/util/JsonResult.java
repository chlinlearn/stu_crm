package com.ecjtu.util;

public class JsonResult<T> {
	
	/* 
	 * 状态码，
	 * 状态信息，
	 * 目标数据 
	 */
			
	private int code;
	private String message;
	private T data;

	private JsonResult() {
	}

	/*
	 * 构造函数 操作成功，返回数据
	 */
	private JsonResult(int code, String message, T data) {
		this.code = code;
		this.message = message;
		this.data = data;
	}

	/* 只返回状态码 */
	public JsonResult(int code) {
		this.code = code;
	}	

	public static <T> JsonResult<T> success(String msg, T data) {
		return new JsonResult<T>(ResultStatus.OK.getCode(), msg, data);
	}

	public static <T> JsonResult<T> error(ResultStatus status, String msg) {
		return new JsonResult<T>(ResultStatus.REQUEST_ERROR.getCode(), msg, null);
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
