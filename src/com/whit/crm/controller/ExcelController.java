package com.whit.crm.controller;

import com.whit.crm.pojo.QueryVo;
import com.whit.crm.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
/**
 * @author likang
 */
@Controller
public class ExcelController {
    private ExcelService excelService;

    @Autowired
    public ExcelController(ExcelService excelService) {
        this.excelService = excelService;
    }

    /**
     * 获取excel模版
     */
    @RequestMapping(value = "/frmCertificate/getExcelTemplate.action", method = RequestMethod.GET)
    @ResponseBody
    public void downLoadExcelTemplate(QueryVo vo, HttpServletResponse response) {

        try {
           excelService.exportFrmCertificateTemplate(null, response);
        } catch (Exception e) {
            // todo 异常处理
        }
    }

    /**
     * 跳转到批量操作页面
     *
     * @return jsp页面
     */
    @RequestMapping(value = "/frmCertificate/batchAction")
    public String batchAction() {
        return "batchAction";
    }

}
