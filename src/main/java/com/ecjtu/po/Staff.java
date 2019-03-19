package com.ecjtu.po;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="crm_staff")
public class Staff {
	@Id
	@GeneratedValue(generator="JDBC")
    private Integer id;

    private String staffcode;

    private String loginname;

    private String loginpwd;

    private String staffname;

    private String gender;

    private String email;

    private Date birthday;

    private Date ondutydate;

    private Integer postid;

    private Short state;

    
    @Override
	public String toString() {
		return "Staff [id=" + id + ", staffcode=" + staffcode + ", loginname=" + loginname + ", loginpwd=" + loginpwd
				+ ", staffname=" + staffname + ", gender=" + gender + ", email=" + email + ", birthday=" + birthday
				+ ", ondutydate=" + ondutydate + ", postid=" + postid + ", state=" + state + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStaffcode() {
        return staffcode;
    }

    public void setStaffcode(String staffcode) {
        this.staffcode = staffcode == null ? null : staffcode.trim();
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getLoginpwd() {
        return loginpwd;
    }

    public void setLoginpwd(String loginpwd) {
        this.loginpwd = loginpwd == null ? null : loginpwd.trim();
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname == null ? null : staffname.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getOndutydate() {
        return ondutydate;
    }

    public void setOndutydate(Date ondutydate) {
        this.ondutydate = ondutydate;
    }

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public Short getState() {
        return state;
    }

    public void setState(Short state) {
        this.state = state;
    }
}