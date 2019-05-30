package com.whit.crm.service;

import java.util.List;

import com.whit.crm.pojo.BaseDict;

public interface BaseDictService {

	
	//查询
	public List<BaseDict> selectBaseDictListByCode(String code);
}
