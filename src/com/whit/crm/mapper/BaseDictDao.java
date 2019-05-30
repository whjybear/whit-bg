package com.whit.crm.mapper;

import java.util.List;

import com.whit.crm.pojo.BaseDict;

public interface BaseDictDao {

	
	//查询
	public List<BaseDict> selectBaseDictListByCode(String code);
}
