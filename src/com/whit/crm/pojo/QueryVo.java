package com.whit.crm.pojo;

public class QueryVo {
	
	private BaseDict baseDict;
	
	//客户名称
	private String custName;
	private String custSource;
	private String custIndustry;
	private String custLevel;
	
	//当前页
	private Integer page;
	//每页数
	private Integer size = 10; 
	//开始行
	private Integer startRow = 0;
	
	//证书查询条件
	String name;	//姓名
	String isquery;	//查询状态
	String phone;	//手机号码
	String number; 	//证书号码
	
	String title; 	//课程名称
	String signTeacher ; //签名老师
	
	String dict_id; //签名老师ID
	
	public String getDict_id() {
		return dict_id;
	}
	public void setDict_id(String dict_id) {
		this.dict_id = dict_id;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	//
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustSource() {
		return custSource;
	}
	public void setCustSource(String custSource) {
		this.custSource = custSource;
	}
	public String getCustIndustry() {
		return custIndustry;
	}
	public void setCustIndustry(String custIndustry) {
		this.custIndustry = custIndustry;
	}
	public String getCustLevel() {
		return custLevel;
	}
	public void setCustLevel(String custLevel) {
		this.custLevel = custLevel;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsquery() {
		return isquery;
	}
	public void setIsquery(String isquery) {
		this.isquery = isquery;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSignTeacher() {
		return signTeacher;
	}
	public void setSignTeacher(String signTeacher) {
		this.signTeacher = signTeacher;
	}
	public BaseDict getBaseDict() {
		return baseDict;
	}
	public void setBaseDict(BaseDict baseDict) {
		this.baseDict = baseDict;
	}
	
	
}
