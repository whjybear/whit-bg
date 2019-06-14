package com.whit.crm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whit.common.utils.Page;
import com.whit.crm.pojo.BaseDict;
import com.whit.crm.pojo.Customer;
import com.whit.crm.pojo.FrmCertificate;
import com.whit.crm.pojo.QueryVo;
import com.whit.crm.service.BaseDictService;
import com.whit.crm.service.CustomerService;
import com.whit.crm.service.FrmCertificateService;

/**
 * 证书管理
 * 
 * @author bear
 *
 */
@Controller
public class FrmCertificateController {

	@Autowired
	private BaseDictService baseDictService;
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private FrmCertificateService frmCertificateService;
	
	//注解在成员变量上
	@Value("${fromType.code}")
	private String fromTypeCode;
	
	
	@RequestMapping(value = "frmCertificate/test1")
	@ResponseBody
	public FrmCertificate test1(Integer id) {
		
		return frmCertificateService.selectFrmCertificateById(id);
	}
	
//	@RequestMapping(value = "frmCertificate/test2")
//	@ResponseBody
//	public List<FrmCertificate> test2(QueryVo vo, Model model) {
//		
//		return frmCertificateService.selectFrmCertificateListByQueryVo(vo);
//	}
	
	// 入口
	@RequestMapping(value = "/frmCertificate/list")
	public String list(QueryVo vo, Model model) {
//		return "frmCertificate";
		
		return "login";
	}
	
	@RequestMapping(value = "/frmCertificate/listC")
	public String listC(QueryVo vo, Model model) {
		return "frmCertificate";
	}
	
	//登录验证
	@RequestMapping(value = "/frmCertificate/checkLogin")
	public void checkLogin(String username,String password,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		if("admin".equals(username) && "admin!@#$%admin".equals(password)) {
			req.getSession().setAttribute("loginUser", "loginUser");
			resp.sendRedirect("listC");
		}else {
			resp.sendRedirect("/whit-bg/");
		}
	}
	
	@RequestMapping(value = "frmCertificate/seller_1")
	public String seller_1(QueryVo vo, Model model) {
		return "seller_1";
	}
	
	//证书管理
	@RequestMapping(value = "/frmCertificate/frm")
	public String frm(QueryVo vo, Model model) {
		
		List<BaseDict> isQueryType = baseDictService.selectBaseDictListByCode("010");
		model.addAttribute("isQueryType", isQueryType);
		
		//授课老师选择（老师签名）
		List<BaseDict> teachersList = baseDictService.selectBaseDictListByCode("011");
		model.addAttribute("teachersList", teachersList);
		
		//通过四个条件  查询分页对象
		Page<FrmCertificate> page = frmCertificateService.selectPageByQueryVo(vo);
		model.addAttribute("page", page);
		model.addAttribute("name", vo.getName());
		model.addAttribute("phone", vo.getPhone());
		
		model.addAttribute("title", vo.getTitle());
		model.addAttribute("number", vo.getNumber());
		model.addAttribute("signTeacher", vo.getSignTeacher());
		
		System.out.println("page-size:" + page.getRows().size());
		return "frm";
	}
	
	@RequestMapping(value = "/frmCertificate/home")
	public String home(QueryVo vo, Model model) {
		
		//获取所有的证书
		List<BaseDict> fromType =  baseDictService.selectBaseDictListByCode(fromTypeCode);
		List<BaseDict> industryType = baseDictService.selectBaseDictListByCode("001");
		List<BaseDict> levelType = baseDictService.selectBaseDictListByCode("006");
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		
		
		//通过四个条件  查询分页对象
		Page<Customer> page = customerService.selectPageByQueryVo(vo);
		model.addAttribute("page", page);
		model.addAttribute("custName", vo.getCustName());
		model.addAttribute("custSource", vo.getCustSource());
		model.addAttribute("custIndustry", vo.getCustIndustry());
		model.addAttribute("custLevel", vo.getCustLevel());
		System.out.println("page-size:" + page.getRows().size());
		return "home";
	}
	
