package com.whit.crm.service;

import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.FrmCertificateForExcel;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

public interface ExcelService {

    /**
     * 根据excel模板文件，导入到数据库
     * @param fileName 文件名
     * @param inputStream 文件输入流
     * @return 返回一个证书的集合，用于回显到页面上
     * @throws Exception 抛出异常
     */
    List<FrmCertificateForExcel> insertFrmCertificateByExcel(String fileName, InputStream inputStream) throws Exception;

    /**
     * 导出excel模版
     * @param frmCertificate 导出模版用的字段
     * @param response response域用于写入文件
     * @throws Exception 如果有异常则抛出
     */
    void exportFrmCertificateTemplate(FrmCertificate frmCertificate, HttpServletResponse response) throws Exception;
}
