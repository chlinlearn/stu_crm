package com.ecjtu.po;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="crm_refer")
public class Refer {
	@Id
	@GeneratedValue(generator="JDBC")
    private Integer id;

    private String source;

    private Integer userid;
    
//    po(对应数据表),vo(对应查询),dto(多个服务间查询的对象)
    
    @Transient
    private String referName;

	private String username;

    private String gender;

    private String address;

    private String email;

    private String idcard;

    private String phone;

    private String weixin;

    private String qq;

    private String shopgood;

    private String state;

    private Short isjob;

    private String byacademy;

    private String resourcelevel;

    private String remark;

    @Override
	public String toString() {
		return "Refer [id=" + id + ", source=" + source + ", userid=" + userid + ", username=" + username + ", gender="
				+ gender + ", address=" + address + ", email=" + email + ", idcard=" + idcard + ", phone=" + phone
				+ ", weixin=" + weixin + ", qq=" + qq + ", shopgood=" + shopgood + ", state=" + state + ", isjob="
				+ isjob + ", byacademy=" + byacademy + ", resourcelevel=" + resourcelevel + ", remark=" + remark + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
    public String getReferName() {
		return referName;
	}

	public void setReferName(String referName) {
		this.referName = referName;
	}
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin == null ? null : weixin.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getShopgood() {
        return shopgood;
    }

    public void setShopgood(String shopgood) {
        this.shopgood = shopgood == null ? null : shopgood.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Short getIsjob() {
        return isjob;
    }

    public void setIsjob(Short isjob) {
        this.isjob = isjob;
    }

    public String getByacademy() {
        return byacademy;
    }

    public void setByacademy(String byacademy) {
        this.byacademy = byacademy == null ? null : byacademy.trim();
    }

    public String getResourcelevel() {
        return resourcelevel;
    }

    public void setResourcelevel(String resourcelevel) {
        this.resourcelevel = resourcelevel == null ? null : resourcelevel.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}