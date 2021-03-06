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
		
		//app查询证书
		public List<FrmCertificate> selectQueryVo(QueryVo vo);
		
		//app查询证书次数+1
		public void addQueryTimes(FrmCertificate findCer);
		
		//根据number查询证书
		public List<FrmCertificate> selectFrmCertificateByNumber(String number);
		
		//根据姓名、证书名称、手机号查询证书
		public List<FrmCertificate> selectFrmCertificateByNameAndTitleAndPhone(String name, String title, String phone);
}