	//app证书查询
	@RequestMapping(value = "/frmCertificate/queryCer")
	@ResponseBody
	public  FrmCertificate queryCer(QueryVo vo, Model model) {
//		String name;	//姓名		查询条件1 或
//		String number; 	//证书号码	查询条件2
		//
		if(vo.getName() == null && vo.getNumber() == null) {
			//没有任何查询条件返回空
			return null;
		}
		if(vo.getName() == "" && vo.getNumber() == null) {
			return null;
		}
		if(vo.getName() == null && vo.getNumber() == "") {
			return null;
		}
		
		List<FrmCertificate> selectQueryVo = frmCertificateService.selectQueryVo(vo);
		if(selectQueryVo != null) {
			System.out.println("selectQueryVo.size()=======" + selectQueryVo.size());
			//如果size>=1,返回第一个证书（一个人有多个证书的情况），后期考虑在app端列表的方式呈现
			if(selectQueryVo.size() >= 1) {
				FrmCertificate findCer = selectQueryVo.get(0);
				//增加该证书的查询次数，保存
				frmCertificateService.addQueryTimes(findCer);
				System.out.println("增加查询次数1");
				//该证书的查询次数加1后返回app
				findCer.setQueryTimes(findCer.getQueryTimes()+1);
				
				return findCer;
			}
		}else {
			System.out.println("selectQueryVo=======null");
			return null;
		}
		return null;
	}
	
	@RequestMapping(value = "/frmCertificate/seller")
	public String seller(QueryVo vo, Model model) {
		return "seller";
	}
	
	@RequestMapping(value = "/frmCertificate/brand")
	public String brand(QueryVo vo, Model model) {
		return "brand";
	}
	
	@RequestMapping(value = "/frmCertificate/specification")
	public String specification(QueryVo vo, Model model) {
		return "specification";
	}
	
	@RequestMapping(value = "/frmCertificate/type_template")
	public String type_template(QueryVo vo, Model model) {
		return "type_template";
	}
	
	
	@RequestMapping(value = "/frmCertificate/item_cat")
	public String item_cat(QueryVo vo, Model model) {
		return "item_cat";
	}
	
	@RequestMapping(value = "/frmCertificate/goods")
	public String goods(QueryVo vo, Model model) {
		return "goods";
	}
	
	@RequestMapping(value = "/frmCertificate/content_category")
	public String content_category(QueryVo vo, Model model) {
		return "content_category";
	}
	
	@RequestMapping(value = "/frmCertificate/content")
	public String content(QueryVo vo, Model model) {
		return "content";
	}
	
	@RequestMapping(value = "/frmCertificate/a1")
	@ResponseBody
	public String lista1(QueryVo vo, Model model) {
		System.out.println("a1");
		  

//		return "frmCertificate";
		return "a1";
	}
	
	@RequestMapping(value = "/frmCertificate/a2")
	@ResponseBody
	public String lista2(QueryVo vo, Model model) {
		System.out.println("a2");
		return "a2";
	}
	
	//去修改页面
	@RequestMapping(value = "/frmCertificate/checkNumber.action")
	public @ResponseBody
	String checkNumber(String number){
		System.out.println("number......" + number);
//		System.out.println(frmCertificateService.selectFrmCertificateByNumber(number));
		if(frmCertificateService.selectFrmCertificateByNumber(number)!=null && frmCertificateService.selectFrmCertificateByNumber(number).size()>0) {
			return "nook";
		}else {
			return "ok";
		}
		
	}
	//去修改页面
	@RequestMapping(value = "/frmCertificate/edit.action")
	public @ResponseBody
	FrmCertificate edit(Integer id){
		System.out.println("edit......" + id);
		System.out.println(frmCertificateService.selectFrmCertificateById(id));
		return frmCertificateService.selectFrmCertificateById(id);
		
	}
	//修改保存 + 新建
	@RequestMapping(value = "/frmCertificate/update.action")
	public @ResponseBody
	String update(FrmCertificate frmCertificate){
		System.out.println("---------------------frmCertificate.getId()" + frmCertificate.getId());
		System.out.println("frmCertificate.getEndTime().toLocaleString()"+ frmCertificate.getEndTime().toLocaleString());
		if(frmCertificate.getId() == 0) {
			//新建
			frmCertificateService.insertFrmCertificateById(frmCertificate);
			return "OK";
		}
		//修改
		frmCertificateService.updateFrmCertificateById(frmCertificate);
		return "OK";
	}
	
	//删除
	@RequestMapping(value = "/frmCertificate/delete.action")
	public @ResponseBody
	String delete(Integer id){
		//删除
		frmCertificateService.deleteFrmCertificateById(id);
		return "OK";
	}
	
	@RequestMapping(value = "/frmCertificate/a3")
	@ResponseBody
	public String lista3(QueryVo vo, Model model) {
		System.out.println("a3");
		return "a3";
	}

}
