package com.project.member;


public class MemberBean {
	private String id;
	private String pass;
	private String name;
	private String addr;
	private String addr1;
	private String addr2;
	private String addr3;
	private String addr4;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getAddr4() {
		return addr4;
	}
	public void setAddr4(String addr4) {
		this.addr4 = addr4;
	}
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pass=" + pass + ", name=" + name + ", addr=" + addr + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", addr3=" + addr3 + ", addr4=" + addr4 + "]";
	}
	

	
	
	
	
	
}
