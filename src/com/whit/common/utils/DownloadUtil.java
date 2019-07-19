package com.whit.common.utils;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * 下载文件的工具包
 * @author mano233
 */
public class DownloadUtil {
    /**
     * 下载文件
     * @param file 要下载的文件
     * @return 返回ResponseEntity
     * @throws Exception 如果失败则抛出异常
     */
    public static ResponseEntity<Resource> downloadResponse(File file) throws Exception {
        String fileName = file.getName();
        Resource body = new FileSystemResource(file);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String header = request.getHeader("User-Agent").toUpperCase();
        HttpStatus status = HttpStatus.CREATED;
        try { 
            if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
                fileName = URLEncoder.encode(fileName, "utf-8");
                // IE下载文件名空格变+号问题
                fileName = fileName.replace("+", "%20");
                status = HttpStatus.OK;
            } else {
                fileName = new String(fileName.getBytes(StandardCharsets.UTF_8), "ISO8859-1");
            }
        } catch (UnsupportedEncodingException e) {
            throw new Exception("UnsupportedEncoding");
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentLength(file.length());
        return new ResponseEntity<Resource>(body, headers, status);
    }
}
