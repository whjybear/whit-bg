package com.whit.crm.service;

import com.whit.common.utils.Page;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;

public interface FrmCertificateService {

		//通过ID查询证书
		public FrmCertificate selectFrmCertificateById(Integer id);
		
		 
		// 通过四个条件 查询分页对象
		public Page<FrmCertificate> selectPageByQueryVo(QueryVo vo);
		
		public void updateFrmCertificateById(FrmCertificate frmCertificate);
		
		public void deleteFrmCertificateById(Integer id);


		public void insertFrmCertificateById(FrmCertificate frmCertificate);
}