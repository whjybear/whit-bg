package com.whit.crm.service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;

import com.whit.crm.pojo.FrmCertificateForExcel;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whit.common.utils.Page;
import com.whit.crm.mapper.FrmCertificateDao;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class FrmCertificateServiceImpl implements FrmCertificateService {

    @Autowired
    private FrmCertificateDao frmCertificateDao;

    @Override
    public FrmCertificate selectFrmCertificateById(Integer id) {
//		FrmCertificate f = new FrmCertificate();
//		f.setId(343);
//		f.setName("哈哈");
        FrmCertificate f = frmCertificateDao.selectFrmCertificateById(id);
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
                vo.setStartRow((vo.getPage() - 1) * vo.getSize());
            }
            if (null != vo.getName() && !"".equals(vo.getName().trim())) {
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

    @Override
    public List<FrmCertificate> selectQueryVo(QueryVo vo) {
        return frmCertificateDao.selectQueryVo(vo);
    }

    @Override
    public void addQueryTimes(FrmCertificate findCer) {
        frmCertificateDao.addQueryTimes(findCer);
    }

    //根据number查询证书
    @Override
    public List<FrmCertificate> selectFrmCertificateByNumber(String number) {
        return frmCertificateDao.selectFrmCertificateByNumber(number);
    }

}
