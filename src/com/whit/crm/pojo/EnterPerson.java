package com.whit.crm.pojo;
/**
 * 报名机构（老师）
 * @author bear
 *
 */
public class EnterPerson {
	//id  	key
	int id;
	//标题		-- 报名机构（老师）名称
	String title;
	
	String phone;	//联系方式
	
	String address;	//地址

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
