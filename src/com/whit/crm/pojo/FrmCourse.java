package com.whit.crm.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 课程
 * @author bear
 *
 */
public class FrmCourse {
	//id  	key
	int id;
	//标题		-- 课程名称
	String title;
	
	//开课城市
	String city;
	
	//开始时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date startTime;
	
	//结束时间	证书上的结业时间（培训结束时间）
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date endTime;
	
	//证书二维码地址
	String qrpath;
	
	//报名老师/机构 
	EnterPerson enterPerson;
	
	//学费  todo
	int	price;

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

	public String getQrpath() {
		return qrpath;
	}

	public void setQrpath(String qrpath) {
		this.qrpath = qrpath;
	}

	public EnterPerson getEnterPerson() {
		return enterPerson;
	}

	public void setEnterPerson(EnterPerson enterPerson) {
		this.enterPerson = enterPerson;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
