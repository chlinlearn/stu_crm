package com.ecjtu.util;

public class JsonResult {
	
	private int code;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	private ResultStatus JsonResult(ResultStatus status) {
		return status;
	}
	
	private JsonResult() {
		
	}

	
}
