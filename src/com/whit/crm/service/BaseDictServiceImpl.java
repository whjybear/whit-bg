package com.whit.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whit.crm.mapper.BaseDictDao;
import com.whit.crm.pojo.BaseDict;

@Service
//@Transactional
public class BaseDictServiceImpl implements BaseDictService {

	
	@Autowired
	private BaseDictDao baseDictDao;

	public List<BaseDict> selectBaseDictListByCode(String code) {
		// TODO Auto-generated method stub
		return baseDictDao.selectBaseDictListByCode(code);
	}

	@Override
	public void updateBaseDictById(BaseDict baseDict) {
		// TODO Auto-generated method stub
		baseDictDao.updateBaseDictById(baseDict);
	}
	
	@Override
	public void insertBaseDictByNameAndPic(BaseDict baseDict) {
		// TODO Auto-generated method stub
		 baseDictDao.insertBaseDictByNameAndPic(baseDict); 
	}

	@Override
	public List<BaseDict> selectSignIdAndTitle(String edit_id, String edit_title) {
		// TODO Auto-generated method stub
		return baseDictDao.selectSignIdAndTitle(edit_id,edit_title);
	}

	@Override
	public BaseDict selectBaseDictById(Integer id) {
		// TODO Auto-generated method stub
		return baseDictDao.selectBaseDictById(id);
	}
	
	
	
	
}
