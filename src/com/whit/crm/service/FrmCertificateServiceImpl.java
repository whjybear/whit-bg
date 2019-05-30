package com.whit.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whit.common.utils.Page;
import com.whit.crm.mapper.FrmCertificateDao;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;

@Service
public class FrmCertificateServiceImpl implements FrmCertificateService{

	@Autowired
	private FrmCertificateDao frmCertificateDao;
	
	@Override
	public FrmCertificate selectFrmCertificateById(Integer id) {
//		FrmCertificate f = new FrmCertificate();
//		f.setId(343);
//		f.setName("哈哈");
		FrmCertificate f  = frmCertificateDao.selectFrmCertificateById(id);
		return f;
	}

	 

	
	// 通过四个条件 查询分页对象
		@Override
		public Page<FrmCertificate> selectPageByQueryVo(QueryVo vo) {
			Page<FrmCertificate> page = new Page<FrmCertificate>();
			//每页数
			page.setSize(8);
			vo.setSize(8);
			if (null != vo) {
				// 判断当前页
				if (null != vo.getPage()) {
					page.setPage(vo.getPage());
					vo.setStartRow((vo.getPage() -1)*vo.getSize());
				}
				if(null != vo.getName() && !"".equals(vo.getName().trim())){
					vo.setName(vo.getName().trim());
				}
				
				//总条数
				page.setTotal(frmCertificateDao.frmCertificateCountByQueryVo(vo));
				page.setRows(frmCertificateDao.selectFrmCertificateListByQueryVo(vo));
			}
			return page;

		}

		@Override
		public void updateFrmCertificateById(FrmCertificate frmCertificate) {
			frmCertificateDao.updateFrmCertificateById(frmCertificate);
		}


		@Override
		public void deleteFrmCertificateById(Integer id) {
			frmCertificateDao.deleteFrmCertificateById(id);
		}


		@Override
		public void insertFrmCertificateById(FrmCertificate frmCertificate) {
			frmCertificateDao.insertFrmCertificateById(frmCertificate);
		}

}
