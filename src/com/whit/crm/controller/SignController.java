package com.whit.crm.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	/**
	 * 更新和新增签名
	 * 
	 * @param item
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sign/updata.action")
	public String updateItemById(QueryVo queryVo, @RequestParam(required=false) MultipartFile pictureFile) throws Exception {
		//如果文件不为空，且文件是图片，且大小格式符合要求
		if(pictureFile!=null && pictureFile.getSize() > 0) {
			// 图片上传
			// 设置图片名称，不能重复，可以使用uuid
			String picName = UUID.randomUUID().toString().replaceAll("-", "");
			// 获取文件名
			String oriName = pictureFile.getOriginalFilename();
			// 获取图片后缀
			String extName = oriName.substring(oriName.lastIndexOf("."));
			// 开始上传
			//这里可以获得应用程序的所在位置(web上)
			pictureFile.transferTo(new File("/Users/bear/upload/" + picName + extName));
				
			// 设置图片名到商品中
//			queryVo.getItem().setPic(picName + extName);
			queryVo.getBaseDict().setPic(picName + extName); 		//图片地址
			queryVo.getBaseDict().setDict_item_name(queryVo.getSignTeacher()); //签名老师姓名
			queryVo.getBaseDict().setDict_id(queryVo.getDict_id());  //签名老师ID
			//20001 20002  dict_id  这个
			
		}
		
		// ---------------------------------------------
		// 更新商品 
		this.baseDictService.insertBaseDictByNameAndPic(queryVo.getBaseDict());

		//返回签名证书列表
		return "forward:/sign/list";
//		return "redirect:/itemEdit.action?id=" + vo.getItems().getId();
	}
	
	//检查签名是否重复
	@RequestMapping(value = "/sign/checkNumber.action")
	public @ResponseBody
	String checkNumber(String edit_id,String edit_title){
//		System.out.println("edit_id......" + edit_id);
//		System.out.println("edit_title......" + edit_title);
		if(baseDictService.selectSignIdAndTitle(edit_id,edit_title)!=null && baseDictService.selectSignIdAndTitle(edit_id,edit_title).size()>0) {
			return "nook";
		}else {
			return "ok";
		}
		
	}
	
	@RequestMapping(value = "/sign/edit.action")
	public @ResponseBody BaseDict edit(Integer id) {
//		System.out.println("edit......" + id);
//		System.out.println(baseDictService.selectBaseDictById(id));
		return baseDictService.selectBaseDictById(id);

	}
	
	
}
