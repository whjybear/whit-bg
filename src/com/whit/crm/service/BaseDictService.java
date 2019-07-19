package com.whit.crm.service;

import java.util.List;

import com.whit.crm.pojo.BaseDict;

public interface BaseDictService {

	
	//查询
	public List<BaseDict> selectBaseDictListByCode(String code);
	
	//修改、新增 签名图片
	public void updateBaseDictById(BaseDict baseDict);
	
	//新增教师签名
	void insertBaseDictByNameAndPic(BaseDict baseDict);
	
	//根据id和姓名查询签名
	public List<BaseDict> selectSignIdAndTitle(String edit_id, String edit_title);

	public BaseDict selectBaseDictById(Integer id);
}
