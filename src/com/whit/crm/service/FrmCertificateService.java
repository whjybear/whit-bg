package com.whit.crm.service;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import com.whit.common.utils.Page;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.FrmCertificateForExcel;
import com.whit.crm.pojo.QueryVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FrmCertificateService {
    /**
     * 通过ID查询证书
     *
     * @param id 证书id
     * @return 证书对象，没有则返回空
     */
    FrmCertificate selectFrmCertificateById(Integer id);

    /**
     * 通过四个条件 查询分页对象
     *
     * @param vo 查询的包装类
     * @return 符合条件的证书分页对象，如果没有查到，返回空
     */
    Page<FrmCertificate> selectPageByQueryVo(QueryVo vo);

    void updateFrmCertificateById(FrmCertificate frmCertificate);

    void deleteFrmCertificateById(Integer id);


    void insertFrmCertificateById(FrmCertificate frmCertificate);

    /**
     * app查询证书
     *
     * @param vo 查询的包装类
     * @return 符合条件的证书列表，如果没有查到，返回空 list
     */
    List<FrmCertificate> selectQueryVo(QueryVo vo);


    /**
     * app查询证书次数+1
     *
     * @param findCer FrmCertificate实例
     */
    void addQueryTimes(FrmCertificate findCer);


    /**
     * 根据number查询证书
     *
     * @param number 证书编号
     * @return 符合条件的证书列表，如果没有查到，返回空 list
     */
    List<FrmCertificate> selectFrmCertificateByNumber(String number);


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
    void exportFrmCertificateTemplate(FrmCertificate frmCertificate,HttpServletResponse response) throws Exception;
}
