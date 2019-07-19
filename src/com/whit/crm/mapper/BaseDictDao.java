package com.whit.crm.mapper;

import java.util.List;

import com.whit.crm.pojo.BaseDict;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;

public interface BaseDictDao {

	
	//查询
	public List<BaseDict> selectBaseDictListByCode(String code);
	
	//总条数
	public Integer frmCertificateCountByQueryVo(QueryVo vo);
	
	//结果集
	public List<FrmCertificate> selectFrmCertificateListByQueryVo(QueryVo vo);

	public int updateBaseDictById(BaseDict baseDict);
	
	//新增签名证书
	public void insertBaseDictByNameAndPic(BaseDict baseDict);

	//根据id和姓名查询签名
	public List<BaseDict> selectSignIdAndTitle(String edit_id, String edit_title);

	public BaseDict selectBaseDictById(Integer id);
}
