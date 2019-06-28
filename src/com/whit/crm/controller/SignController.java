package com.whit.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.whit.common.utils.Page;
import com.whit.crm.pojo.BaseDict;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;
import com.whit.crm.service.BaseDictService;

@Controller
public class SignController {

	@Autowired
	private BaseDictService baseDictService;

	// 签名管理
	@RequestMapping(value = "/sign/list")
	public String frm(QueryVo vo, Model model) {

		// 授课老师选择（老师签名）
		List<BaseDict> teachersList = baseDictService.selectBaseDictListByCode("011");
		model.addAttribute("teachersList", teachersList);
		
		

		// 通过四个条件 查询分页对象
//		Page<FrmCertificate> page = frmCertificateService.selectPageByQueryVo(vo);
//		
//		
//		model.addAttribute("page", page);
//		model.addAttribute("name", vo.getName());
//		model.addAttribute("phone", vo.getPhone());
//
//		model.addAttribute("title", vo.getTitle());
//		model.addAttribute("number", vo.getNumber());
//		model.addAttribute("signTeacher", vo.getSignTeacher());
//
//		System.out.println("page-size:" + page.getRows().size());
		return "sign";
	}
}
