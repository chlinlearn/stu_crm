package com.ecjtu.po;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="crm_post")
public class Post {
	@Id
	@GeneratedValue(generator="JDBC")
    private Integer id;

    private String postname;

    private Integer depid;

    
    @Override
	public String toString() {
		return "Post [id=" + id + ", postname=" + postname + ", depid=" + depid + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPostname() {
        return postname;
    }

    public void setPostname(String postname) {
        this.postname = postname == null ? null : postname.trim();
    }

    public Integer getDepid() {
        return depid;
    }

    public void setDepid(Integer depid) {
        this.depid = depid;
    }
}