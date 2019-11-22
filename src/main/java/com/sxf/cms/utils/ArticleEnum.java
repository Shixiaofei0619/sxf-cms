package com.sxf.cms.utils;
/**
 * 枚举类型
 * @author Lenovo
 *
 */
public enum ArticleEnum {

	HTML(0,"html"),IMAGE(1,"image");
	private ArticleEnum(Integer code, String name) {
		this.code = code;
		this.name = name;
	}
	
	
	private Integer code;
	private String name;
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public static void main(String[] args) {
		System.out.println(HTML.getCode());
		System.out.println(HTML.getName());
	}
}
