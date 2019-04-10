package com.ecjtu.po;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="crm_post")
public class Post {
	@Id
	@GeneratedValue(generator="JDBC")
    private Integer id;

	@Column(name="postName")
    private String postName;
	
	@Column(name="depID")
    private Integer depID;
    
	@Column(name="isCancel")
	private Integer isCancel;
	
    @Transient
    private String depName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public Integer getDepID() {
		return depID;
	}

	public void setDepID(Integer depID) {
		this.depID = depID;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}
	


	public Integer getIsCancel() {
		return isCancel;
	}

	public void setIsCancel(Integer isCancel) {
		this.isCancel = isCancel;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", postName=" + postName + ", depID=" + depID + ", isCancel=" + isCancel
				+ ", depName=" + depName + "]";
	}

}