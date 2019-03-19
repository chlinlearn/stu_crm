package com.ecjtu.po;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="crm_student")
public class Student {
	@Id
	@GeneratedValue(generator="JDBC")
    private Integer id;

    private String stuname;

    private String stucode;

    private String stusex;

    private Integer referid;

    private Integer classid;

    private Date begintime;

    private Date jobtime;

    private String stustate;

    private String checklevel;

    private String remark;

    
    @Override
	public String toString() {
		return "Student [id=" + id + ", stuname=" + stuname + ", stucode=" + stucode + ", stusex=" + stusex
				+ ", referid=" + referid + ", classid=" + classid + ", begintime=" + begintime + ", jobtime=" + jobtime
				+ ", stustate=" + stustate + ", checklevel=" + checklevel + ", remark=" + remark + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname == null ? null : stuname.trim();
    }

    public String getStucode() {
        return stucode;
    }

    public void setStucode(String stucode) {
        this.stucode = stucode == null ? null : stucode.trim();
    }

    public String getStusex() {
        return stusex;
    }

    public void setStusex(String stusex) {
        this.stusex = stusex == null ? null : stusex.trim();
    }

    public Integer getReferid() {
        return referid;
    }

    public void setReferid(Integer referid) {
        this.referid = referid;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getJobtime() {
        return jobtime;
    }

    public void setJobtime(Date jobtime) {
        this.jobtime = jobtime;
    }

    public String getStustate() {
        return stustate;
    }

    public void setStustate(String stustate) {
        this.stustate = stustate == null ? null : stustate.trim();
    }

    public String getChecklevel() {
        return checklevel;
    }

    public void setChecklevel(String checklevel) {
        this.checklevel = checklevel == null ? null : checklevel.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}