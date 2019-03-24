package com.ecjtu.po;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="crm_class")
public class CrmClass {
	@Id
	@GeneratedValue(generator="JDBC")
    private Integer id;

    private String classname;

    private Date begintime;

    private Date endtime;

    private String state;

    private Short totalcount;

    private Short gocount;

    private Short leavecount;

    private Integer lessontypeid;

    private Integer teacherid;

    private Integer userid;

    private String uploadfilename;

    private String uploadpath;

    private String remark;

    
    @Override
	public String toString() {
		return "Class [id=" + id + ", classname=" + classname + ", begintime=" + begintime + ", endtime=" + endtime
				+ ", state=" + state + ", totalcount=" + totalcount + ", gocount=" + gocount + ", leavecount="
				+ leavecount + ", lessontypeid=" + lessontypeid + ", teacherid=" + teacherid + ", userid=" + userid
				+ ", uploadfilename=" + uploadfilename + ", uploadpath=" + uploadpath + ", remark=" + remark + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Short getTotalcount() {
        return totalcount;
    }

    public void setTotalcount(Short totalcount) {
        this.totalcount = totalcount;
    }

    public Short getGocount() {
        return gocount;
    }

    public void setGocount(Short gocount) {
        this.gocount = gocount;
    }

    public Short getLeavecount() {
        return leavecount;
    }

    public void setLeavecount(Short leavecount) {
        this.leavecount = leavecount;
    }

    public Integer getLessontypeid() {
        return lessontypeid;
    }

    public void setLessontypeid(Integer lessontypeid) {
        this.lessontypeid = lessontypeid;
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUploadfilename() {
        return uploadfilename;
    }

    public void setUploadfilename(String uploadfilename) {
        this.uploadfilename = uploadfilename == null ? null : uploadfilename.trim();
    }

    public String getUploadpath() {
        return uploadpath;
    }

    public void setUploadpath(String uploadpath) {
        this.uploadpath = uploadpath == null ? null : uploadpath.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}