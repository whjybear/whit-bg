package com.whit.crm.pojo;
/**
 * 证书
 * @author bear
 *
 */

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FrmCertificate {
	//id  	key
	int id;
	//标题		-- 课程
	String title;
	
	//开课城市
	String city;
	
	//证书签名老师
	String signTeacher;
	
	//开始时间
	Date startTime;
	//结束时间	证书上的结业时间（培训结束时间）
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date endTime;
	
	//证书二维码地址
	String qrpath;
	
	//报名老师/机构 todo
	
	//学费  todo
	
	//类型
	String type;
	//证书编号
	String number;
	//姓名
	String name;
	//手机号码
	String phone;
	//是否已查询
	String isquery;
	//已查询次数
	int queryTimes;
	//首次查询日期
	Date firstDate;
	//最后一次查询日期
	Date lastDate;
	//备注
	String memo;
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	 
	public String getIsquery() {
		return isquery;
	}
	public void setIsquery(String isquery) {
		this.isquery = isquery;
	}
	public int getQueryTimes() {
		return queryTimes;
	}
	public void setQueryTimes(int queryTimes) {
		this.queryTimes = queryTimes;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public Date getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(Date firstDate) {
		this.firstDate = firstDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public FrmCertificate() {
	}
	
	
	public String getSignTeacher() {
		return signTeacher;
	}
	public void setSignTeacher(String signTeacher) {
		this.signTeacher = signTeacher;
	}
	public String getQrpath() {
		return qrpath;
	}
	public void setQrpath(String qrpath) {
		this.qrpath = qrpath;
	}
	@Override
	public String toString() {
		return "FrmCertificate [id=" + id + ", title=" + title + ", type=" + type + ", number=" + number + ", name="
				+ name + ", phone=" + phone + ", isquery=" + isquery + ", queryTimes=" + queryTimes + ", firstDate="
				+ firstDate + ", lastDate=" + lastDate + ", memo=" + memo + "]";
	}
	
	
}
