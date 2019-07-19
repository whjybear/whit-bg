let dialog,// （DOM）弹窗
	  cer_id,// （DOM）证书编号的input框
	  cer_name,// （DOM）学员姓名的input框
	  form_box_down,// （DOM）表单的下半部分，用于显示证书详情
	  infoImg,// （String）证书图片Base64
	  imgBox,// （DOM）证书大图的DOM
	  bigImg,// （String）证书大图的Base64
	  isLoading = false;// （Boolen）正在加载
window.onload = function() {
	// 一些变量的赋值
	const btn_post = document.getElementById('button-post');
	const btn_clear = document.getElementById('button-clear');
	const dialog_cancel_btn = document.getElementById('dialog-cancel-btn');
	dialog = document.getElementsByClassName('dialog-mask')[0];
	form_box_down = document.getElementById('form-box-down');
	cer_id = document.getElementById('cer-id');
	cer_name = document.getElementById('cer-name');
	
	// 给消息弹窗中的关闭按钮添加关闭弹窗的事件
	dialog_cancel_btn.onclick = closeErrorMsg;
	infoImg = document.getElementById('info-img');
	// 给证书详情图片添加点击放大事件
	infoImg.onclick = showBigImg;
	bigImg = document.getElementById('big-img');
	imgBox = document.getElementsByClassName('dialog-mask')[2];
	// 给证书大图添加关闭事件
	imgBox.onclick = closeBigImg;
	// 给清空按钮添加事件
	btn_clear.onclick = clearInput;
	// iPhone微信内置浏览器中fetch请求好像有点问题，提示用户
	if (isWeixinBrowser()) {
		showErrorMsg('苹果手机请点击右上角选择在Safari中打开查询！');
	} else {
		// 给确定按钮添加点击事件
		btn_post.onclick = clickOk;
	}
};
/**
 * 检查是否是iPhone微信内置浏览器
 */
function isWeixinBrowser() {
	return /micromessenger/.test(navigator.userAgent.toLowerCase()) && /iphone/.test(navigator.userAgent.toLowerCase())
}

/**
 * 点击确认按钮触发的函数
 */
function clickOk() {
	if (isWeixinBrowser()) {
		showErrorMsg('苹果手机请点击右上角选择在Safari中打开查询！');
		return;
	}
	// 检查输入合法性
	const number = cer_id.value.trim();
	const name = cer_name.value.trim();
	if (number === '' && name === '') {
		showErrorMsg('请至少输入证书编号或学员姓名中的任意一项！');
		return;
	}
	getInfo({
		name,
		number
	});

}
/**
 * 显示预览大图
 */
function showBigImg() {
	imgBox.style.display = 'flex';
}
/**
 * 关闭预览大图
 */
function closeBigImg() {
	imgBox.style.display = 'none';
}

/**
 * 显示错误信息
 * @param {string} msg 错误的信息
 */
function showErrorMsg(msg) {
	if(isLoading){
		// closeLoading(true);
	}
	dialog.style.display = 'flex';
	const error_msg = document.getElementById('error-msg');
	error_msg.innerText = msg;
}

/**
 * 关闭errorMsg弹窗
 */
function closeErrorMsg() {
	dialog.style.display = 'none';
}

/**
 * 显示加载动画
 * @param {String} msg 加载时显示的文本信息
 */
function showLoading(msg) {
	const div = document.getElementById('loading');
	const loadingText = document.getElementById("loadingText");
	div.style.display = 'flex';
	loadingText.innerHTML = msg.toString();
	isLoading = true;
}

/**
 * 关闭加载动画
 */
function closeLoading(quick) {
	const div = document.getElementById('loading');
	isloading = false;
	// 如果有这个参数，则立即关闭加载动画，否则延迟300ms后关闭
	if(quick){
		div.style.display = 'none';
	}else{
		setTimeout(function() {
			div.style.display = 'none';
		}, 300);
	}
}

/**
 * 关闭下面的证书详情显示
 */
function closeInfo() {
	form_box_down.style.display = 'none';
}

/**
 * 显示证书详情
 * @param {Object} data 要显示的数据
 */
function showInfo(data) {
	return drawCerImg(data).then(function(base64) {
		infoImg.src = base64;
		bigImg.src = base64;
		form_box_down.style.display = 'block';
		document.getElementById('query-times').innerText = '此证书为真，该证书被查' + data.queryTimes + '次';
	});
}

