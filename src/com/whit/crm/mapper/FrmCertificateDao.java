package com.whit.crm.mapper;

import java.util.List;

import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;

public interface FrmCertificateDao {

	
		//通过ID查询证书
		public FrmCertificate selectFrmCertificateById(Integer id);
		
		//总条数
		public Integer frmCertificateCountByQueryVo(QueryVo vo);
		
		//结果集
		public List<FrmCertificate> selectFrmCertificateListByQueryVo(QueryVo vo);
		
		//修改
		public void updateFrmCertificateById(FrmCertificate frmCertificate);
		
		//通过ID 删除
		public void deleteFrmCertificateById(Integer id);
		
		//新增
		public void insertFrmCertificateById(FrmCertificate frmCertificate);
}
