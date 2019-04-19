package com.ecjtu.po;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "crm_staff")
public class Staff {
	@Id
	@GeneratedValue(generator = "JDBC")
	private Integer id;

	@Column(name = "staffCode")
	private String staffCode;
	
	@Column(name = "loginName")
	private String loginName;
	
	@Column(name = "loginPwd")
	private String loginPwd;
	
	@Column(name = "staffName")
	private String staffName;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "birthday")
	private Date birthday;
	
	@Column(name = "onDutyDate")
	private Date onDutyDate;
	
	@Column(name = "postID")
	private Integer postID;
	
	@Column(name = "state")
	private Short state;

	@Column(name="isDelete")
	private Integer isDelete;
	
	@Transient
	private String postName;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public Date getOnDutyDate() {
		return onDutyDate;
	}

	public void setOnDutyDate(Date onDutyDate) {
		this.onDutyDate = onDutyDate;
	}

	public Integer getPostID() {
		return postID;
	}

	public void setPostID(Integer postID) {
		this.postID = postID;
	}

	public Short getState() {
		return state;
	}

	public void setState(Short state) {
		this.state = state;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", staffCode=" + staffCode + ", loginName=" + loginName + ", loginPwd=" + loginPwd
				+ ", staffName=" + staffName + ", gender=" + gender + ", email=" + email + ", birthday=" + birthday
				+ ", onDutyDate=" + onDutyDate + ", postID=" + postID + ", state=" + state + ", isDelete=" + isDelete
				+ ", postName=" + postName + "]";
	}

}