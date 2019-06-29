package com.whit.crm.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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

@Service
public class FrmCertificateServiceImpl implements FrmCertificateService {
    private static final String XSSF_STR = "xlsx";
    private static final String HSSF_STR = "xls";

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

    @Override
    public void insertFrmCertificateByExcel(File file) throws Exception {

    }

    @Override
    public File exportFrmCertificateTemplate() throws Exception {
        return null;
    }

    private Workbook getWriteWorkBoolType(String filePath) throws Exception {
        if (filePath.toLowerCase().endsWith(XSSF_STR)) {
            return new XSSFWorkbook();
        } else if (filePath.toLowerCase().endsWith(HSSF_STR)) {
            return new HSSFWorkbook();
        } else {
            //抛出自定的业务异常
            throw new Exception("读取excel文件错误");
        }
    }

    private void writeExcel(String filePath,List<FrmCertificate> certificates) throws Exception {
        Workbook workbook = null;
        FileOutputStream fos = null;

        workbook = getWriteWorkBoolType(filePath);

        //创建sheet
        Sheet sheet = workbook.createSheet("证书表");
        //在sheet第一行写出表单的各个字段名
        Row titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("列1");
        titleRow.createCell(1).setCellValue("列2");
        titleRow.createCell(2).setCellValue("列3");
        titleRow.createCell(2).setCellValue("列4");
        titleRow.createCell(2).setCellValue("列5");

        //每行的单元格一次写入
        // Integer rowIndex = contents.size();
        // for (int i = 0; i < rowIndex; i++) {
        //     //第1行作为表格列名，所以从第2行开始读取
        //     Row row = sheet.createRow(i + 1);
        //     Cell cellTenantId = row.createCell(0);
        //     cellTenantId.setCellValue(contents.get(i).getTenantId());
        //     Cell cellPoiId = row.createCell(1);
        //     cellPoiId.setCellValue(contents.get(i).getMerchantId());
        //     Cell cellStatus = row.createCell(2);
        //     cellStatus.setCellValue(contents.get(i).getMerchantStatus());
        // }

        //写入到文件流中
        // try {
        //     File file = new File(ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/"));
        //     fos = new FileOutputStream(ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/"));
        //     workbook.write(fos);
        // } catch (IOException e) {
        //     throw new Exception(e.getMessage());
        // } finally {
        //     IOUtils.closeQuietly(workbook);
        // }
    }

}
