package com.whit.crm.service;

import java.io.File;
import java.util.List;

import com.whit.common.utils.Page;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;
import org.springframework.web.multipart.MultipartFile;

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
     * 根据excel文档批量导入证书
     *
     * @param file 要导入的excel文档
     * @throws Exception ex
     */
    void insertFrmCertificateByExcel(File file) throws Exception;

    /**
     * 导出excel模版
     *
     * @return file
     * @throws Exception ex
     */
    File exportFrmCertificateTemplate() throws Exception;
}
