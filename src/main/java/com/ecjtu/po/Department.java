package com.ecjtu.po;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "crm_department")
public class Department{
	@Id
	@GeneratedValue(generator = "JDBC")
	private Integer id;

	@Column(name = "depName")
	private String depName;

	@Column(name = "isCancel")
	private int isCancel;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public int getIsCancel() {
		return isCancel;
	}

	public void setIsCancel(int isCancel) {
		this.isCancel = isCancel;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", depName=" + depName + ", isCancel=" + isCancel + "]";
	}


}
