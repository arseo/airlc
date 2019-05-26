package com.airlc.dto;

public class MemberVO {
	 
    private String id;
    private String pw;
    private String firstname;
    private String lastname;
 
    public String getId() {
        return id;
    }
 
    public void setId(String id) {
        this.id = id;
    }
 
    public String getPw() {
        return pw;
    }
 
    public void setPw(String pw) {
        this.pw = pw;
    }
 
    public String getName() {
        return firstname;
    }
 
    public void setName(String name) {
        this.firstname = name;
    }

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
 
}