/**
 * 请求接口获取证书信息
 */
function getInfo(params) {
	// 隐藏下面的证书详情
	closeInfo();
	// 去除空格
	const number = cer_id.value.trim();
	const name = cer_name.value.trim();
	// 检查是否为空
	if (number === '' && name === '') {
		showErrorMsg('请至少输入证书编号或学员姓名中的任意一项！');
		return;
	}
	// 定义url
	let url = 'http://cert.fmrplus.com/frmCertificate/queryCer';
	// 拼接参数
	if (params) {
		let paramsArray = [];
		//拼接参数
		Object.keys(params).forEach(key => paramsArray.push(key + '=' + params[key]))
		if (url.search(/\?/) === -1) {
			url += '?' + paramsArray.join('&')
		} else {
			url += '&' + paramsArray.join('&')
		}
	}
	// 显示加载动画
	// showLoading('飞速处理中，请稍后...');
	// 网络请求
	fetch(url, {
		method: 'GET',
	}).then(function(response) {
		response.json().then(function(data) {
			// 显示加载中动画
			//showLoading('证书较大，预计处理5秒钟，请稍后...');
			showInfo(data).then(function(){
				// 关闭加载动画
				// closeLoading();
			});
			// 开始加载字体
			// const myFont1 = new FontFace('TengXiang', 'url(./font/TengXiang.ttf)');
			// myFont1.load().then(function(font) {
			// 	document.fonts.add(font);
			// 	const myFont2 = new FontFace('HanWang', 'url(./font/HanWangShinSuMedium.ttf)');
			// 	myFont2.load().then(function(font) {
			// 		document.fonts.add(font);
			// 		// 结束字体加载，关闭加载中动画
			// 		closeLoading();
			// 		// 显示证书详情
			// 		showInfo(data);
			// 	})
			// });
		}).catch(function(error) {
			showErrorMsg('查询不到结果，请检查输入的编号或者姓名！');
		});
	}).catch(function(error) {
		showErrorMsg('网络故障，请检查网络后重试。');
	});
}

/**
 * 清空输入的值
 */
function clearInput() {
	cer_id.value = '';
	cer_name.value = '';
	// 关闭下面的证书详情
	closeInfo();
}

/**
 * 更具data数据绘制证书
 * @param {Object} data data
 */
function drawCerImg(data) {
	return new Promise(function(resolve, reject) {
		// 创建画布
		const canvas = document.createElement('canvas');
		// 设置画布宽高
		canvas.width = 876;
		canvas.height = 620;
		if (canvas.getContext) {
			// 获取画布
			const ctx = canvas.getContext('2d');
			// 创建图片
			let img = new Image();
			// 根据不同的签名选择不同的背景图片
			if (data.signTeacher === "20002") {
				img.src = './img/info2.jpg';
			} else {
				img.src = './img/info.jpg';
			}
			// 设置跨域，防止图片无法加载的问题
			img.crossOrigin = "Anonymous";
			// 图片加载完成，则在画布上写入文本信息，最终返回画布的base64
			img.onload = function() {
				// 设置背景
				ctx.drawImage(img, 0, 0);
				// 用户名部分
				ctx.font = '400 24px 黑体';
				// 设置文字居中
				ctx.textAlign='center';
				ctx.fillText(data.name, 440, 258);
				ctx.font = '400 20px 黑体';
				ctx.textAlign='left';
				// 证书标题部分，以17个字符分割，换行显示
				ctx.fillText(data.title.slice(0, 17), 378, 308);
				ctx.fillText(data.title.slice(17), 140, 342);
				// 证书日期部分
				const date = new Date(data.endTime);
				const year = date.getFullYear();
				const month = date.getMonth() + 1;
				const day = date.getDate();
				ctx.font = 'lighter 18px Times New Roman';
				ctx.textAlign='center';
				ctx.fillText(year + '-' + month + '-' + day, 180, 514);
				// 证书编号部分
				ctx.textAlign='center';
				ctx.font = 'lighter 12px Times New Roman';
				ctx.fillText('NO.'+data.number, 600, 560);
				// 返回base64字符串
				resolve(canvas.toDataURL());
			}
		} else {
			reject();
		}
	})
}
