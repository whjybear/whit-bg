package com.whit.crm.service;

import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.FrmCertificateForExcel;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {
    private static final String XSSF_STR = "xlsx";
    private static final String HSSF_STR = "xls";
    /**
     * 根据excel模板文件，导入到数据库
     * @param fileName 文件名
     * @param inputStream 文件输入流
     * @return 返回一个证书的集合，用于回显到页面上
     * @throws Exception 抛出异常
     */
    @Override
    public List<FrmCertificateForExcel> insertFrmCertificateByExcel(String fileName, InputStream inputStream) throws Exception {
        return null;
    }

    /**
     * 导出excel模板文件
     * @param frmCertificate 导出模版用的字段
     * @param response response域，用于写入文件
     * @throws Exception 如果写入失败则抛出异常
     */
    @Override
    public void exportFrmCertificateTemplate(FrmCertificate frmCertificate, HttpServletResponse response) throws Exception {
        String fileName = "证书模板文件.xls";
        Workbook workbook = getWriteWorkBoolType(fileName);
        CreationHelper createHelper = workbook.getCreationHelper();
        // 创建sheet
        Sheet sheet = workbook.createSheet("证书表");
        // 在证书表第一行写入表单的各个字段名
        Row titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("签名教师");
        titleRow.createCell(1).setCellValue("学员姓名");
        titleRow.createCell(2).setCellValue("证书编号");
        titleRow.createCell(3).setCellValue("课程名称");
        titleRow.createCell(4).setCellValue("课程结束日期");
        titleRow.createCell(5).setCellValue("手机号码");

        // 在第二行中写入模版字段
        Row tempRow = sheet.createRow(1);
        CellStyle dateStyle = workbook.createCellStyle();
        dateStyle.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-MM-dd"));
        CellStyle textStyle = workbook.createCellStyle();
        textStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("text"));
        tempRow.createCell(0).setCellValue("教师1");
        tempRow.createCell(1).setCellValue("姓名1");
        tempRow.createCell(2).setCellValue("XD12545675");
        tempRow.createCell(3).setCellValue("课程名称1");
        Cell dateCell = tempRow.createCell(4);
        dateCell.setCellValue(new Date());
        dateCell.setCellStyle(dateStyle);
        Cell phoneCell = tempRow.createCell(5);
        phoneCell.setCellStyle(textStyle);
        phoneCell.setCellValue("185697542");
        try (OutputStream os = response.getOutputStream()) {
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/vnd.ms-excel");
            // 解决文件名乱码
            response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes(StandardCharsets.UTF_8), "ISO8859-1"));
            // 写入到response流中
            workbook.write(os);
        } catch (IOException e) {
            throw new Exception(e.getMessage());
        } finally {
            IOUtils.closeQuietly(workbook);
        }
    }

    /**
     * 依据文件路径或者文件名来选择合适的excel Workbook类型
     * @param filePath 文件路径或者文件名
     * @return 返回excel Workbook
     * @throws Exception 抛出异常
     */
    private Workbook getWriteWorkBoolType(String filePath) throws Exception {
        if (filePath.toLowerCase().endsWith(XSSF_STR)) {
            return new XSSFWorkbook();
        } else if (filePath.toLowerCase().endsWith(HSSF_STR)) {
            return new HSSFWorkbook();
        } else {
            throw new Exception("读取excel文件错误");
        }
    }

    /**
     * 依据文件名和输入流选择合适的Workbook
     * @param fileName 文件名
     * @param is 输入流
     * @return 返回一个Workbook
     * @throws Exception 抛出异常
     */
    private Workbook getReadWorkBookType(String fileName,InputStream is) throws Exception {
        try {
            if (fileName.toLowerCase().endsWith("xlsx")) {
                return new XSSFWorkbook(is);
            } else if (fileName.toLowerCase().endsWith("xls")) {
                return new HSSFWorkbook(is);
            } else {
                throw new Exception("excel格式文件错误");
            }
        } catch (IOException e) {
            //  抛出自定义的业务异常
            throw new Exception(e.getMessage());
        } finally {
            IOUtils.closeQuietly(is);
        }
    }

    /**
     * 进行证书字段的验证
     * @param frmCertificateList 证书集合
     * @return 返回一个布尔
     */
    private boolean checkImportValue(List<FrmCertificate> frmCertificateList){
        // todo 完善验证逻辑
        return true;
    }
}
